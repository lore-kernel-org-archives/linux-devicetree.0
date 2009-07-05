From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Device tree BSP
Date: Sun, 5 Jul 2009 13:43:47 -0700
Message-ID: <20090705204647.1BBCAB2004B@mail107-dub.bigfish.com>
References: <4A49F472.3030902@petalogix.com><20090704181837.4DC219B0051@mail75-va3.bigfish.com>
	<1d3f23370907050218l6b2eb9emdbcb7dc321dbab5a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129750363=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Class: urn:content-classes:message
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
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1129750363==
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C9FDB1.B4F0087F"

------_=_NextPart_001_01C9FDB1.B4F0087F
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


My (limited) understanding from reading other posts is that there is alread=
y a GPIO subsystem for handling such misc-GPIO things.
To me the cost of gates for multiple GPIO cores is small compared to the sy=
stem cost of having
a separate OF binding.  IMHO, this should be exposed the way any other GPIO=
 with such capabilities
is on any other OF/device-tree enabled system.

Steve

-----Original Message-----
From: John Williams [mailto:john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org]
Sent: Sun 7/5/2009 2:18 AM
To: Stephen Neuendorffer
Cc: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org; John Linn; David DeBonis; devicetree-discus=
s@ozlabs.org
Subject: Re: Device tree BSP
 =

On Sun, Jul 5, 2009 at 4:15 AM, Stephen Neuendorffer <
stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

>
>
> I'm not exactly sure what you're trying to do here, but it doesn't look
> right to me.
> In particular, why would I have to have a separate core for these
> functions?
> Furthermore, I'm sure there must be some generic mechanisms that can/shou=
ld
> be used for these kind of things.
> In general, we shouldn't reinvent the wheel here..
>

The issue as I see it is that in a hardware design, the GPIO is a very
convenient core to drive a heartbeat LED, and aux input on proc_sys_reset
(for software-driven reset), or whatever.

Clearly you don't want these GPIO cores to enumerate as regular xps_gpio
devices, binding to the standard GPIO driver and appearing in /dev/gpioN

Is your concern the manual override of OF_ binding (the "compatible"
strings), or just the HW overhead of an extra core to drive these HW utilit=
y
functions?  Save us from the bad old days of "misc_logic"  IP cores that
drove this stuff in older Xilinx reference designs!

Would you propose to get tricky and allocate specific bits on existing GPIO=
s
for these "special" functions, and write the GPIO driver/framework to mask
off these bits etc?  Seems like a complicated software solution to a proble=
m
trivially solved with a few extra gates.

Cheers,

John
-- =

John Williams, PhD, B.Eng, B.IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


------_=_NextPart_001_01C9FDB1.B4F0087F
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version 6.5.7654.12"=
>
<TITLE>RE: Device tree BSP</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>

<P><FONT SIZE=3D2>My (limited) understanding from reading other posts is th=
at there is already a GPIO subsystem for handling such misc-GPIO things.<BR=
>
To me the cost of gates for multiple GPIO cores is small compared to the sy=
stem cost of having<BR>
a separate OF binding.&nbsp; IMHO, this should be exposed the way any other=
 GPIO with such capabilities<BR>
is on any other OF/device-tree enabled system.<BR>
<BR>
Steve<BR>
<BR>
-----Original Message-----<BR>
From: John Williams [<A HREF=3D"mailto:john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org">mailto:=
john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org</A>]<BR>
Sent: Sun 7/5/2009 2:18 AM<BR>
To: Stephen Neuendorffer<BR>
Cc: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org; John Linn; David DeBonis; devicetree-discus=
s@ozlabs.org<BR>
Subject: Re: Device tree BSP<BR>
<BR>
On Sun, Jul 5, 2009 at 4:15 AM, Stephen Neuendorffer &lt;<BR>
stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org&gt; wrote:<BR>
<BR>
&gt;<BR>
&gt;<BR>
&gt; I'm not exactly sure what you're trying to do here, but it doesn't loo=
k<BR>
&gt; right to me.<BR>
&gt; In particular, why would I have to have a separate core for these<BR>
&gt; functions?<BR>
&gt; Furthermore, I'm sure there must be some generic mechanisms that can/s=
hould<BR>
&gt; be used for these kind of things.<BR>
&gt; In general, we shouldn't reinvent the wheel here..<BR>
&gt;<BR>
<BR>
The issue as I see it is that in a hardware design, the GPIO is a very<BR>
convenient core to drive a heartbeat LED, and aux input on proc_sys_reset<B=
R>
(for software-driven reset), or whatever.<BR>
<BR>
Clearly you don't want these GPIO cores to enumerate as regular xps_gpio<BR=
>
devices, binding to the standard GPIO driver and appearing in /dev/gpioN<BR=
>
<BR>
Is your concern the manual override of OF_ binding (the &quot;compatible&qu=
ot;<BR>
strings), or just the HW overhead of an extra core to drive these HW utilit=
y<BR>
functions?&nbsp; Save us from the bad old days of &quot;misc_logic&quot;&nb=
sp; IP cores that<BR>
drove this stuff in older Xilinx reference designs!<BR>
<BR>
Would you propose to get tricky and allocate specific bits on existing GPIO=
s<BR>
for these &quot;special&quot; functions, and write the GPIO driver/framewor=
k to mask<BR>
off these bits etc?&nbsp; Seems like a complicated software solution to a p=
roblem<BR>
trivially solved with a few extra gates.<BR>
<BR>
Cheers,<BR>
<BR>
John<BR>
--<BR>
John Williams, PhD, B.Eng, B.IT<BR>
PetaLogix - Linux Solutions for a Reconfigurable World<BR>
w: www.petalogix.com&nbsp; p: +61-7-30090663&nbsp; f: +61-7-30090663<BR>
<BR>
</FONT>
</P>

<br clear=3Dall> This email and any attachments are intended for the sole u=
se of the named recipient(s) and contain(s) confidential information that m=
ay be proprietary, privileged or copyrighted under applicable law. If you a=
re not the intended recipient, do not read, copy, or forward this email mes=
sage or any attachments. Delete this email message and any attachments imme=
diately.
</BODY>
</HTML>


------_=_NextPart_001_01C9FDB1.B4F0087F--

--===============1129750363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1129750363==--
