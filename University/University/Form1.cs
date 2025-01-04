using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace University
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        SqlConnection conn = new SqlConnection(
            "Data Source=Hakan\\SQLEXPRESS;" +
            "Initial Catalog=University; " +
            "Integrated Security= True"
            );

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "select Id, Name, Phone, Email from Student " +
                "where Name='" + textBox4.Text + "'";
            DataSet ds = SendList(query);
            dataGridView1.DataSource = ds.Tables[0];
        }

        DataSet SendList(string query)
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            // SQL DataAdapter DataSet
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            listBox1.Items.Clear();
            int id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());
            string query = "select lesson.name from Student, lesson, Program, LessonProgram " +
                "where student.ID=" + id + " and student.programId=program.ID and" +
                " program.ID=lessonprogram.programId and lesson.Id=lessonprogram.LessonId";
            DataSet ds = SendList(query);
            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                listBox1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }

            textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();

            string oldName = textBox4.Text; // Assuming textBox4 holds the old name
            string newName = textBox1.Text; // Assuming textBox1 holds the new name
            string phone = textBox2.Text;
            string email = textBox3.Text;

            string query = "UPDATE Student SET Name = @newName, Phone = @phone, Email = @email WHERE Name = @oldName";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@newName", newName);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@oldName", oldName);

            cmd.ExecuteNonQuery();

            MessageBox.Show("Operation Successful...");
        }

    }
}
