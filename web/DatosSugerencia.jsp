<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Sugerencia</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <link href="css/estiloparaform.css" rel="stylesheet" type="text/css"/>
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idsugerencia;
            String s_descripcion;
            String s_persona;
            String s_area;
            String s_rol;
            String s_estado;
            
        %>
    </head>
    <body>
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idsugerencia = request.getParameter("f_idsugerencia");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select s.Descripción, p.Nombre, a.Nombre, r.Nombre, s.Estado  "
                                + " from sugerencia s, persona p,area a, rol r "
                                + " where s.Idpersona = p.IdPersona and s.Idarea = a.IdArea and s.Idrol = r.IdRol "
                                + " and s.IdSugerencia = " + s_idsugerencia + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form class="general" name="EditarSugerenciaForm" action="DatosSugerencia.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Editar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Descripción: </td>
                        <td><input type="text" name="f_descripcion" value="<% out.print(rs.getString(1)); %>" maxlength="80" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Idpersona:</td>
                        
                        <td><select name="f_persona" value="" >
                              <%consulta = "    select  Nombre, IdPersona  "
                                + " from   persona  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                                while(rs.next()){%>
                                    <option value="<% out.print(rs.getString(2)); %>"><%out.print(rs.getString(1));%></option><%
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Idarea:</td>
                        
                        <td><select name="f_area" value="" >
                                <%consulta = "    select  Nombre, IdArea  "
                                + " from   area  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    
                    while(rs.next()){%>
                    <option value="<% out.print(rs.getString(2)); %>"><% out.print(rs.getString(1)); %></option><%
                                        
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Idrol:</td>
                        
                        <td><select name="f_rol" value="" >
                                <%consulta = "    select  Nombre, IdRol  "
                                + " from   rol  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                                while(rs.next()){%>
                                    <option value="<% out.print(rs.getString(2)); %>"><%out.print(rs.getString(1));%></option><%
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Estado: </td><%consulta = "    select Estado  "
                                + " from sugerencia;  ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if(rs.next()){%>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(1)); %>" maxlength="1" size="2"/></td>
                        <%};%>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <button type="submit" value="" name="f_agregar"><img  src="imagenes/guardar.png" width="60"></button>
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idsugerencia" value="<% out.print(s_idsugerencia); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                
            }}else{
                    
        %>
        <form class="general" name="AgregarSugerenciaForm" action="DatosSugerencia.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Descripción: </td>
                        <td><input type="text" name="f_descripcion" value="" maxlength="40" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Idpersona: </td>
                        
                        <td><select name="f_persona" value="" >
                                <%consulta = "    select  Nombre, IdPersona  "
                                + " from   persona  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    
                                while(rs.next()){%>
                                    <option value="<% out.print(rs.getString(2)); %>"><%out.print(rs.getString(1));%></option><%
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Idarea: </td>
                        
                        <td><select name="f_area" value="" >
                                <%consulta = "    select  Nombre, IdArea  "
                                + " from   area  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    
                    while(rs.next()){%>
                    <option value="<% out.print(rs.getString(2)); %>"><% out.print(rs.getString(1)); %></option><%
                                        
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Idrol: </td>
                        
                        <td><select name="f_rol" value="" >
                                <%consulta = "    select  Nombre, IdRol  "
                                + " from   rol  "
                                + "  ; ";

                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                                while(rs.next()){%>
                                    <option value="<% out.print(rs.getString(2)); %>"><%out.print(rs.getString(1));%></option><%
                                }
                            %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <button type="submit" value="" name="f_agregar"><img  src="imagenes/guardar.png" width="60"></button>
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
        }
        %>
        
        <table class="ecologico" border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <tr>
                    <th colspan="8">Datos Estudiante</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Descripción</th>
                    <th>Persona</th>
                    <th>Area</th>
                    <th>Rol</th>
                    <th>Estado</th>
                    <th colspan="2">Accion</th>
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from sugerencia "
                                    + " where "
                                    + " IdSugerencia = " + s_idsugerencia + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_descripcion = request.getParameter("f_descripcion");
                        s_persona = request.getParameter("f_persona");
                        s_area = request.getParameter("f_area");
                        s_rol = request.getParameter("f_rol");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " sugerencia(Descripción, Idpersona, Idarea, Idrol, Estado) "
                                    + " values ('"+ s_descripcion +"','"+ s_persona +"','"+ s_area +"','"+ s_rol +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_descripcion = request.getParameter("f_descripcion");
                        s_persona = request.getParameter("f_persona");
                        s_area = request.getParameter("f_area");
                        s_rol = request.getParameter("f_rol");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  sugerencia  "
                                + "  set  "
                                + "  Descripción = '"+ s_descripcion +"',"
                                + "  Idpersona = '"+ s_persona +"',"
                                + "  Idarea = '"+ s_area +"', "
                                + "  Idrol = '"+ s_rol +"', "
                                + "  Estado = '"+ s_estado +"' "
                                + "  where "
                                + "  IdSugerencia = "+ s_idsugerencia +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select s.IdSugerencia, s.Descripción, p.Nombre, a.Nombre, r.Nombre, s.Estado "
                        + " from sugerencia s, persona p, area a, rol r where p.IdPersona = S.Idpersona and a.IdArea = s.Idarea and "
                        + " r.IdRol = s.Idrol;  ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="DatosSugerencia.jsp?f_accion=E&f_idsugerencia=<%out.print(ide);%>"><img  src="imagenes/eliminar2.png" width="25"></a></td>
                        <td><a href="DatosSugerencia.jsp?f_accion=M1&f_idsugerencia=<%out.print(ide);%>" ><img  src="imagenes/editar.png" width="30"></a></td>

                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL" + e);
            }
        
        %>
        </table>
        <br>
        <div align="center">
            <a href="menu.jsp"><img  src="imagenes/flecha.png" width="100"></a>
        </div>
    </body>
</html>
