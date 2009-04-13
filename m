From: Subodh Nijsure <sunijsur-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Where in dts file one should define IORESOURCES_(IO|MEM)?
Date: Mon, 13 Apr 2009 10:52:52 -0700
Message-ID: <003e01c9bc60$ab11c2c0$9e70150a@cisco.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282115898=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0282115898==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003F_01C9BC25.FEB2EAC0"

------=_NextPart_000_003F_01C9BC25.FEB2EAC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Disposition: inline

I have read the Documentation/powerpc/booting-without-of.txt and I am still
not clear on how manifest constants in platform_get_resource() get
translated to items in dts file.
 
Example:
 
in drivers/ide/legacy/ide_platform.c there is code that looks like this.
 
 
        res_base = platform_get_resource(pdev, IORESOURCE_IO, 0);
        res_alt = platform_get_resource(pdev, IORESOURCE_IO, 1);
 
        if (!res_base || !res_alt) {
                res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
                res_alt = platform_get_resource(pdev, IORESOURCE_MEM, 1);

If I want to specify IORESOURCE_MEM (0) and IORESOURCE_MEM ( 1) addresses in
my board specific what statements do I need to include in my dts file?
 
I have tried including them in memory {} section of dts and that doesn't
work.
 
Would appreciate help/pointer.
 
 
/Subodh Nijsure
(Standard Disclaimers Apply) 

------=_NextPart_000_003F_01C9BC25.FEB2EAC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii"=
>
<META content=3D"MSHTML 6.00.2900.3492" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>I have r=
ead the=20
Documentation/powerpc/booting-without-of.txt and I am still not clear on h=
ow=20
manifest constants in platform_get_resource() get translated to items in d=
ts=20
file.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009>Example:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>in=20
drivers/ide/legacy/ide_platform.c there is code that looks like=20
this.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res=
_base =3D=20
platform_get_resource(pdev, IORESOURCE_IO,=20
0);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res_alt =3D=20
platform_get_resource(pdev, IORESOURCE_IO, 1);</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=20
(!res_base || !res_alt)=20
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=20
res_base =3D platform_get_resource(pdev, IORESOURCE_MEM,=20
0);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
res_alt =3D platform_get_resource(pdev, IORESOURCE_MEM,=20
1);<BR></SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>If I wa=
nt to specify=20
IORESOURCE_MEM (0) and IORESOURCE_MEM ( 1) addresses in my board specific=
 what=20
statements do I need to include in my dts file?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>I have t=
ried=20
including them in memory {} section of dts and that doesn't=20
work.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>Would a=
ppreciate=20
help/pointer.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D798033617-13042009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>/Subodh=
=20
Nijsure</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D798033617-13042009>(Standa=
rd=20
Disclaimers Apply)&nbsp;</DIV></SPAN></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_003F_01C9BC25.FEB2EAC0--

--===============0282115898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0282115898==--
