From: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Device tree BSP
Date: Sat, 4 Jul 2009 20:32:58 +0200
Message-ID: <e6a72e5f0907041132g7da22452j5939ad5d163a9646@mail.gmail.com>
References: <4A49F472.3030902@petalogix.com>
	<20090704181837.6224D13E8056@mail113-va3.bigfish.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289017642=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090704181837.6224D13E8056-4w96H/B/PjLzgBzxlff1BqQXxVRGGlT3@public.gmane.org>
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
Cc: John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1289017642==
Content-Type: multipart/alternative; boundary=0015174c0eca86be63046de580a2

--0015174c0eca86be63046de580a2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/7/4 Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

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
> CC'ing devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, which is really the best place to
> ask such questions.



Yes, I know - I talked with Grant about too. And I found a solution for
heartbeat.
We have there one small problem that led-gpio heartbeat trigger starts when
driver is ready (long time from the system start)
Current heartbeat works when timer/intc is setup. That big time gap between
current - proposed solution I don't like and
I want to remove it.
I am doing different work now and I'll solve it later.

Thanks,
Michal


>
>
> Steve
>
> -----Original Message-----
> From: Michal Simek [mailto:michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org]
> Sent: Tue 6/30/2009 4:18 AM
> To: John Williams; John Linn; David DeBonis; Stephen Neuendorffer
> Subject: Device tree BSP
>
> Hi all,
>
> I need to talk to you about names for at least one new compatible
> property name.
> It is for heartbeat led gpio and (not important now) reset gpio.
> Currently linux kernel takes
> first gpio for heartbeat led which needn't be led gpio that's why we
> need to specify which gpio
> node is for it. I think we can't used it aliases because in case you
> enable gpio linux driver
> heartbeat go away because that node had gpio compatible property.
>
> Our proposed compatible names are xlnx,heartbeat-gpio-1.00.a and
> xlnx,reset-gpio-1.00.a
> which replaced all gpio compatible properties. Below are two parts of
> fragments.
>
> LEDs_8Bit: gpio@42000000 {
>    compatible = "xlnx,heartbeat-gpio-1.00.a";
>    reg = < 0x42000000 0x10000 >;
>    xlnx,all-inputs = <0x0>;
>
> Push_Buttons: gpio@42600000 {
>    compatible = "xlnx,reset-gpio-1.00.a";
>    interrupt-parent = <&xps_intc_0>;
>    interrupts = < 4 2 >;
>
> If you agree with heartbeat name, I will change it in linux kernel code.
>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng)
> PetaLogix - Linux Solutions for a Reconfigurable World
> w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
>
>
>
>
>
> This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be
> proprietary, privileged or copyrighted under applicable law. If you are not
> the intended recipient, do not read, copy, or forward this email message or
> any attachments. Delete this email message and any attachments immediately.
>
>


-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663

--0015174c0eca86be63046de580a2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2009/7/4 Stephen Neuendorffer <span dir=
=3D"ltr">&lt;<a href=3D"mailto:stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org">stephen.neu=
endorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org</a>&gt;</span><br><blockquote class=3D"gmail_quote" st=
yle=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex=
; padding-left: 1ex;">
<br>
<br>
I&#39;m not exactly sure what you&#39;re trying to do here, but it doesn&#3=
9;t look right to me.<br>
In particular, why would I have to have a separate core for these functions=
?<br>
Furthermore, I&#39;m sure there must be some generic mechanisms that can/sh=
ould be used for these kind of things.<br>
In general, we shouldn&#39;t reinvent the wheel here..<br>
<br>
CC&#39;ing <a href=3D"mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org">devicetree-disc=
uss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org</a>, which is really the best place to ask such questions.</=
blockquote><div><br><br>Yes, I know - I talked with Grant about too. And I =
found a solution for heartbeat.<br>

We have there one small problem that led-gpio heartbeat trigger starts when=
 driver is ready (long time from the system start)<br>
Current heartbeat works when timer/intc is setup. That big time gap between=
 current - proposed solution I don&#39;t like and <br>
I want to remove it. <br>
I am doing different work now and I&#39;ll solve it later. <br>
<br>
Thanks,<br>
Michal<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"border-left: =
1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;=
"><br>
<br>
Steve<br>
<div class=3D"im"><br>
-----Original Message-----<br>
From: Michal Simek [mailto:<a href=3D"mailto:michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org">mi=
chal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org</a>]<br>
</div><div class=3D"im">Sent: Tue 6/30/2009 4:18 AM<br>
To: John Williams; John Linn; David DeBonis; Stephen Neuendorffer<br>
Subject: Device tree BSP<br>
<br>
</div><div><div></div><div class=3D"h5">Hi all,<br>
<br>
I need to talk to you about names for at least one new compatible<br>
property name.<br>
It is for heartbeat led gpio and (not important now) reset gpio.<br>
Currently linux kernel takes<br>
first gpio for heartbeat led which needn&#39;t be led gpio that&#39;s why w=
e<br>
need to specify which gpio<br>
node is for it. I think we can&#39;t used it aliases because in case you<br=
>
enable gpio linux driver<br>
heartbeat go away because that node had gpio compatible property.<br>
<br>
Our proposed compatible names are xlnx,heartbeat-gpio-1.00.a and<br>
xlnx,reset-gpio-1.00.a<br>
which replaced all gpio compatible properties. Below are two parts of<br>
fragments.<br>
<br>
LEDs_8Bit: gpio@42000000 {<br>
 =A0 =A0compatible =3D &quot;xlnx,heartbeat-gpio-1.00.a&quot;;<br>
 =A0 =A0reg =3D &lt; 0x42000000 0x10000 &gt;;<br>
 =A0 =A0xlnx,all-inputs =3D &lt;0x0&gt;;<br>
<br>
Push_Buttons: gpio@42600000 {<br>
 =A0 =A0compatible =3D &quot;xlnx,reset-gpio-1.00.a&quot;;<br>
 =A0 =A0interrupt-parent =3D &lt;&amp;xps_intc_0&gt;;<br>
 =A0 =A0interrupts =3D &lt; 4 2 &gt;;<br>
<br>
If you agree with heartbeat name, I will change it in linux kernel code.<br=
>
<br>
Thanks,<br>
Michal<br>
<br>
--<br>
Michal Simek, Ing. (M.Eng)<br>
PetaLogix - Linux Solutions for a Reconfigurable World<br>
w: <a href=3D"http://www.petalogix.com" target=3D"_blank">www.petalogix.com=
</a> p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663<br>
<br>
<br>
<br>
<br>
<br>
</div></div><div><div></div><div class=3D"h5">This email and any attachment=
s are intended for the sole use of the named recipient(s) and contain(s) co=
nfidential information that may be proprietary, privileged or copyrighted u=
nder applicable law. If you are not the intended recipient, do not read, co=
py, or forward this email message or any attachments. Delete this email mes=
sage and any attachments immediately.<br>

<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Michal Sime=
k, Ing. (M.Eng)<br>PetaLogix - Linux Solutions for a Reconfigurable World<b=
r>w: <a href=3D"http://www.petalogix.com">www.petalogix.com</a> p: +61-7-30=
090663,+42-0-721842854 f: +61-7-30090663<br>


--0015174c0eca86be63046de580a2--

--===============1289017642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1289017642==--
