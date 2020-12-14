using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFrontEFSecured.DATA.EF.MetaData
{
    #region Oddities
    public class OddityMetadata
    {
        //public int OddityID { get; set; }
        [Display(Name = "Oddity")]
        [Required(ErrorMessage = "* Oddity Name is Required.")]
        [StringLength(25, ErrorMessage = "* Oddity Name must be 25 characters or less.")]
        public string OddityName { get; set; }

        [Required(ErrorMessage = "* Origin is Required.")]
        public int OriginID { get; set; }

        [Display(Name = "Recovered")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public Nullable<System.DateTime> RecoveryDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:c}")]
        [Required(ErrorMessage = "* Price is Required.")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "* Status is Required.")]
        public int OddityStatusID { get; set; }

        [Required(ErrorMessage = "* Genre is Required.")]
        public int GenreID { get; set; }

        [Display(Name = "Units Sold")]
        [Range(0, int.MaxValue, ErrorMessage = "* Units sold must be greater than 0.")]
        [Required(ErrorMessage = "* Amount of Units is Required.")]
        public int UnitsSold { get; set; }
    }
    #endregion

    #region Departments
    public class DepartmentMetadata
    {
        //public int DepartmentID { get; set; }

        [Display(Name = "Department")]
        [Required(ErrorMessage = "* Department is Required.")]
        [StringLength(30, ErrorMessage = "* Department must be 30 characters or less.")]
        public string Department1 { get; set; }
    }
    #endregion

    #region Employees
    public class EmployeeMetadata
    {
        //public int EmployeeID { get; set; }

        [Display(Name = "First Name")]
        [Required(ErrorMessage = "* First Name is Required.")]
        [StringLength(20, ErrorMessage = "* First Name must be 20 characters or less.")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "* Last Name is Required.")]
        [StringLength(20, ErrorMessage = "* Last Name must be 20 characters or less.")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "* Department is Required.")]
        public int DepartmentID { get; set; }

        [Display(Name = "Recovered")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime HireDate { get; set; }

        [StringLength(25, ErrorMessage = "* Phone Number must be 25 or less characters.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Phone { get; set; }

        [StringLength(20, ErrorMessage = "* City must be 20 characters or less.")]
        public string City { get; set; }

        [StringLength(20, ErrorMessage = "* State must be 20 characters.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string State { get; set; }

        [StringLength(20, ErrorMessage = "* Country must be 20 charaters or less.")]
        public string Country { get; set; }
        public Nullable<int> DirectReportID { get; set; }
    }
    #endregion

    #region OddityStatus
    public class OddityStatuMetadata
    {
        //public int OddityStatusID { get; set; }

        [Display(Name = "Status")]
        [StringLength(15, ErrorMessage = "* Status must be 15 charaters or less.")]
        public string Status { get; set; }
    }
    #endregion

    #region Genres
    public class GenreMetadata
    {
        //public int GenreID { get; set; }

        [Display(Name = "Genre")]
        [Required(ErrorMessage = "* Genre is Required.")]
        [StringLength(15, ErrorMessage = "* Genre must be 15 characters or less.")]
        public string Genre1 { get; set; }
    }
    #endregion

    #region Origin
    public class OriginMetadata
    {
        //public int OriginID { get; set; }

        [Display(Name = "Origin")]
        [Required(ErrorMessage = "* Origin is Required.")]
        [StringLength(15, ErrorMessage = "* Origin must be 15 characters or less.")]
        public string Origin1 { get; set; }
    }
    #endregion
}
