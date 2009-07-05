From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Device tree BSP
Date: Sun, 5 Jul 2009 19:18:12 +1000
Message-ID: <1d3f23370907050218l6b2eb9emdbcb7dc321dbab5a@mail.gmail.com>
References: <4A49F472.3030902@petalogix.com>
	<20090704181837.4DC219B0051@mail75-va3.bigfish.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0427579397=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090704181837.4DC219B0051-AP5P7IoXhpo/OHOHf44ZtvYhGscHeamf@public.gmane.org>
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
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0427579397==
Content-Type: multipart/alternative; boundary=0016364ee590616b5f046df1de2e

--0016364ee590616b5f046df1de2e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sun, Jul 5, 2009 at 4:15 AM, Stephen Neuendorffer <
stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

>
>
> I'm not exactly sure what you're trying to do here, but it doesn't look
> right to me.
> In particular, why would I have to have a separate core for these
> functions?
> Furthermore, I'm sure there must be some generic mechanisms that can/should
> be used for these kind of things.
> In general, we shouldn't reinvent the wheel here..
>

The issue as I see it is that in a hardware design, the GPIO is a very
convenient core to drive a heartbeat LED, and aux input on proc_sys_reset
(for software-driven reset), or whatever.

Clearly you don't want these GPIO cores to enumerate as regular xps_gpio
devices, binding to the standard GPIO driver and appearing in /dev/gpioN

Is your concern the manual override of OF_ binding (the "compatible"
strings), or just the HW overhead of an extra core to drive these HW utility
functions?  Save us from the bad old days of "misc_logic"  IP cores that
drove this stuff in older Xilinx reference designs!

Would you propose to get tricky and allocate specific bits on existing GPIOs
for these "special" functions, and write the GPIO driver/framework to mask
off these bits etc?  Seems like a complicated software solution to a problem
trivially solved with a few extra gates.

Cheers,

John
-- 
John Williams, PhD, B.Eng, B.IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663

--0016364ee590616b5f046df1de2e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sun, Jul 5, 2009 at 4:15 AM, Stephen =
Neuendorffer <span dir=3D"ltr">&lt;<a href=3D"mailto:stephen.neuendorffer@x=
ilinx.com">stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 20=
4); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">







<div>

<br>
<br>

<p><font size=3D"2">I&#39;m not exactly sure what you&#39;re trying to do h=
ere, but it doesn&#39;t look right to me.<br>
In particular, why would I have to have a separate core for these functions=
?<br>
Furthermore, I&#39;m sure there must be some generic mechanisms that can/sh=
ould be used for these kind of things.<br>
In general, we shouldn&#39;t reinvent the wheel here..</font></p></div></bl=
ockquote><div><br>The issue as I see it is that in a hardware design, the G=
PIO is a very convenient core to drive a heartbeat LED, and aux input on pr=
oc_sys_reset (for software-driven reset), or whatever.<br>
=A0<br>Clearly you don&#39;t want these GPIO cores to enumerate as regular =
xps_gpio devices, binding to the standard GPIO driver and appearing in /dev=
/gpioN<br><br>Is your concern the manual override of OF_ binding (the &quot=
;compatible&quot; strings), or just the HW overhead of an extra core to dri=
ve these HW utility functions?=A0 Save us from the bad old days of &quot;mi=
sc_logic&quot;=A0 IP cores that drove this stuff in older Xilinx reference =
designs!<br>
<br>Would you propose to get tricky and allocate specific bits on existing =
GPIOs for these &quot;special&quot; functions, and write the GPIO driver/fr=
amework to mask off these bits etc?=A0 Seems like a complicated software so=
lution to a problem trivially solved with a few extra gates.<br>
<br>Cheers,<br><br>John<br></div></div>-- <br>John Williams, PhD, B.Eng, <a=
 href=3D"http://B.IT">B.IT</a><br>PetaLogix - Linux Solutions for a Reconfi=
gurable World<br>w: <a href=3D"http://www.petalogix.com">www.petalogix.com<=
/a> =A0p: +61-7-30090663 =A0f: +61-7-30090663<br>


--0016364ee590616b5f046df1de2e--

--===============0427579397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0427579397==--
