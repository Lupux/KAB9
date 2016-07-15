<%@ Page Title="" Language="C#" MasterPageFile="~/MasterProspect.Master" AutoEventWireup="true" CodeBehind="Registrering.aspx.cs" Inherits="KAB9.Registrering" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form class="form-horizontal" action='' method="POST">
  <fieldset>
    <div id="legend">
      <legend class="">Register</legend>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Förnamn</label>
      <div class="controls">
        <input type="text" id="firstname" name="username" placeholder="" class="input-xlarge">
        <p class="help-block">Username can contain any letters or numbers, without spaces</p>
      </div>
    </div>

            <label class="control-label"  for="username">Efternamn</label>
      <div class="controls">
        <input type="text" id="lastname" name="username" placeholder="" class="input-xlarge">
        <p class="help-block">Username can contain any letters or numbers, without spaces</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>

            <label class="control-label" for="email">Telefonnummer</label>
      <div class="controls">
        <input type="text" id="phone" name="email" placeholder="" class="input-xlarge">
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
        <p class="help-block">Password should be at least 4 characters</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">Password (Confirm)</label>
      <div class="controls">
        <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge">
        <p class="help-block">Please confirm password</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">Register</button>
      </div>
    </div>
  </fieldset>
</form>--%>

    <div class="container-fluid">
        <section class="container">
            <div class="container-page">
                <div class="col-md-6">
                    <h3 class="dark-grey">Registration</h3>

                    <div class="form-group col-md-3">
                        <label>Förnamn</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-md-3">
                        <label>Efternamn</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-md-6">
                        <label>Password</label>
                        <input type="password" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-md-6">
                        <label>Repeat Password</label>
                        <input type="password" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Email Address</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Telefonnummer</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Adress</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Postnummer</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Ort</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="form-group col-lg-6">
                        <label>Land</label>
                        <input type="" name="" class="form-control" id="" value="">
                    </div>

                    <div class="col-sm-6">
                        <input type="checkbox" class="checkbox" />Ta emot nyhetsbrev om framtida erbjudanden
                    </div>

                    <div class="col-sm-6">
                        <input type="checkbox" class="checkbox" />Skicka notifikationer till denna mail
                    </div>

                </div>

                <div class="col-md-6">
                    <h3 class="dark-grey">Terms and Conditions</h3>
                    <p>
                        By clicking on "Register" you agree to The Company's' Terms and Conditions
                    </p>
                    <p>
                        While rare, prices are subject to change based on exchange rate fluctuations - 
					should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
                    </p>
                    <p>
                        Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
                    </p>
                    <p>
                        Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
                    </p>

                    <button type="submit" class="btn btn-primary">Registera</button>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
