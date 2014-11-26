Return-Path: <andy.green@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAJe_ZhfkcSv7oBfXdiW5=F0bZvv+9z3m90cXdy=O66VwZWCQnw@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416486872-25301-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<54749429.9080505@arm.com>
	<CAJe_ZhciCP2VbmRtrq9d14WhfLhnC-xaitCCiW_6Yf1S-0sdUg@mail.gmail.com>
	<5474C3DD.5060706@arm.com>
	<CAJe_ZhfkcSv7oBfXdiW5=F0bZvv+9z3m90cXdy=O66VwZWCQnw@mail.gmail.com>
Date: Wed, 26 Nov 2014 13:44:44 +0800
Message-ID: <CAAfg0W6eXw8HQZ=gbhGAaOfCYktq4ZBFU2=XLOAhevy6eHGfjw@mail.gmail.com>
Subject: Re: [PATCH 2/9] mailbox: arm_mhu: add driver for ARM MHU controller
From: Andy Green <andy.green@linaro.org>
Content-Type: multipart/alternative; boundary=047d7bf1617e54b00c0508bc86ee
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Vincent Yang <vincent.yang.fujitsu@gmail.com>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, Mark Rutland <Mark.Rutland@arm.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, "patches@linaro.org" <patches@linaro.org>, "olof@lixom.net" <olof@lixom.net>, Pawel Moll <Pawel.Moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bf1617e54b00c0508bc86ee
Content-Type: text/plain; charset=UTF-8

On 26 Nov 2014 13:37, "Jassi Brar" <jaswinder.singh@linaro.org> wrote:
>
> On 25 November 2014 at 23:31, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> >
> > On 25/11/14 16:51, Jassi Brar wrote:
> >>
> >> On 25 November 2014 at 20:07, Sudeep Holla <sudeep.holla@arm.com>
wrote:
> >>>
> >>>
> >>>
> >>> On 20/11/14 12:34, Vincent Yang wrote:
> >>>>
> >>>>
> >>>> Add driver for the ARM Message-Handling-Unit (MHU).
> >>>>
> >>>> Signed-off-by: Andy Green <andy.green@linaro.org>
> >>>> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> >>>> Signed-off-by: Vincent Yang <Vincent.Yang@tw.fujitsu.com>
> >>>> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
> >>>> ---
> >>>>    .../devicetree/bindings/mailbox/arm-mhu.txt        |  33 ++++
> >>>>    drivers/mailbox/Kconfig                            |   7 +
> >>>>    drivers/mailbox/Makefile                           |   2 +
> >>>>    drivers/mailbox/arm_mhu.c                          | 196
> >>>> +++++++++++++++++++++
> >>>>    4 files changed, 238 insertions(+)
> >>>>    create mode 100644
> >>>> Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>>>    create mode 100644 drivers/mailbox/arm_mhu.c
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>>> b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>>> new file mode 100644
> >>>> index 0000000..b1b9888
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
> >>>> @@ -0,0 +1,33 @@
> >>>> +ARM MHU Mailbox Driver
> >>>> +======================
> >>>> +
> >>>> +The ARM's Message-Handling-Unit (MHU) is a mailbox controller that
has
> >>>> +3 independent channels/links to communicate with remote
processor(s).
> >>>
> >>>
> >>>
> >>> I had reviewed this before and I see not all the comments are
addressed.
> >>> I had mentioned that you can't add support to _SECURE_ channel in
Linux
> >>> as you need to assume Linux runs in non-secure privilege(and I gather
> >>> that's the case even on this platform from other email in the thread)
> >>>
> >> Please revisit the old thread. After some discussion you had
> >> graciously allowed me to keep the secure channel ;)
> >> [
> >> ... Even though I don't like you have secure channel access in Linux,
you
> >> have valid reasons. In case you decide to support it ....
> >> ]
> >
> >
> > Agreed but based on the other email in the same thread it looks like you
> > want to run the same kernel both in secure and no-secure mode on this
> > platform, in which case you _have_to_assume_ it's *non-secure only*
always
> > unless you come up with some DT magic.
> >
> Yes, the S vs NS mode should ideally be defined in DT. The kernel
> image should remain the same.

If this is desirable, we can edit the related dtb path in memory
accordingly at the bootloader, since that knows at runtime if he's secure
or nonsecure.

-Andy

> >>   It seems you still don't get my point that the driver should manage
> >> all channels - S & NS. If Linux is running in NS mode on a platform,
> >> the DT will specify only some NS channel to be used. The controller
> >> driver shouldn't be crippled just because you think Linux will never
> >> be run in Secure mode.
> >>
> >
> > Ok how do you handle that, I don't see that in the DT binding. As it
> > stands, you can unconditionally try to access the secure channel and
> > cause aborts if the platform is running in non-secure mode.
> >
> No. Please look at the dtsi again ....
>
>         mhu: mailbox@2b1f0000 {
>                 #mbox-cells = <1>;
>                 compatible = "arm,mbox-mhu";
>                 reg = <0 0x2b1f0000 0x1000>;
>                 interrupts = <0 36 4>, /* LP Non-Sec */
>                              <0 35 4>, /* HP Non-Sec */
>                              <0 37 4>; /* Secure */
>         };
>
>         mhu_client: scb@2e000000 {
>                 compatible = "fujitsu,mb86s70-scb-1.0";
>                 reg = <0 0x2e000000 0x4000>; /* SHM for IPC */
>                 mboxes = <&mhu 1>;
>         };
>
> See the DT for mbox client specifies that it uses channel-1 which is
> High-Priority_Non-Secure channel.
>
> -jassi

--047d7bf1617e54b00c0508bc86ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 26 Nov 2014 13:37, &quot;Jassi Brar&quot; &lt;<a href=3D"mailto:jaswinde=
r.singh@linaro.org">jaswinder.singh@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 25 November 2014 at 23:31, Sudeep Holla &lt;<a href=3D"mailto:sudee=
p.holla@arm.com">sudeep.holla@arm.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 25/11/14 16:51, Jassi Brar wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 25 November 2014 at 20:07, Sudeep Holla &lt;<a href=3D"mai=
lto:sudeep.holla@arm.com">sudeep.holla@arm.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On 20/11/14 12:34, Vincent Yang wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Add driver for the ARM Message-Handling-Unit (MHU).<b=
r>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Signed-off-by: Andy Green &lt;<a href=3D"mailto:andy.=
green@linaro.org">andy.green@linaro.org</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; Signed-off-by: Jassi Brar &lt;<a href=3D"mailto:jaswi=
nder.singh@linaro.org">jaswinder.singh@linaro.org</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; Signed-off-by: Vincent Yang &lt;<a href=3D"mailto:Vin=
cent.Yang@tw.fujitsu.com">Vincent.Yang@tw.fujitsu.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; Signed-off-by: Tetsuya Nuriya &lt;<a href=3D"mailto:n=
uriya.tetsuya@jp.fujitsu.com">nuriya.tetsuya@jp.fujitsu.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../devicetree/bindings/mailbox/arm-mhu.=
txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++++<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/mailbox/Kconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A07 +<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/mailbox/Makefile=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/mailbox/arm_mhu.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 196<br>
&gt; &gt;&gt;&gt;&gt; +++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 4 files changed, 238 insertions(+)<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644<br>
&gt; &gt;&gt;&gt;&gt; Documentation/devicetree/bindings/mailbox/arm-mhu.txt=
<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 drivers/mailbox/arm_m=
hu.c<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; diff --git a/Documentation/devicetree/bindings/mailbo=
x/arm-mhu.txt<br>
&gt; &gt;&gt;&gt;&gt; b/Documentation/devicetree/bindings/mailbox/arm-mhu.t=
xt<br>
&gt; &gt;&gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt; index 0000000..b1b9888<br>
&gt; &gt;&gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt;&gt; +++ b/Documentation/devicetree/bindings/mailbox/arm-m=
hu.txt<br>
&gt; &gt;&gt;&gt;&gt; @@ -0,0 +1,33 @@<br>
&gt; &gt;&gt;&gt;&gt; +ARM MHU Mailbox Driver<br>
&gt; &gt;&gt;&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; &gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt; +The ARM&#39;s Message-Handling-Unit (MHU) is a mailb=
ox controller that has<br>
&gt; &gt;&gt;&gt;&gt; +3 independent channels/links to communicate with rem=
ote processor(s).<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I had reviewed this before and I see not all the comments=
 are addressed.<br>
&gt; &gt;&gt;&gt; I had mentioned that you can&#39;t add support to _SECURE=
_ channel in Linux<br>
&gt; &gt;&gt;&gt; as you need to assume Linux runs in non-secure privilege(=
and I gather<br>
&gt; &gt;&gt;&gt; that&#39;s the case even on this platform from other emai=
l in the thread)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; Please revisit the old thread. After some discussion you had<=
br>
&gt; &gt;&gt; graciously allowed me to keep the secure channel ;)<br>
&gt; &gt;&gt; [<br>
&gt; &gt;&gt; ... Even though I don&#39;t like you have secure channel acce=
ss in Linux, you<br>
&gt; &gt;&gt; have valid reasons. In case you decide to support it ....<br>
&gt; &gt;&gt; ]<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Agreed but based on the other email in the same thread it looks l=
ike you<br>
&gt; &gt; want to run the same kernel both in secure and no-secure mode on =
this<br>
&gt; &gt; platform, in which case you _have_to_assume_ it&#39;s *non-secure=
 only* always<br>
&gt; &gt; unless you come up with some DT magic.<br>
&gt; &gt;<br>
&gt; Yes, the S vs NS mode should ideally be defined in DT. The kernel<br>
&gt; image should remain the same.</p>
<p dir=3D"ltr">If this is desirable, we can edit the related dtb path in me=
mory accordingly at the bootloader, since that knows at runtime if he&#39;s=
 secure or nonsecure.</p>
<p dir=3D"ltr">-Andy</p>
<p dir=3D"ltr">&gt; &gt;&gt;=C2=A0 =C2=A0It seems you still don&#39;t get m=
y point that the driver should manage<br>
&gt; &gt;&gt; all channels - S &amp; NS. If Linux is running in NS mode on =
a platform,<br>
&gt; &gt;&gt; the DT will specify only some NS channel to be used. The cont=
roller<br>
&gt; &gt;&gt; driver shouldn&#39;t be crippled just because you think Linux=
 will never<br>
&gt; &gt;&gt; be run in Secure mode.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Ok how do you handle that, I don&#39;t see that in the DT binding=
. As it<br>
&gt; &gt; stands, you can unconditionally try to access the secure channel =
and<br>
&gt; &gt; cause aborts if the platform is running in non-secure mode.<br>
&gt; &gt;<br>
&gt; No. Please look at the dtsi again ....<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 mhu: mailbox@2b1f0000 {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #mbox-cells =
=3D &lt;1&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D=
 &quot;arm,mbox-mhu&quot;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 =
0x2b1f0000 0x1000&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D=
 &lt;0 36 4&gt;, /* LP Non-Sec */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0 35 4&gt;, /* HP Non-Sec */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0 37 4&gt;; /* Secure */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 mhu_client: scb@2e000000 {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D=
 &quot;fujitsu,mb86s70-scb-1.0&quot;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 =
0x2e000000 0x4000&gt;; /* SHM for IPC */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mboxes =3D &lt=
;&amp;mhu 1&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; See the DT for mbox client specifies that it uses channel-1 which is<b=
r>
&gt; High-Priority_Non-Secure channel.<br>
&gt;<br>
&gt; -jassi<br>
</p>

--047d7bf1617e54b00c0508bc86ee--
