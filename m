From: Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Fri, 12 Oct 2012 09:12:48 +0530
Message-ID: <BLU002-W134A2F0BA0EF1C3BF8E491EAC8C0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0636605338430813644=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0636605338430813644==
Content-Type: multipart/alternative;
	boundary="_a3b4ea9b-c026-4f6f-b988-1c2986a1c1c3_"

--_a3b4ea9b-c026-4f6f-b988-1c2986a1c1c3_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I2C clients which has 10 bit address=2C struct i2c_board_info=2C
member "flags =3D I2C_CLIENT_TEN" is needed.

Signed-off-by: Bharat Kumar Reddy Gooty <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/of_i2c.c |    4 ++++
 1 file changed=2C 4 insertions(+)

diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index 1e173f3..9cda7e2 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -57=2C6 +57=2C10 @@ void of_i2c_register_devices(struct i2c_adapter *ada=
p)
                        continue=3B
                }  =20
=20
+               /* Support for i2c 10 bit client address */
+               if ((info.addr > (1 << 7) - 1) && (info.addr <=3D (1 << 10)=
 - 1))
+                       info.flags =3D I2C_CLIENT_TEN=3B
+
                info.irq =3D irq_of_parse_and_map(node=2C 0)=3B=20
                info.of_node =3D of_node_get(node)=3B
                info.archdata =3D &dev_ad=3B
--=20
1.7.9.5


 		 	   		  =

--_a3b4ea9b-c026-4f6f-b988-1c2986a1c1c3_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>I2C clients which has 10 bit add=
ress=2C struct i2c_board_info=2C<br>member "flags =3D I2C_CLIENT_TEN" is ne=
eded.<br><br>Signed-off-by: Bharat Kumar Reddy Gooty &lt=3Bbharat_404@hotma=
il.com&gt=3B<br>---<br>&nbsp=3Bdrivers/of/of_i2c.c |&nbsp=3B&nbsp=3B&nbsp=
=3B 4 ++++<br>&nbsp=3B1 file changed=2C 4 insertions(+)<br><br>diff --git a=
/drivers/of/of_i2c.c b/drivers/of/of_i2c.c<br>index 1e173f3..9cda7e2 100644=
<br>--- a/drivers/of/of_i2c.c<br>+++ b/drivers/of/of_i2c.c<br>@@ -57=2C6 +5=
7=2C10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)<br>&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nb=
sp=3B&nbsp=3B&nbsp=3B&nbsp=3B continue=3B<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B }&nbsp=3B&nbsp=3B <br>&nbsp=3B<br>+&nbsp=3B&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B /* Support for i2c 10 bit client address */<br>+&nbsp=3B&n=
bsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B if ((info.addr &gt=3B (1 &lt=3B&lt=3B 7) - 1) &=
amp=3B&amp=3B (info.addr &lt=3B=3D (1 &lt=3B&lt=3B 10) - 1))<br>+&nbsp=3B&n=
bsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B info.flags =3D I2C_CLIENT_TEN=3B<br>+<br>&nbsp=3B&nbsp=3B&=
nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbs=
p=3B&nbsp=3B&nbsp=3B&nbsp=3B info.irq =3D irq_of_parse_and_map(node=2C 0)=
=3B <br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nb=
sp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B info.of_node =3D of_n=
ode_get(node)=3B<br>&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B info.ar=
chdata =3D &amp=3Bdev_ad=3B<br>-- <br>1.7.9.5<br><br><br> 		 	   		  </div>=
</body>
</html>=

--_a3b4ea9b-c026-4f6f-b988-1c2986a1c1c3_--

--===============0636605338430813644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0636605338430813644==--
