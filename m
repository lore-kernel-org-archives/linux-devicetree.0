From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Device tree BSP
Date: Sat, 4 Jul 2009 11:15:10 -0700
Message-ID: <20090704181837.4DC219B0051@mail75-va3.bigfish.com>
References: <4A49F472.3030902@petalogix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1634850226=="
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
To: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1634850226==
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C9FCD3.D86AFE8F"

------_=_NextPart_001_01C9FCD3.D86AFE8F
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



I'm not exactly sure what you're trying to do here, but it doesn't look rig=
ht to me.
In particular, why would I have to have a separate core for these functions=
?
Furthermore, I'm sure there must be some generic mechanisms that can/should=
 be used for these kind of things.
In general, we shouldn't reinvent the wheel here..

CC'ing devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, which is really the best place to ask=
 such questions.

Steve

-----Original Message-----
From: Michal Simek [mailto:michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org]
Sent: Tue 6/30/2009 4:18 AM
To: John Williams; John Linn; David DeBonis; Stephen Neuendorffer
Subject: Device tree BSP
 =

Hi all,

I need to talk to you about names for at least one new compatible
property name.
It is for heartbeat led gpio and (not important now) reset gpio.
Currently linux kernel takes
first gpio for heartbeat led which needn't be led gpio that's why we
need to specify which gpio
node is for it. I think we can't used it aliases because in case you
enable gpio linux driver
heartbeat go away because that node had gpio compatible property.

Our proposed compatible names are xlnx,heartbeat-gpio-1.00.a and
xlnx,reset-gpio-1.00.a
which replaced all gpio compatible properties. Below are two parts of
fragments.

LEDs_8Bit: gpio@42000000 {
    compatible =3D "xlnx,heartbeat-gpio-1.00.a";
    reg =3D < 0x42000000 0x10000 >;
    xlnx,all-inputs =3D <0x0>;

Push_Buttons: gpio@42600000 {
    compatible =3D "xlnx,reset-gpio-1.00.a";
    interrupt-parent =3D <&xps_intc_0>;
    interrupts =3D < 4 2 >;

If you agree with heartbeat name, I will change it in linux kernel code.

Thanks,
Michal

-- =

Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663





This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


------_=_NextPart_001_01C9FCD3.D86AFE8F
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
<BR>

<P><FONT SIZE=3D2>I'm not exactly sure what you're trying to do here, but i=
t doesn't look right to me.<BR>
In particular, why would I have to have a separate core for these functions=
?<BR>
Furthermore, I'm sure there must be some generic mechanisms that can/should=
 be used for these kind of things.<BR>
In general, we shouldn't reinvent the wheel here..<BR>
<BR>
CC'ing devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, which is really the best place to ask=
 such questions.<BR>
<BR>
Steve<BR>
<BR>
-----Original Message-----<BR>
From: Michal Simek [<A HREF=3D"mailto:michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org">mailto:mi=
chal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org</A>]<BR>
Sent: Tue 6/30/2009 4:18 AM<BR>
To: John Williams; John Linn; David DeBonis; Stephen Neuendorffer<BR>
Subject: Device tree BSP<BR>
<BR>
Hi all,<BR>
<BR>
I need to talk to you about names for at least one new compatible<BR>
property name.<BR>
It is for heartbeat led gpio and (not important now) reset gpio.<BR>
Currently linux kernel takes<BR>
first gpio for heartbeat led which needn't be led gpio that's why we<BR>
need to specify which gpio<BR>
node is for it. I think we can't used it aliases because in case you<BR>
enable gpio linux driver<BR>
heartbeat go away because that node had gpio compatible property.<BR>
<BR>
Our proposed compatible names are xlnx,heartbeat-gpio-1.00.a and<BR>
xlnx,reset-gpio-1.00.a<BR>
which replaced all gpio compatible properties. Below are two parts of<BR>
fragments.<BR>
<BR>
LEDs_8Bit: gpio@42000000 {<BR>
&nbsp;&nbsp;&nbsp; compatible =3D &quot;xlnx,heartbeat-gpio-1.00.a&quot;;<B=
R>
&nbsp;&nbsp;&nbsp; reg =3D &lt; 0x42000000 0x10000 &gt;;<BR>
&nbsp;&nbsp;&nbsp; xlnx,all-inputs =3D &lt;0x0&gt;;<BR>
<BR>
Push_Buttons: gpio@42600000 {<BR>
&nbsp;&nbsp;&nbsp; compatible =3D &quot;xlnx,reset-gpio-1.00.a&quot;;<BR>
&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;xps_intc_0&gt;;<BR>
&nbsp;&nbsp;&nbsp; interrupts =3D &lt; 4 2 &gt;;<BR>
<BR>
If you agree with heartbeat name, I will change it in linux kernel code.<BR=
>
<BR>
Thanks,<BR>
Michal<BR>
<BR>
--<BR>
Michal Simek, Ing. (M.Eng)<BR>
PetaLogix - Linux Solutions for a Reconfigurable World<BR>
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663<BR=
>
<BR>
<BR>
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


------_=_NextPart_001_01C9FCD3.D86AFE8F--

--===============1634850226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1634850226==--
