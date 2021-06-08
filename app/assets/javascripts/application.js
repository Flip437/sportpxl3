// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require rails-ujs
//= require jquery3
//= require jquery_ujs

//= require template/jquery
//= require template/jquery-migrate-3.0.1


// require template/popper.min
//= require template/bootstrap.min
//= require template/jquery.easing.1.3
//= require template/jquery.waypoints.min
 
//= require template/jquery.animateNumber.min
//= require template/bootstrap-datepicker
//= require template/jquery.timepicker.min
//= require template/owl.carousel.min
//= require template/jquery.magnific-popup.min
//= require template/scrollax.min

//= require template/main


//= require activestorage
//= require dropzone

// $(function () {

//   //call datatables
//   //$('#example').DataTable();

// $(document).on('click', '#results_table th a', function(){
//   $.getScript(this.href);
//       return false;
//   });

// $(document).on('keyup', '#results_search input', function(){
//   $.get($('#results_search').attr('action'), $('#results_search').serialize(), null, 'script');
// });
//   //$('.bootstrap-switch').bootstrapSwitch();

//   //Import CSV
//   /*
//   $("#selectedFileCsv").on('change',function () {
//   });
//    */



//   //if click outside of #eventsList close it
//   $('body').click(function(){
//       $('#eventsList').remove();
//   })

  

//   //open csv modal
//   $(".someClass").on('click', function(){
//       $("#importCsvModal").modal('show');
//   });

//   //process csv send form.uploadCsv directly after choose the file

  
  

  
//   /*
//   //show the first row csv
//   $(".processCsv").bind("ajax:success", function(){
//       firstRowarr = [];
//       gon.firstRowCsv.map(row => firstRowarr[row[0]] = row[1] );
//       console.log( firstRowarr  );
//       //show the first row in the CSV
//       $("#telFirst").html( firstRowarr["Telephone"] );
//       $("#emailFirst").html( firstRowarr["Email"] );
//       $("#dossardFirst").html( firstRowarr["Doss"] );
//       $("#nomFirst").html( firstRowarr["Nom"] );
//       $("#prenomFirst").html( firstRowarr["Prenom"] );

//       $("#importCsvModal").modal('show');
//   });
//   */

//   $(".btnUploadCsv").click(function(){
//       $("#importCsvModal").modal('hide');
//   })

//   //Search events in  freshtart
//   /*
//   $(".searchEvent").bind("ajax:success", function(e, data, status, xhr){
//       console.log(data);
//   });
//   */

//   //test ajax CONRACTS
//   /*
//   $("#newCamp").click(function(e){
//       e.preventDefault();
//       $.ajax({
//           url: "/api/v1/editions/7/contacts",
//           type: "get",
//           data: "",
//           success: function(data) {
//               console.log( data );
//           },
//           error: function(data) {}
//       });
//   })
//   */


//   /* $("#testing").click(function(e){
//       e.preventDefault();
//       $.ajax({
//           url: "https://api.mailjet.com/v3/REST/campaignoverview" ,
//           dataType: "json",
//           type: "GET",
//           success: function(data) {
//               console.log( data );
//           },
//           error: function(data) {}
//       });
//   }) */



//   // $('#gallery').simplegallery({
//   //     galltime : 400,
//   //     gallcontent: '.content',
//   //     gallthumbnail: '.thumbnail',
//   //     gallthumb: '.thumb'
//   // });

  
//   $("#modalPictures").on('show.bs.modal', function(){
//       $("#modalPictures div.content img:first").removeAttr("style");
//   });

  
//   $("#btnSuppEvent").click(function(e){
//       e.preventDefault();
//       if( $("input#theWordSupp").val() == "SUPPRIMER" ){
//           console.log("egale");
//           $("#alertSupp").css("display", "none");
//           // Prevent infinite loop
//           $(this).unbind('click');
//           // Execute default action
//           e.currentTarget.click();
//       }else{
//           console.log("no egale");
//           $("#alertSupp").css("display", "block");
//       }
//   })


//   $("#filter_alphabetic").change(function(e){
//       $(this).closest("form").submit(); 
//   });

//   $("#filter_chronologic").change(function(e){
//       $(this).closest("form").submit(); 
//   });


  



 
  

  
    




// });


