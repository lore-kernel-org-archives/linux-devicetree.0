From: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Subject: Device tree flattening code not copying properties from blob
Date: Wed, 12 Jun 2013 10:32:24 -0400
Message-ID: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1889146613462116998=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--===============1889146613462116998==
Content-Class: urn:content-classes:message
Content-Type: multipart/related;
	type="multipart/alternative";
	boundary="----_=_NextPart_001_01CE6779.A7D0D4C6"

This is a multi-part message in MIME format.

------_=_NextPart_001_01CE6779.A7D0D4C6
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01CE6779.A7D0D4C6"


------_=_NextPart_002_01CE6779.A7D0D4C6
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have been chasing a problem where a module device driver that uses the
device tree I install, cannot find a compatible match when I know the
device tree has the match for my driver.

=20

So I wrote a small module device driver that dumps the device tree
information. I add it to the device driver list using insmod dtdump.ko.
If I add the insmod to the start of the rc (using uCLinux distribution)
file then I get the proper contents. If I add insmod at the end of the
rc file then the device tree is bad.

=20

The problem is in the file fdt.c and the function unflatten_dt_node.

=20

When the unflattened tree is created the memory is allocated for the
nodes and the property structures, however the pointers are just
inserted into the property structure. The pointers are pointing in the
memory area freed after initialization. This will work if the embedded
__init memory is not freed but freeing this memory ends up with tree
nodes that have invalid properties and thus the device tree is no good.

=20

I am working on a fix to the unflatten_dt_node function. Allocate space
for the property name and value and copy them in also as the node name
is done.

=20

Does anyone know if there is already a fix for this?

=20

Rod Collins

Principal Software Engineer

Saab Sensis Corporation

315-445-5784

rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org <mailto:rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org>=20

=20

=20

-
This message is intended only for the addressee and may contain =
information that is company confidential or privileged.  Any technical =
data in this message may be exported only in accordance with the U.S. =
International Traffic in Arms Regulations (22 CFR Parts 120-130) or the =
Export Administration Regulations (15 CFR Parts 730-774). Unauthorized =
use is strictly prohibited and may be unlawful. If you are not the =
intended recipient, or the person responsible for delivering to the =
intended recipient, you should not read, copy, disclose or otherwise use =
this message. If you have received this email in error, please delete =
it, and advise the sender immediately.=20
-                                                                        =
                                                                         =
                                                                         =
                            =20

------_=_NextPart_002_01CE6779.A7D0D4C6
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 12 =
(filtered medium)"><!--[if !mso]><style>v\:* =
{behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"2050" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoPlainText>I have =
been chasing a problem where a module device driver that uses the device =
tree I install, cannot find a compatible match when I know the device =
tree has the match for my driver.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>So I =
wrote a small module device driver that dumps the device tree =
information. I add it to the device driver list using insmod dtdump.ko. =
If I add the insmod to the start of the rc (using uCLinux distribution) =
file then I get the proper contents. If I add insmod at the end of the =
rc file then the device tree is bad.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>The =
problem is in the file fdt.c and the function =
unflatten_dt_node.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>When =
the unflattened tree is created the memory is allocated for the nodes =
and the property structures, however the pointers are just inserted into =
the property structure. The pointers are pointing in the memory area =
freed after initialization. This will work if the embedded __init memory =
is not freed but freeing this memory ends up with tree nodes that have =
invalid properties and thus the device tree is no good.<o:p></o:p></p><p =
class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p class=3DMsoPlainText>I am =
working on a fix to the unflatten_dt_node function. Allocate space for =
the property name and value and copy them in also as the node name is =
done.<o:p></o:p></p><p class=3DMsoPlainText><o:p>&nbsp;</o:p></p><p =
class=3DMsoPlainText>Does anyone know if there is already a fix for =
this?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span style=3D'color:#00B050'>Rod Collins</span><span =
style=3D'color:#00B050'><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#00B050'>Principal Software =
Engineer<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#00B050'>Saab Sensis Corporation<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#00B050'>315-445-5784<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:#00B050'><a =
href=3D"mailto:rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org"><span =
style=3D'color:blue'>rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org</span></a><o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif";color:#1F497D'><img border=3D0 width=3D134 =
height=3D42 id=3D"Picture_x0020_1" =
src=3D"cid:image001.png-TiZXYx2ruS9H4mieW9IQsDRmByFHzeGd@public.gmane.org" alt=3D"Description: =
cid:image003.png-fv60akkk9y8TIOMaZQAn+jRmByFHzeGd@public.gmane.org"></span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div>
</br><i><small>This message is intended only for the addressee and may =
contain information that is company confidential or privileged.  Any =
technical data in this message may be exported only in accordance with =
the U.S. International Traffic in Arms Regulations (22 CFR Parts =
120-130) or the Export Administration Regulations (15 CFR Parts =
730-774). Unauthorized use is strictly prohibited and may be unlawful. =
If you are not the intended recipient, or the person responsible for =
delivering to the intended recipient, you should not read, copy, =
disclose or otherwise use this message. If you have received this email =
in error, please delete it, and advise the sender immediately. =
</i></small>
</body></html>
------_=_NextPart_002_01CE6779.A7D0D4C6--

------_=_NextPart_001_01CE6779.A7D0D4C6
Content-Type: image/png;
	name="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <image001.png-TiZXYx2ruS9H4mieW9IQsDRmByFHzeGd@public.gmane.org>
Content-Description: image001.png
Content-Location: image001.png

iVBORw0KGgoAAAANSUhEUgAAAIYAAAAqCAYAAAB2pyMEAAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAADMtSURBVHja
7bx3XFVX2j2OBUVEULGjgiJNBBRpgtJ7kyZFATt2xd712ntvSUzUJJqYmJiYapzMpJlMMmnG6MSW
2BtIvb2u79r7XozJlPf9zeed31/Bz+O55dxz9tl7PetZa59ip7yHWGMDFDBCYRZhNirMUDJqFGrz
bUW1+rJCj4cKpfm+okZ7X9FgblCoYWRwXQYYej0U1dzGXaVZcd9oVFzWGhU/c3mVcZtRYzYrjGJd
rocGswJ3axS4Wc3XDfysgfts4DbqGA0Ko1Gt0GqVfK3mts3WNsl2/T7MCr1Zz3YoGQ0KrS30tjD+
JpS2UPM7rS30fG+0Hq8M8V4rQy/XUz4RahlGs1auZ11ftI3HYrQuxXujaBOPU2sL8dpoC/EbsC+g
1zO0MsS2RDt+H8bHYW2P2dwU6t8EjNyOUf8fhlGO+ZNh7WtxTMZYO7OWH+o4BDwSvYbN0Wt5rEro
LDVQmx5wWQ21sRpKSy2UJiXH1sIA6vnfwwYdrl2vxxffXsc7n/yAvS+/h3XPvYYlB45h8TMvYc3R
N7DppTfx9Btn8MnXl3H9ejW0DQZALTZg4dLENmq4zwZ+YIDZpIVG3cClDuw0GPQ6WExmGWazhYHf
hNFiZNM10ELFpWhbowwjwyRDyVAx1AwNg8fGNQwyDPy9idsR2xZL7t+ih9iiQYbWFtb3Rn4nvpfr
cX3RJthCtpHbMVrMj/tHL4+IbeR7rg0L9wUTIWLgNzwuERa5P9M/CSPM/LWpaZ+2sJh1TwS3Y9Jb
t/kfhehA/CYe9zXBYSeQYtFaYNSYYDKINfil6DTZiexygxJX7/6CGq1SHmgD23K/ToWPv7wCxZYj
mLZkN/InLkfJrDUomLYcaRPmIqNiHhLGTkfuzCUoqFyGnCmLMHbhRoybuxEbdr+GT768g19uqVHX
YEZdvQqNygYYjOwSNlh0vE6v4nsOJDvgccfIwXsCHCYBDIttmHUy5AAyTLYwW56Mpg4WHc59caBM
FvMTwDPL97+G6fE6TWEF0a+/YYN/7Wimm5nbFWAzcF0RAhT/AAzjr8AQv+c3ssd/HxaL5Tf7+r8P
/HNgiOMgu9kJSjPpOAiiwWyS+Kfn4GjZ8xqTBdUqrSAUGdduN+L4G2cxZdZ6JGdVIKNoNjLHLkZI
1ji4R6TBtX8EHHr7oLPvQHT08kebnp7o0G8A3ENjkTl+HkGzBGG5MzG0eCmK5j2Fp078Ffdrmc0k
j0aNAVU1dXLwDSbun+AwmTXsbK0tDL8Fhwny9a+DaHwcZvP/FL8yhegIy+P3FplIYttPLsX4N+1P
Dpbtd8wkW9Zaw2I2PG6DUea+tT8FKKzrC2DwN3pbGE1ygP7TMNtI6z9ZivgNOGyg+BUY5joFzPUQ
/C6oTWPUoV6jRb3OhAaDBfeVZjzSmfHBZ5cwumIVBkUUIDppHHKL5yMmcwJadvNFq54+cHL3hndY
BNz9+sOliyv6ePeBp28/+AQFwmtgMDr09Ucr9yB4xBcjbvJaDB6tgHfieIyZthanP/gaGr3IHgEQ
VnWdoH5BylpbKVDJMmB6DA7bQP2PnWf5NxljsoLNxiISGE3btBIA+DE41vK9/Ex2qFmuL/oKLHkw
2kK8luCwMpO1DBitoPg9MAwixGvLP2TtvwvZjqb22UDLIfqPlqZ/Agwr++kFqynszMb7FHk1HIQG
aA0NUBp0UJmtDEHZgfsqI7Y98w4ChhRiYGQRB3IdMgtmobdXNPr4RyIsIQVegwNRMm4Unnv+ANat
Xogu7VtioHd3bFgxG0cP7UZJSQ469eyKgKHR8IlLhYNfMAILJyBt4jL0HZCFgOA8PH34HTSSnVRG
AlFFrWDR8CCUbHODTS+orZ39BDAsTQdleFzQbZT470DSxBIGWautbKSzDqJYxwaIf4gmxhCMZBH6
QMNOZA8ZfgcOmwaQmoCNkmFjsccsYxRagxvUPxk8KL3FOnJN8Q9U/wRb/LeBodXfJDAekfDqKTIb
KNEsEhAqxuUHBqzY/gp6DkiFf+QIjBi/FH6haejsPhB5oyZDsWETlq2YhQkTs3HkuXV47eg2vHec
miM+AGOzw3H2rYP404n9ePmZ9RhVGId16+dj/faViB0eC5/IQAwYmoiKWXsQHDkBHn5pWLByP24+
FGwB1OkboTTWs1sbbOBQStaQ2W0bwN+AwvDPO9EKIosNELYsN1nVtkWKUqs4FQPJ/6ydZfht/AoM
WWit67M9MGms2S/KsGACGzAeh9imDSBWViJABFMZRfvN1t/q9dayomOjdQIgRitQBHCMZhuriNFs
ArdFVHy5tOoi03+0tOoXbqcJIOLYJXhF8hEYeuNdhdkigKGmSdCi0WSRpuHrK/VYsfME2rkPw6Dk
MRg+bhGC4nLhGxGP1bv3YuvBAywnqRhbHo8VCwvxwcldUMwbiQ9e3Y23XtyG53ctx6nnt2HTkgqc
fmUPVswpweEDS/H+m7uwZ/t0bFg3HpHRkfAZVISJlS+gf8godOg2GOv3vIgbNQIUNIjMSrW5zuY0
ngCGbQAtTZnFjjRrmZki6+RB2libHWoQbkGyjNHqFyxWLpSgMFtBJ47dyH3pDWQpQfH/RJjJTmWn
6U0qrtsogWGWjGEdQDMH2Mw2W/iZhaAzGQkeaqTH7GErg0JkG40CHBwYsS/hTnRaK0BsILPo+JkQ
pwJsthJkFpksS5P4vU6KdIvNSUldYFtaHr/XPfG54R+W8juBQ/adkX2o01nRb+1fUUpQo9Aaa3js
1PTs8Cq6kxsUhIs2vwhnz1h0D0pDceUG+MZkw8HdC4EJMdh/4hAWrJ+LVZtn4YN39+CT9/fhndd2
Yc70EVi1fDpOv3sc775zAiuXz8WieZPw1uvP8vt9OPP6doJlGZ7dMgp/emUx5k4bA6cuQ9E/qhKj
pu0nM2XC2T0ES7fsQ51ag3qTGrX6OlpmFYVwAweTroMdZGTniowzqq0dKMKgInB0QkCLBDRJzaLh
Ohp2gBDSOi71zGgDt2k0CWHbyASthcpUw/XqZRltVPG1WindmYmZa9YZZfkxcsCEODeSIRq0j8is
BCstvVpD96Q1yazTKNWsKsJia6Td1tHFGY0qvqawZwhgWEW1TrbPZLE8rodmAtIsfme0WVg9Qcuw
2H5rJtB0ZFADHaKFpa9RVc1tqSQABRBhtjKTFERmAU693K9V82j/xZLHyPFuVGm4bRMeUfjr2H6r
XDYLYKgVOu5Qx0aKRKkhQHe88D6Ckkejbb9YpLJ8BGePQ1ufYLT37Y9OA/ogfWwmciekY+WWmXj7
vafx4oubUDomE+4+PeAR4IWsslHIHTcBPfwD0N3HGwXlhdj31GZ8+P5hHH1qIbYty8HJp2dgythi
tOwYgW4DxmJI5mKkj15NYAyBR2A0Drx80qZzWETYcXXqWqu3N9nmN5h1Jg2zUquSXC8yScdMa1Cr
qVHUHHDTYzcl4CJKpIoDptRzQPUCFI1yDqSRyyr1QzTq6jnwHDRmulJZB63QOWoCSK+FhoOs1Snl
DIOW/5RmFeoMjajXUhNpWHp11mQXANHxhQCM3iAYQydrkSgl4r2Ogy9tb1MVNAkHZpLvTRwo8Tud
AISYx7AJ4/rGaglaA/f5qO4Ot8Nyr6/he5ZXtlcA1mwy2FjAJF+bjIbHn1vD+A9LEwEvKpaoXkqy
rZ6MWFVXbyVgM+hKYFRoSWMEPrOLJeRaFaJyKtCsRwi84ktRMGcLuoelw87NC11DQpE5qRQ7Xt6N
1ftXYNy8UmSOTENEchQCoiNoScchqqQMHnFpCMwrw6ARYzCkhFY2KhpBCbEYXjIcY8YOx5rl4/D+
azuxUrES7fulo7V7Hpz75SJ36g5EZk2DnYM7onPG4OzFa3JQVczgR2KuQ04uMfPYySajNVtkhvG1
TqvBw0c1qGpslNJADMkjHk8V39RwAGrIALWs5Y1GOcPRVHGkExLr1+gEoOoILLKHltsggHS6RlkK
xGA18jMV96e3/cZkW5ptAdtgqykgq2trUd9ANtLUS5YR34g2G4QGETARUwEsc2oyWq3OKNuKJ2QS
bHAS01xiv3WaRxwwDaob7kFjqOXren6rwf/FH70F7jwi2AiUejJGA/u6QU+7KqZx6xrV8oB/utOI
RZsOw5mOo7V7JJIr1sAvvQKtPIegde9AlpVwJIwaiXGLZqFoWjnSyvKRUlqM6IIRiCkZhUHD89Ev
OQs9Y1Phl12EHtEp8E3Pw7DyCUgYTU0xPAfD0tOQW1KAaTOnomDMDLh4Z6JFzwzYu6cjMGk68qZt
hX3PSDj1CsPUxVtxu1Yn29bARqtYi60zlKJ+aiStismwmpoaZqq1Sxu4uHj7Pk5/ewmH3j2L7Uff
wbqDr2LpzkNYuu1prN93GPtePIEXTr6Ltz/5Et9cuYFfapSoNVkHRWROg6qeA1uFxsYqgqNBzkuo
yFQa1uC77Ksfb93Hdz/fwWcXr+OLizfxt59u46sL1/HJ1z/hxoNaCRShbZTqRskUVvGpl1NdwtUo
tWQ0lpNagvXrK/fw5++vcXkDX126js+ZDN9f+Rmf//Ajvr96jQNnwENlDTWX0IAqvq/jINbjfu09
XLz2M85d/hk/XrmO84wLtuWPl3/BuSu/yM9/sH3+5PJHfneecZnHUaMzyuMWhkPJ0nK7rpHRQPGp
NytqG3SSLV7/4Ct4RWRzkIagW3g+Mmdsg2NgJtrztfOAZNg5uqOzTzjC0woRXzAKScWjERSficEZ
I5AypgItenmgra8v4svLZNj3ckN7b2+ksKwMzsqDV3QqoosqEFc8FV6RuegURFD0ikPrHvFwCSqE
i99wJJSthvfQMbBzDsKAqCK89Zdz1BiQiK5jHdcbtLI4WCxCJ6hIv+wwDYUqOfACB2vnkVNIKZmB
/pF56DGIbESQt+gdDrtug9CyezCceoehQ98wtO8zGN384hAcW4ayqWvx4qmPcf1uFcuDDlU11Whg
ORGzr7X1fM2SYrZl145DbyIhezIi0yoQEDMG4RnTETV8JkISShGWVIydz76CGlKzxiCArJHt1YuJ
OuFmCAoN2U1jtGqhdz+/gLwpaxAQW4KwjHEIyxyLgQkFCE0dgZCkHJROnYcrdx+gntuqYUnTWsSk
I5OBOuHke+8iKX80guMKEZZchvDUckQwxOuwpFKEMuRr8d3vlmHJoq0jkZJfgY0HXsKZr36ihDDj
EVnsnlqLu2otGcMIBY8DP12vwcJ1+zlIA9HOJx4B2dMxbMxqtPBiGekZhxZ9UtAzohQ5kzZRKG6l
OxkBh66BaNXJk/RfBMWu3SwrBcgoSsPJ08fw6tvPIbsoDiMn5GH1jnWIIFO06xuEjr7x8IgsR/AI
BaLGbkHH0GLY90lAa79stPLJQmjOIqSOXo/mnaLg3DsWs1ccxL060j/FWr2K4s0o1YKYCoOaukAt
WITv3jrzFVJyJ8C1bySadx2MFq7BaN4tCna942DXIwZ2FLl2XSLlZw49hhIgMXDsnYRmzpGwaxmA
jh6xKJ6wGB9+/i1NBmmeg6ohG9U1NOBhfaMsHT9crUZC7mzYNfenNhoGO9dhaNkrAc26cxuOPgSz
J+Jyx+Cv53+SAy/apWEZ0hqUcoq+UVPHUqOWJUhLFzBz1QE4eKbAzmkQ7LpGsh9iCeAQbncA7Dp6
walnAJ5/80M6Mws1DZnGZHlcatZu3w3HXvydSwDsOvE3nUOtIV672qJT6L8I8f1Atrcfk2QwQpIL
cPF+vezVBmsIjQGFnujYc/A4kVQMpz5D4OQVj6jS5QjMXYjm/TK5kWj4py1A7rSD8B02A+098tC6
UyI6901GR/dBcPcNQuW82Tjy3E7MrMjCn05uxSenNmPNvCwc3D4TyxdOQPfe3eHaJxAtO7NR3ZPh
NHga+qUvxdAJG+AWT4boFYuWLCv9U2YhffxWtoOAdAlFdMYM0p+gT3aymDCk6tYaaiieamTtV1I9
nfvpBrKKpsKuVW84uA1Be790OJN97L2yCeoUuASOgsfQSXAPH4sOPrmw7x7H9RLR0asA7TxGUPDm
wLknB7itD1JzRuOr7y/KQdWxfDRqtHQiRmnh9x45Azf/ArTpNRyd/cfC0XsEWvsMJ+vFog0H1YFM
69S1P7Y/87KkZrGNBg1FrtFaTh7VPqB+UcuB/frCNbLEZII2Bc375MC+bzbaeg+HIxPRoW8CnH0S
CPBAivxF+PlRvSyntfyv0WCWc2Eb9hxEJ38C2z0RLanT7L0y0Mo7g+/J7N2GySSw68Zk6MrkEAki
XveIhp1t/db9krkPJkxnH9h388Wrf/4bHpIhGpuAIU5hP3ykQV7ZLHTyGoqO3glw7BOHpIqNcI+Z
wI6NhU/yNCSP34jQ4YvYAZnsgGy4sFOdCIzmXfzg2MUdwcEh2LtxFZ5dMx8/vnUQ507sxpEVk/DM
ylnIT4hG1y490ctvKFx92fie6WxcCRz7lyC4ZAVCRy5Fl8gyAiYGfaMnIoXAcOybQRBFom9wPl58
80uKRgJDlBTWXBWZQqevl8bqodqIlbufR0cfoYPCCQJ2rHciOyYMTrS/WdM3YfPRMzh65gcc/9MP
ePaVD7F4/TMYGF0Iu3ZBzNYIMkgCOnlyIBz7wt6hGxYvX4faBhWUYiaWjCRK2aU7KuSNX8PfhDHL
89Gy7wi2Nx5t+sbDwSsBHYKy4BLAJOoYQN01BxfvVktm0IjzUHRVwjk1KKldWPbEIK975gQHhuDv
kYqWXrncXqbcnp0bE6RvItr0S+JxJKDzgFS8/PEPcsBqWC6r1NZzWHueewmdA5KsjNg3hYBg+1mW
uw/Kx7D82UgomYPYomlILJ2F2JEzEFk4GQOzJ6JTSDbXHYbmnrEENcFM/dimdzBmKLbhek0jGsjM
DdSdspSc+3stAiNHyMksB/c4tPFKQ8rkLXAdVAC3gcMxYuZmDBIi1IPfsyNa9o6HvWcqa3c0BzAC
voPjMTggHE+vXIfPDxzERxs34vMtW3D52HF8evBFbF+0AVPGL0ZXbr9d7wS0dEumnihEa88stCCC
+2fNRvyEzXAiY/QaMhoZU3Yyg1LRzpvhGY8py/bgEdlCxUbXsmN1tFzCoYjKfflRIwoqV7KDguEy
KA12njxoZpKd22CEFU3H9w+Vj2nd8IQaP/jSa/Abko5u/mnwCB4OjwEJ8A6MQdfu3hg/fjru3BbZ
TU1Au6bmCB9543P0Yfm0c41Ac2Z2C58cAjEKfQcno6t/PJrztZ0XB8ib2eiTjP2vf8g2wjpXQccD
gsPIAa1nIy7UqDBk1CK2kb9zT0Vzj2S08kpF9/AStA8YjpaeiTz+JNjz+O26DUHJkmfwk0qPWjEj
bJt/23ngWXT0Z+npNZRMkcIBTkQrt0iCdxm+OH8Ll2/X4odrN3Ht4QOcu3kD3968iY/+fgUVq7fD
0Yds4h4Be7JSK+84OYbllcvxiPrikYruR6mm+CRjfPDR39FHoL3DIDTvGQPngDzEjlkH9+gxSK9Y
iyH5ZJOAVDj2i+VARvNA4tG6fzacPBIQHTsa88Yuxb4Za/DT06/h1eLJeDo6E4cShuN0xXxcO3wK
l059iR0rD6ILa7FDt2hqGHYqs6QVWcGOrNB+cDHCSlYipHAZekSOpcVVEJRFcOiTiGZdQ5A/aQUu
P1BbayDNt85kvWJB0PWVKhXGLdxGZxPOASEg+Bu7fgRtr2gEZE7hAH1Mx3ADV+5RyTPt6mzoEHD5
8/cXcPT9z3CM8cIbZ3Ds9Xdw/PhJvPPOh7h756FtsoyZqjJhyqKtaN55kMzm5n45MrODk0djxdaD
GBgr2CMUrfyzCNAEDtYwFFduxM2H9RIYFpYPi1YpJ83E3xYyWLuBBVbtxmxv2SdJ6ovJq19ARsUG
OsIYtPWnMCc4WpA53KLL8MZ311AlnYMV5Dv2sZQEMhHcktCKVr8NS1HrbnGomHsADbZjtNiSQGNL
DLH3rS9/wDJLXdM9Cva+gmki0dYrCit3HcFDarg6gqNOiE+lHoqnn38fXfrFUfCFoDXLQ+eQkYgZ
sx6hI5ZgxJzd6BleQIEVChf/VLThxlp6JrMM5MArrByHN5/C0TkH8OqEtTg3bztOp5VhVzc/7HHz
x/NhqTi/cje+2/s6ts7ahr69YuDCTug8qETW/ha+BAdZwq5XPF1QGeLGbUJIwVLEjl6HbqEj0axH
FJp1CaYDmoavL92TdV6UEzGLaYUGUE1hunjNEbTuykxmKXLuT+YLLGUbc9CieyJcqQHCsypROGkj
Fm54Gav2vIv9xz/FKx9+izPnaNmqNaj7nbfXaumAalQy2cXfnz49h4ChOeyfADj5pcK+PwHQZQiZ
bB/taT3Gz90Ae48oJksmmnkKtmIJDMvC+x9+Yd2AmGVUNsrz97UqHVLLF3AdCld3Mi9FbzOu7xNT
xvbcxr7XzqJ9v3iW20i0Zl87+AvxH4lZm1/EPVp2ra2Nm3c8DVc/tsMtn8aAx9urEM3ak+nz1uPU
mR/x8WcX8NHnP+Gzby7h9Nm/44O//YTXPruInClb0bJbEhMzj20lQLoFozed6Ltf/p3l+vFFRgo7
tdGsWL2FNdojhrUmVlK4o28OYjlIObMPYHDOXLRjZzTrHk4ryrrnS3rrTnHTKxE+1AMbFEdxZPlz
ODZ9A14fORNniyfhKXd/7O7igQP9BuKTCQvwxvQ1OLL0KaTHjEV7/q6tFwetdzraDi6nGxkuXUMr
zzT4ps2iRd6DxPGb4NJf2OZo2JMJIrMm4LMfrkvki4brLGKKWyenGsW1EidOnIUvS14zlxACLwMu
A0aipQdZqUcahRUZpCOFl3MYWjCjWnSNh5NnHroEj8WApOlIK19Kl7UWy7ccxol3P8WNu3WPmUJD
cSGmRypZClt19IGzF/uI+qWZWzScfNJw4NVP5bpPv3yaYpSdTHA6+AphR+3RMxgLlm1GY62tlGms
FvXEe2fRnaVOAKJ9QBa1BDVCh0CUzt6Om2o9Kb8RQSnUdl0GUyOls8RQFPeORP/EUpy9eF0mh2CC
dZv3wtE9iexNUPQdg1bupXQpJejkUYz+gycjKHwcQqJGIygsH/3D8xEUVw6vIeVo25fl2y2L+qWI
7JYER7Y7j2x/X289eSqmLdRi5lNNobF4zVNw7hXFDiPaab/sKYRGLj2GBU99hLb9WU9pJ1v1jZOi
znlgHtoMyIVr5Dikz9iFqbST06cqsLBkOk7OXYkvpszBM/2D8KyPP76dOB0/zF2Ft2eswkcH3kJp
diXadBhCnUJg+BSiTeBI2HmwxvZmZ/dJRZewUkzd/CaKFxwktSaydMWjRY9QhKWV46PvrshOkbOa
gjEsOhi1Wpi0etTXqLF3/0n0D82lbaR9axvC31MM+nMfBIqTZwYc2An2vajiySJ2bgS3O7ObxyoG
wM7FF63oALwGp2DM1OX4+IvzULKjxEm4ry/8gtAY0r6DBzr4JsBJJEaHEEQVLsJfr1TJwf72ipgt
nsntBJFRMtGOmd6icxBChmbj04+/to4kQ6UxomzKcjR3DZKawEmsRzZw6B6Gp058jBquU0UgTlq+
lwxAMc3638KdGoLgEXNLa/afkDO44m/TroN0jwQh3VGL3hTSnbPh7DmKrEFX0mIwHDoQpB1pZ5v1
YH94olknCu3WfjzeaHQcOJpsRIahO3EOyUXuzLX48upt3FcbBCh+BcZSqnSnXhFwZGPtesbDOaiY
oPgUm05cQPchY2DPmt3Gh+qZNqo1RZKDfy46EBihY9cge/42gmMHFPMVeGHBcmyPTcDb6Zm4XlkJ
nHoPd9ftxFtTluLUuiNICimCc+cYdAqiA+nHg/EgK/hkExikzj4pdEEToTj8OZY89SHBSZHKTrPr
MgjhLE8ff3uV4lNcsiDm+K2Tx3p1PZSPHsoKWtdowIkzf8PUNc8gPG8GOgWTMeg0mtG+Nu8Zxmym
b2/vT/ZgB/WIoJKniqf7cqC4dQ1IQ3ufODQT8wft+iG5cBrOnrsur0tR7HwBrt4xpF9mMLNXiMPm
dAAzd5zCQ5MVqLVcb/62V8iEotRmUkSTqboPgbNbCJat3o/6euv09YdnL8IvgiDrHEYmSEMLarWW
FOTDRszBudtV1lLJOPbhd7TXJeyTaGqMOAKEg91zCKJZUr+/XiXF565Dr8KlLzWfZybHZzhae2SS
0XKkDXeiTnT1GIp2bgRgD1908hnMshNB0c8+cAujuUglQ3McA3K4D45HYDLGLtiEby7fbjqZTI1B
dKzbcxTtPYdS7MVKy+gSVIKKTe9gwoZTSJywlQdATUFr1ZYHLexrM6EL/JidZJLmfrGYvfkgvvzk
W7y1cSf2p2dDefBZ4OhLqFq1Ad9OmY8dSUXYPnY5BlJLdO6dygzOJxhy0XrAKCpvClCK2DYsKYNy
F2LS2lexcM9p+vlkirBhckBicydSad+Q+kIrrqc0G2wXDyuhUT1Ao+rR4wtwb/Go3r98C0+f/hi7
TryFVc+9jIqVmzFiyjwkFo3H4LQCdB7IUugWyGMJp8ZJJfWnwJGd7+RFZd8rEvZdBtJOvolzDwyI
pvBu3mkQLSk7vH+GdAuu1D97T1/BTTbjFk3/Qy4PvXcRfaLH87iEGMyQIGneJRRRaRPxHdsjzofM
WHYAzv0SycB0Id7ZFJfJFJ6xqNz8Er67q6HDMuBSjR5f3tQitnwJ+yUGzSh27YWtpSZp75+MI+9/
Jx3a1kOvwbV/DNcZAnuKSft+ZHqyfmTONH73Ng68/DZ2HHmV5e51bD7yPLYeexm7XjuFkYs2MmkI
3L7RaBMg2sAx7xIEt6BYvP3xVxTaOtQoKT6psxTPvXIarl4cBGZXM7c41rYiloln4Jk0G1kzDsA/
dRYcSDsOAuW0l050DM2oQ1qQitt0iUDisFIcVTyDv204iPcLJuD2wtXQrNmBY75hOJlUjKs7j+Ot
tS9iANnI1T2NGUBg9MuniBtBP81sYM32TpyKmPI1GJg5GyNm70fHAdksAzHUCMFILpqKS7RfYuC1
ZrM8fS5ORYtTZWpDPWq09TLTBLFfZzrdlfOiVhUunMxtjRYXH1Tj/O27+PDceRx+7wxWPvUCwgqn
E9wsn+7JzDxmux9LDrPdznEAShfvx+ojH6FzcAFpPA6tfDKke7Bj/zjz+JOmbsOoBU8hv2INSqZv
Q1L5KnQIojvpSdbtSldBwLfm+m3JwntfPYsPvruPoNSpMlPteyZRHHNQvIWLicHAjMnIrFiN7AoF
0scvx/Ap69F7GMW3YAqCrJlIHoKpGRkmZ8ZmXKlVY+Ohk3AJJCPSerbqT1bxiiXDhqJo5jrc0lgd
mw7WC/JrRL/o9bJPLtUrMWb5TrQdkELbLVxPAllzGNr2DMI8xSZaVa0IKzA+/fYyegbQldB52JGG
2g4oRGLFHrgMLIc3wVE45xm4kCHsyRwCOK38smVnOtBudnONxiCXKGzJW4ibm0/gab8EHHYbjL+E
Z+CAWzAOBGfglwPv4ODcvfAlkFx6MUt6E2A+ebR3dDtuMXCjf0+ZuAl+qdPRNbgI8WUKuIkBIX06
9grF6Fmr8bDRbDvJJU5VU1uYVLKEXL51C4ode1E8YyHKlmxEuWIPRq9+CsVLt2Piun149+sL8k4F
g0206Z84E7pk/2uy05v75cGOOsTOkzU7IB+OZC/fjNnwSZ8lASOm6lv705Ww3LVggogJJTmz2IUl
ypV1vMNAOaUt5yNYGl3656Gdfx7r+HA5FR9fvha5FPIu/XMpTunEPCmU3ck+3E9rX6GxIuW5HJG5
dnQ+ony2ZNmSSSPAw23aeWVK/ec6uAAnv7yKTS+eocgmCD2HMOuHUANGczyiMWLaetxUWs8CC3A8
soHjAftKvL7DxJm+4TlqsBhun+WapdSRpODqFYaZi1ahtlGNmga1wq5Ba1bceVSPyPSRsO8xmKKH
ytsnhyVkF3oPnUoUpiChbB2KKg+QyoZLxmjeL012kD3LQrv2QxFKgTcrYTI+WX4Ir1GEvUl/v98v
Dt9PW4eDWZNxaMoGjIwdj65dotCWQtPRi7qCg9CSHd5pYD4Sxq1GwujVpPFYeESVI4WvXYX16xCE
bv3jsePQKXnWVAyuvCpcXKBisRq3SzcfIrWIws+uGzsuCq1Yluw6csA6BFMM+iN/8kpa3YfQ2CaG
muLKrTqUzd9Fy5ZGus6wZmY/1muWAgcmQasB+fwuXSp3Md0sBHdLMmYrwShsp12nMCsgWGbsnP2t
5x+6W8/HdAjMRxuxXTGn4ZFCJsqFYxDFXm8Cqw81SHA5QUEwdqbW6Urx20Oc1+A2nL24TR+rHnKL
kEwqmEKWbW+CrG8amnPf41Y+j8V736azypW6rzmTqwXZWJxGiB+xDMdPX8DH39zEn7/+GW98fB4f
fnMVH373M97+4hL2vPJXCuX5LNNJcqbUeQDHsvMAOLn2w/5nj6G+UYu6BsEYtKsN9GbzVm9HZ98Y
OBPBbYjOuNFb4J3AjKGYcfXPR1LpKqSPWw+3sJHSXjYnc7SlCO0TPhqdOg1BQlghXlA8iy+2v4q3
KzdhW8oYXHnufXy05w0sLF8Ob+qRdt2GwUHoFWFRuw5jycrB0FHLMWzkEjIFRVnHEASkTyOVbkbr
3uyU9gHwicrHn7+5BhKGPLspry+SoLDO4lTzixVbTlJwxUnH0YqCVrgeJ1/SeodIdPHNQB73X7lg
N9Zveh6btx7F6nWHUDByEbpQM4hzBy04iM7BxXAaSEHcNVqWi+aCFfl5c3p9RzoNYS+bUwx7UhRG
5M5ETOFsDkIlEkfMxLDMCqQUzUb66GXwjiymm0qUmqWFmKcgazTrS4D1IVC8mP09E6znVzyS0C0o
A8Hp4xBbMgMJLJfxOeOQVDgJybT9sUWVCMqeTiDyt+yzlgSHA9nMrlME+kaVIoXCvwNZzMlbXFlH
4LoPh4t7Plz7jsDg2EpEJM/BkOSp6B9RhLDE8YhImYTghEnwGTIO7XoLB5OLdkxMj6G0rS5e6OTm
j7ff+0vTLRLiCi4CQ6fH+2e/RQotp4Oo62xIRN4yROavRDta1+bOYegTWoKhefORN207/BImSMvm
SFrrEMoB7RaKLkHpmDRjPd595WPsXLIbS8YvxeEtL2Pp3F0IH1ZGdTyM22KN7hQuJ3a8ho5GesVG
xJYuR6+IYmZaBLMsGaE5c5E0eiUzl6qa1Jg1ehFu1BrkmcUGjfVODZPtWgyLuKmHgPnrN7cxvHQl
WtKK2XWIZvuHo51fEes7S0B3Wr72g9GaVrJrr2HsgEi4dIuAc3eyF9nRyUcMPEuIWxRa9oiiCyul
baaGcqcToWtp1z8VLr5kSQpSr/AsbHn2FL65dAPnr91h3MP5q/coLm/jbxfu4PurD3HgpTNwDyYb
9uY+/NPgFJBFgW0tP44BHAz/TOtZ1M6DMJuU/meK6u9+uYvz1+/ihyu3cPH6Hfz9Brd59S7e/uo6
hpUsJIjongjw9oEsT+6xFO9x6B7IkkXR7Mry5EhgOPbMRAcCo5VrCiMBbbvGo1WHMDRzCoRT13C0
5TE7kM0cuyVymYIOBEbrbtEs1eFkjP6YvnAtHlY9nuoTF+poFVqTHg/Veuw79h5a0z+Ls3NeQyci
b8pedPRiHewyDBHpM1EyYwfCh8/CiMrtSJ6wBq0HkeJ8k9AsLBfNqJg7+Cchu2w+tu9/A5t3vYao
pAlo5yHmIsQp6nBJxT7xE5A+YR0yxiiQWr4CMaOWkBIFrYZT6I0gKFYjIGUymncNQ/eAdOx8/h15
rkI4EqXOLK9+MpnVMBsbYdKq5UXA4mr8T7+8jFGT18EtMIfgCCfbcH9udFAEon3nELSjRe3oMQxt
uoXzsxC0chtK0PC1awAcKNpasLb3ZgaXztuFkOypbI8oE6z5nQNlRtm17oHUvLG4wMFrmm42mX+d
LW1U6uV1wfeqlEjMoh23Z2nryt+7MuhO7NoHWU+Rd2Xp6ejHkjoIr//lb//26iqhg6av2CVnne3a
+smS1awT29WRZadNX1prftaRpagtP3OkLuk4FM2cOX5tQ+FAFm/pEojWPD4n6pfWtOItnANg3yEU
LdtzHREuwbS8UYin6/vmx+vW4zIYxIXN4kIdcQOzURLzxdv1SCyZyw6NJhLzkVOxC+4DR6E16TWC
inrKkoMonLYZAakTMaR4IdKozBMnbkVk0Up0IS117BELb1rZEYVLkZw1F449xJnHTHSLHI+ggiUI
H7seEWUrMCC9AuGZkyT15kzfgkHZ1AhdwuEZPRoFM3fClTZKdGac8Pc3G60zciJID1pxwSrZwmio
g0VfC4uulj2olDf1/Hy3Bi+89zkqlu6gbasg7efBLSSVHl6wFTvLI4RugeDwpYD2ikFn6hefwSlI
HzEZa3a/hNNf/YRPf7yNuWufQ1zeNGSVzUXh+IUoKJ2BESMrcPCZF9FYp5RXhmtraqGtq4dRq5Hn
Q5TiKjK1aAdw8NAx5HP9rPJKpIyajeGTFMidtBpJJZVI4L5yx8zGknW7ceXmA9uMubgyXA2Tksej
rLOedDNZz3S8+cHnKJuxFgl5U5BcMAMF45Ygd1QlckfOQOaoqUgrnY7hY+chd9xixjJuexkyi+ch
o3gmS+hM5I/mcZQwGYvGIqNoErJGzuJnS5A/VoEZqw5j7yuf4vPzt+SlnUYt2yGuo1WrxdlVAoOd
Km70qeeXx898T69Ny9onEeFU5umlqznAMfClcyifvQsVy55ljZ2DjMmbMTB1JoakzENq9nIUFq5B
2ch1KMxZjKz0eUjLXcJOWEkLugFR47cgiHbOK28eQkuXIKRgJopmbUDZgl3InrYVw2fuYF2PwpCC
ubRt69CMorFbUBqeeu0jKNk/DewkpZiiJpqVKpW8ItpsbGDnUWcb7sOgug29yjoLWa034XJVLf56
5Qbe/eYi3vz8Ozzzxmnse/Ut7DpOb3/iNLacOIO9b32Gd7+8gL9+fwnn/n4btSrrnXA1HOcrt+tI
53cpbKtwnWC7e78Kt0jv9WJ6m3pMee8ONNUPYDHqYFA2wKxRwiwu4ROn1znINdU1uHH7Hn65V0Vg
V+HrX+pw8V4DLt2rxg8/38fVW1V48KgRBlEHxe0B/C2MKv6+kQCpp51QyfMqDQ0q1Ck1uFVdj28v
P8BP3NYvD2rw3Y83uY0HuHLvAc7fuYvLD6pw6X4Nzt94hEt3H+HynYe4yPZeu8t1+P35X65K93aV
dv3CL/f4uhpX79fi51o9qvRWtabRm+XV8dq6R4xqccORViFuDhZnLcUg3K7XY9KCTXD1jET3/kkY
Rd/sRQHjGzUKZfP2Ysa6V1A89wDyZ+1DTPFyhBMcscPnYODQMQiIHEXBU4GhmVMxIGEsQuhQfNIm
IZ4UP3jUIvRJnYC4CQrElC3CzI1HUThvD4LyFiBl+nb0TRqPFGZV9xCqdo9gFE1bgipxit124kwv
71M1Wu+xlZfJ66w3/JiU1rJiUEnNoYf1KifzEw6kydNrbPMajTYL9/s/E6xXTVv+Hb9zwAziFgO9
Vp6rEZfqW0Sbmu4dNBl+s3rTxcb/cpvyvsimeyH11lsBxDbEfI3e+E9/Z/lfvP7f/BmfuADZIG5q
En0snnZATNjpqUDF/STiKiWh+kUHfn3xBummkvWqL/zpCgqnrEH/mDJ4R5ejcuPrqFh5DIGps5HK
0lC54SWMXrgHszcdw7DCSmqPpRi7cj9ZYRpCimagZ2whRi7fi3F0AiOX7qPbWYqUcQpMVBxBxfrj
iJuyDQEjFmLomOUIzp/GGuyL6MKxtFc/ykaLC/dEoTPbLsO33v3TdNexxXZ3rvVkhMViedxBlv9F
N1ls/5p+K6PpTnPLE5/9Lh7/3mJ+vP6/jH+x/X8eZls8cSxNbYHlHz7/X8eTx4QntoV/eWzClUCh
JoWIjBSXzzVS4IkTKe9+8h2iM8rQsU848iesQCytmTsdSMaY1Ri/5BBr5g4yyNPY+NxHmLX2KA68
8S3WHf4zRi7ag8xp6zFx7WGMmL+DAJmFvDnbUL78aUzf+BJLxQbM3/oGFux4C5lTtlB/jELy1E2I
G78c9p5hCEwuwOG3PkAdB/9+Y72EhLjB+fGTJ+TNpU2gsMb/p076I/7HsNpV/qfSaCR6xCXv91j7
GvXi5hwL3vnke4QnFaJ3YKL06xlli2nFcjAgbizGLXgKs9a8hDlrj2Pe+hNYtf8Mjn90E8Wzd8OD
ZWfB3rfltRyBGdNQQG1SvuRZjF9+GFNXHcOoyn0IjJ+K7oMKyCDLMax0AW1hDEKzx+Cdr35EFbVE
jZGhERfRmmw3B1vvAX18w+UfoPjvAsNIa6JSNUKn01gvgDWaJHOIkiLOLp45ex4RCYXo4hmBrNJ5
FKML0DMwXV4ONzRrJt3KdBRWbMPCTaewcu9pjF/0HCYuex5zyQrjlx9BIkXnwu1vYzjX8QgrRXzB
UnT1y0NXn+FILFqMjLFL0WNQEl3EWLz/1QWpA+QDdwy0fxajrYQ0sYXB9lgBs6we1vhjIP8rwFAr
68SzoGj/xGOOVNbn6fDLOrVBgkMIsktU6PNX7aS4zMLQjHHIp2UaFFcCl95R6NIvFZ080xEwbALc
BxUhMnMOxi18FqHps1AwdQfiS1agW2A++g0pRwePZLTrGI7B8ZMxctJWRKVPhnd4Omas3IZvrt2R
gKhSafGgvp72yQCNttF2u7nt3kx5U29TDf4DGP9VYGjVDQpp/6jyVfTQGo0KKnkTj0Hex6i1ieyq
Rg2OnvwQpZMXITajHOnFU1FIgESlTUZX71Q4uQ1Dm+5R6CBOS/dLQevOQ+DqnYZ2PaPRtncMuvtl
ICypAsXj16B43BqEUsyOmrgUr9On36xutDIU2apRq0F17SP5mCWttsH2DILfAkM+jsgmMf4YyP+a
xlArVA1V0KhqrbfsC/YQd3aLu8lJF2qKUZXe6ge0LC03q+rw6jsfYfayjdK55JYvQFrxXBROXImE
/BkYkj4RwbSqYakVGMhlbF4lssoXo2D8CqRQp+SUzseUeVvw/CtnUF3fKC8lE6CoU6nopXWyVIg2
iLaY9CrrYwsstjIinmhlsT7Tyvj4/tE/BvK/AgyICS5DA5NRZX0aTNOTYMQAwfpMKnGDi85sO7sp
rwu0kEHU+PHne9h96HWs2vUC5q3dj4qFmzBmznrGRoyeswlllesxbv4WVK7ahw37juOFk3/B2W+u
4laVSj5y4bGXFg80s92wbHl8S7/WNk+hfaJdRmm55EPZ5KMxLH8A478JDDFJBJNaXLEqM1U+Bcb2
7Chz07NJmp4EZJsUEZkuxKmSTqaa1CJm0S7cU+PcLRW+v6XEdzfV+OG2BleqDfil1oC7DSbU6K3s
IO/xENdA6oy2h6vZbvqVgNA9AYpfgSGf+2ADhuEPYPz/AoxYCQ6jWgH5YFEtl/onHowKhf7JsD3Y
VFzgIy4LrDMaFQ+1esXlarXih9sNim+vW+Prn8VSqbh4X624Wq1V3KzRK6q1ZvlgVLPtoahKrVE+
NNUo92cNyP1rre0x2h5y2tQmGG0PfjXb2mNWiLPD8mGsf8T/WTBvY/8f70jquGBIvZQAAAAASUVO
RK5CYII=

------_=_NextPart_001_01CE6779.A7D0D4C6--

--===============1889146613462116998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1889146613462116998==--
