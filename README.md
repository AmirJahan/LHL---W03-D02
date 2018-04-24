This morning we talked about table views and picker views. We benefited from datasources and delegate and could populate the cells using values form the data source’s array.

Our word cloud is here:
![alt text](https://github.com/AmirJahan/LHL---W03-D02/blob/master/LHL%20W3%20D2.png)


In building table views, we benefit from UITableViewDelegate and UITableViewDataSource and then use cells to display information.

While the default behavior of Xcode is to use a Master-Detail app and make a table view using the TableViewController, we did make table view apps in single view apps as well.

The view controller will have some model objects and from that, it needs to tell the table view how many sections there are and how many rows are in each section. It also needs to format the cells with the text, images, or whatever is going to be displayed for each corresponding object.

The following classes are associated with table views:

  -UITableViewCell, the view that is each row of the table view. Subclass this to create custom appearances. 
  -NSIndexPath, the class that identifies the position of each row. It has properties for section (first index) and row (second index).
