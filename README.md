# Project-SQL_Database-manipulation
The database design below is used to develop the database in the Project

![markdown](https://drive.google.com/file/d/1qzuWX-WNGKmLGj8-HuD12Oe-dpodbsWh/view?usp=sharing)

The above database contains the following tables:

Table **tbl_Admin**: Contains Administrator information

Table **tbl_Editor**: Contains Editor information

Table **tbl_Reporter**: Contains information of Reporters

Table **tbl_User**: Contains Readers' information

Table **tbl_Approve**: Contains information related to News Approval

Table **tbl_News**: Contains information about approved and currently approved News

Table **tbl_Categorie**: Contains topics and categories of the newspaper page

Table **tbl_Comment**: Contains readers' comments on each news story.

**1. Step**: Create a database and tables in the database
**2. Step**: Create `Constraint` based on database design
  * Create a foreign key constraint for table **tbl_Approve** that links to table **tbl_News** and table **tbl_Editor**
  * Create a foreign key constraint for table **tbl_Comment** that links to table **tbl_News** and table **tbl_User**
  * Create a foreign key constraint for table **tbl_News** that links to table **tbl_Categorie** and table **tbl_Reporter**
  * Create **CHECK CreateDate** constraint in table **tbl_News** after 01-01-2022
  * Create a **DEFAULT** constraint for the condition that data that is ignored or has no value (in columns with NULL values) will have a NULL value

**3. Step**: Interact with the database with `INSERT`, `DELETE`, and `UPDATE` commands
   * Insert data into the table **tbl_Approve**, **tbl_Admin**, **tbl_Editor**, **tbl-Reporter**, **tbl_User**.
   * Delete data with the `DELETE` command: Delete the name of the "Kiều bào" section in the **tbl_Categorie** table, because during the process of posting news, it was found that this section received few views, interest, and interactions as well as comments from readers. After deletion, the "Thế giới" topic only has 3 categories left
   * Update data with the `UPDATE` command: Each administrator will have different management tasks. When want to update more tasks or update new tasks for administrators, you can use the UPDATE command.

**4. Step**: Create `Trigger`
   * Trigger `TRG_UpdateNewsStatus`: This trigger performs the task of updating the approval status of news on the **tbl_Approve** table. When the `ApproveDate` in the **tbl_Approve** table of a news item has the value `NULL`, it means that the news is still in approval status. Therefore, the `NewsStatus` of this news in the **tbl_News** table will have the value "approving". In this case, `ApproveDate` has a value other than NULL, which means the information has been approved. And the `NewsStatus` of this news in the `tbl_News` table will be changed to “approved”.
   * Trigger `TRG_DeleteComment`: This trigger performs the task that when a news story has to be taken down from the home page, all comments on that news story in the **tbl_Comment** table will also be removed.
  
**5. Step**: Create `Stored Procedure`
   * Stored Procedure `SP_NewsDescrpt`: This SP is responsible for providing a summary describing the main content of the news on the home page with the input parameter being the news code. This SP helps Administrators grasp the content of the news without having to read the entire article. Thereby, the Administrator can forward it to the appropriate Editor to edit and approve the news.
   * Stored Procedure `SP_Comment`: This SP is responsible for finding reader comments (including comment account, content, and comment date) of that newsletter. This helps Administrators know readers' reactions to a specific newsletter. From there, you can measure readers' reactions to know what hot topics are of interest, and you can focus on exploiting other new news on that topic.
  
**6. Step**: Create `Function`
  * Function `FNC_SLComment`: This function was created with the purpose of finding out which news has the highest number of comments. That can help the management board assess the level of interest and tastes of news readers. The return result of the function is the code, title, and number of Comments on that news.
  * Function `FNC_Categorie`: The `FNC_Categorie` function was created to shorten the query to determine the category name of the news with the input parameter being the ID code of that news. The returned result is the name of the category.
  * Function `FNC_Approve`: The ``FNC_Approve` function was created to check whether the status of the news has been approved or not with the input parameter being the ID code of that news. The returned result will be a table including the name and status of the news.

**7. Step**: Create `Index`
   * Index `Idx_News_Create`: The `Idx_News_Create` index is created for the two columns `Title` and `CreateDate` for the **tbl_News** table for the purpose of querying news information for a specific period of time, or day. This index is **Unique Index** because the title name is unique, and each news item has only one date of completion.
   * Index `Idx_Admin_Contact`: This index is created to query Admin contact information through their duties.
   * Index `Idx_Editor_Contact`: This index was created to query the editor's contact information by their name.

**8. Step**: Create `Transaction`
   * Create a Transaction to delete a User, then delete all comments of that User
   * Create a Transaction to add new news information to the tbl_News table, then insert that new news information into the tbl_Approve approval table

**9. Step**: Execute queries on the created database
