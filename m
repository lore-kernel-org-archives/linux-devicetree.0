Return-Path: <SRS0=8A1h=WD=gmail.com=tushar.2nov@kernel.org>
MIME-Version: 1.0
References: <20190717192616.1731-1-tushar.khandelwal@arm.com>
 <20190717192616.1731-2-tushar.khandelwal@arm.com> <CABb+yY04vW-i35N6P57KSKgmMAYkrA2CDyUvA-bLCZMxiZaocw@mail.gmail.com>
 <20190802105938.GG23424@e107155-lin> <998A97B0-D9D3-4F01-B5D4-56F875D38FC8@arm.com>
In-Reply-To: <998A97B0-D9D3-4F01-B5D4-56F875D38FC8@arm.com>
From: Tushar K <tushar.2nov@gmail.com>
Date: Wed, 7 Aug 2019 12:32:45 +0100
Message-ID: <CAEVvzVRdbyYGLA1tnO5ZJyhUVjBMqKBSz5m23QicjPebgfwFpQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] mailbox: arm_mhuv2: add device tree binding documentation
Content-Type: multipart/alternative; boundary="000000000000798add058f854d47"
To: Tushar Khandelwal <Tushar.Khandelwal@arm.com>
Cc: Sudeep Holla <Sudeep.Holla@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "morten_bp@live.dk" <morten_bp@live.dk>, nd <nd@arm.com>, Morten Petersen <Morten.Petersen@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000798add058f854d47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore the disclaimers in the previous replies. This is a problem
with the server which I am looking into.

On Wed, 7 Aug 2019 at 12:17, Tushar Khandelwal <Tushar.Khandelwal@arm.com>
wrote:

>
>
> =EF=BB=BFOn 02/08/2019, 11:59, "Sudeep Holla" <sudeep.holla@arm.com> wrot=
e:
>
>     On Sun, Jul 21, 2019 at 04:58:04PM -0500, Jassi Brar wrote:
>     > On Wed, Jul 17, 2019 at 2:26 PM Tushar Khandelwal
>     > <tushar.khandelwal@arm.com> wrote:
>     >
>     > > diff --git
> a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
> b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
>     > > new file mode 100644
>     > > index 000000000000..3a05593414bc
>     > > --- /dev/null
>     > > +++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
>     > > @@ -0,0 +1,108 @@
>     > > +Arm MHUv2 Mailbox Driver
>     > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>     > > +
>     > > +The Arm Message-Handling-Unit (MHU) Version 2 is a mailbox
> controller that has
>     > > +between 1 and 124 channel windows to provide unidirectional
> communication with
>     > > +remote processor(s).
>     > > +
>     > > +Given the unidirectional nature of the device, an MHUv2 mailbox
> may only be
>     > > +written to or read from. If a pair of MHU devices is implemented
> between two
>     > > +processing elements to provide bidirectional communication, thes=
e
> must be
>     > > +specified as two separate mailboxes.
>     > > +
>     > > +A device tree node for an Arm MHUv2 device must specify either a
> receiver frame
>     > > +or a sender frame, indicating which end of the unidirectional MH=
U
> device which
>     > > +the device node entry describes.
>     > > +
>     > > +An MHU device must be specified with a transport protocol. The
> transport
>     > > +protocol of an MHU device determines the method of data
> transmission as well as
>     > > +the number of provided mailboxes.
>     > > +Following are the possible transport protocol types:
>     > > +- Single-word: An MHU device implements as many mailboxes as it
>     > > +               provides channel windows. Data is transmitted
> through
>     > > +               the MHU registers.
>     > > +- Multi-word:  An MHU device implements a single mailbox. All
> channel windows
>     > > +               will be used during transmission. Data is
> transmitted through
>     > > +               the MHU registers.
>     > > +- Doorbell:    An MHU device implements as many mailboxes as
> there are flag
>     > > +               bits available in its channel windows. Optionally=
,
> data may
>     > > +               be transmitted through a shared memory region,
> wherein the MHU
>     > > +               is used strictly as an interrupt generation
> mechanism.
>     > > +
>     > > +Mailbox Device Node:
>     > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     > > +
>     > > +Required properties:
>     > > +--------------------
>     > > +- compatible:  Shall be "arm,mhuv2" & "arm,primecell"
>     > > +- reg:         Contains the mailbox register address range (base
>     > > +               address and length)
>     > > +- #mbox-cells  Shall be 1 - the index of the channel needed.
>     > > +- mhu-frame    Frame type of the device.
>     > > +               Shall be either "sender" or "receiver"
>     > > +- mhu-protocol Transport protocol of the device. Shall be one of
> the
>     > > +               following: "single-word", "multi-word", "doorbell=
"
>     > > +
>     > > +Required properties (receiver frame):
>     > > +-------------------------------------
>     > > +- interrupts:  Contains the interrupt information corresponding
> to the
>     > > +               combined interrupt of the receiver frame
>     > > +
>     > > +Example:
>     > > +--------
>     > > +
>     > > +       mbox_mw_tx: mhu@10000000 {
>     > > +               compatible =3D "arm,mhuv2","arm,primecell";
>     > > +               reg =3D <0x10000000 0x1000>;
>     > > +               clocks =3D <&refclk100mhz>;
>     > > +               clock-names =3D "apb_pclk";
>     > > +               #mbox-cells =3D <1>;
>     > > +               mhu-protocol =3D "multi-word";
>     > > +               mhu-frame =3D "sender";
>     > > +       };
>     > > +
>     > > +       mbox_sw_tx: mhu@10000000 {
>     > > +               compatible =3D "arm,mhuv2","arm,primecell";
>     > > +               reg =3D <0x11000000 0x1000>;
>     > > +               clocks =3D <&refclk100mhz>;
>     > > +               clock-names =3D "apb_pclk";
>     > > +               #mbox-cells =3D <1>;
>     > > +               mhu-protocol =3D "single-word";
>     > > +               mhu-frame =3D "sender";
>     > > +       };
>     > > +
>     > > +       mbox_db_rx: mhu@10000000 {
>     > > +               compatible =3D "arm,mhuv2","arm,primecell";
>     > > +               reg =3D <0x12000000 0x1000>;
>     > > +               clocks =3D <&refclk100mhz>;
>     > > +               clock-names =3D "apb_pclk";
>     > > +               #mbox-cells =3D <1>;
>     > > +               interrupts =3D <0 45 4>;
>     > > +               interrupt-names =3D "mhu_rx";
>     > > +               mhu-protocol =3D "doorbell";
>     > > +               mhu-frame =3D "receiver";
>     > > +       };
>     > > +
>     > > +       mhu_client: scb@2e000000 {
>     > > +       compatible =3D "fujitsu,mb86s70-scb-1.0";
>     > > +       reg =3D <0 0x2e000000 0x4000>;
>     > > +       mboxes =3D
>     > > +               // For multi-word frames, client may only
> instantiate a single
>     > > +               // mailbox for a mailbox controller
>     > > +               <&mbox_mw_tx 0>,
>     > > +
>     > > +               // For single-word frames, client may instantiate
> as many
>     > > +               // mailboxes as there are channel windows in the
> MHU
>     > > +                <&mbox_sw_tx 0>,
>     > > +                <&mbox_sw_tx 1>,
>     > > +                <&mbox_sw_tx 2>,
>     > > +                <&mbox_sw_tx 3>,
>     > > +
>     > > +               // For doorbell frames, client may instantiate as
> many mailboxes
>     > > +               // as there are bits available in the combined
> number of channel
>     > > +               // windows ((channel windows * 32) mailboxes)
>     > > +                <mbox_db_rx 0>,
>     > > +                <mbox_db_rx 1>,
>     > > +                ...
>     > > +                <mbox_db_rx 17>;
>     > > +       };
>     >
>     > If the mhuv2 instance implements, say, 3 channel windows between
>     > sender (linux) and receiver (firmware), and Linux runs two protocol=
s
>     > each requiring 1 and 2-word sized messages respectively. The hardwa=
re
>     > supports that by assigning windows [0] and [1,2] to each protocol.
>     > However, I don't think the driver can support that. Or does it?
>     >
>
>     FWIW, the IP is designed to cover wide range of usecase from IoT to
> servers
>     with variable window length. I don't see the need to complicate the
> driver
>     supporting mix-n-match at the cost of latency. Each platform choose o=
ne
>     transport protocol for all it's use.
>
> The driver design is to address the most probable scenarios and not all.
> Single-word : Client gets one 32-bit window
> Doorbell : Client gets 32 data pointers (arm_message)
> Multi-word: Client gets all channels available in the platform.
>
> --Tushar
>     --
>     Regards,
>     Sudeep
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy th=
e
> information in any medium. Thank you.
>

--000000000000798add058f854d47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Please ignore the disclaimers in the previous rep=
lies. This is a problem with the server which I am looking into.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, 7 Aug 2019 at 12:17, Tushar Khandelwal &lt;<a href=3D"mailto:Tushar.Khan=
delwal@arm.com">Tushar.Khandelwal@arm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
=EF=BB=BFOn 02/08/2019, 11:59, &quot;Sudeep Holla&quot; &lt;<a href=3D"mail=
to:sudeep.holla@arm.com" target=3D"_blank">sudeep.holla@arm.com</a>&gt; wro=
te:<br>
<br>
=C2=A0 =C2=A0 On Sun, Jul 21, 2019 at 04:58:04PM -0500, Jassi Brar wrote:<b=
r>
=C2=A0 =C2=A0 &gt; On Wed, Jul 17, 2019 at 2:26 PM Tushar Khandelwal<br>
=C2=A0 =C2=A0 &gt; &lt;<a href=3D"mailto:tushar.khandelwal@arm.com" target=
=3D"_blank">tushar.khandelwal@arm.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; diff --git a/Documentation/devicetree/bindings/mail=
box/arm,mhuv2.txt b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt=
<br>
=C2=A0 =C2=A0 &gt; &gt; new file mode 100644<br>
=C2=A0 =C2=A0 &gt; &gt; index 000000000000..3a05593414bc<br>
=C2=A0 =C2=A0 &gt; &gt; --- /dev/null<br>
=C2=A0 =C2=A0 &gt; &gt; +++ b/Documentation/devicetree/bindings/mailbox/arm=
,mhuv2.txt<br>
=C2=A0 =C2=A0 &gt; &gt; @@ -0,0 +1,108 @@<br>
=C2=A0 =C2=A0 &gt; &gt; +Arm MHUv2 Mailbox Driver<br>
=C2=A0 =C2=A0 &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +The Arm Message-Handling-Unit (MHU) Version 2 is a=
 mailbox controller that has<br>
=C2=A0 =C2=A0 &gt; &gt; +between 1 and 124 channel windows to provide unidi=
rectional communication with<br>
=C2=A0 =C2=A0 &gt; &gt; +remote processor(s).<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +Given the unidirectional nature of the device, an =
MHUv2 mailbox may only be<br>
=C2=A0 =C2=A0 &gt; &gt; +written to or read from. If a pair of MHU devices =
is implemented between two<br>
=C2=A0 =C2=A0 &gt; &gt; +processing elements to provide bidirectional commu=
nication, these must be<br>
=C2=A0 =C2=A0 &gt; &gt; +specified as two separate mailboxes.<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +A device tree node for an Arm MHUv2 device must sp=
ecify either a receiver frame<br>
=C2=A0 =C2=A0 &gt; &gt; +or a sender frame, indicating which end of the uni=
directional MHU device which<br>
=C2=A0 =C2=A0 &gt; &gt; +the device node entry describes.<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +An MHU device must be specified with a transport p=
rotocol. The transport<br>
=C2=A0 =C2=A0 &gt; &gt; +protocol of an MHU device determines the method of=
 data transmission as well as<br>
=C2=A0 =C2=A0 &gt; &gt; +the number of provided mailboxes.<br>
=C2=A0 =C2=A0 &gt; &gt; +Following are the possible transport protocol type=
s:<br>
=C2=A0 =C2=A0 &gt; &gt; +- Single-word: An MHU device implements as many ma=
ilboxes as it<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0provides channel windows. Data is transmitted through<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0the MHU registers.<br>
=C2=A0 =C2=A0 &gt; &gt; +- Multi-word:=C2=A0 An MHU device implements a sin=
gle mailbox. All channel windows<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0will be used during transmission. Data is transmitted through<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0the MHU registers.<br>
=C2=A0 =C2=A0 &gt; &gt; +- Doorbell:=C2=A0 =C2=A0 An MHU device implements =
as many mailboxes as there are flag<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bits available in its channel windows. Optionally, data may<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0be transmitted through a shared memory region, wherein the MHU<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0is used strictly as an interrupt generation mechanism.<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +Mailbox Device Node:<br>
=C2=A0 =C2=A0 &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +Required properties:<br>
=C2=A0 =C2=A0 &gt; &gt; +--------------------<br>
=C2=A0 =C2=A0 &gt; &gt; +- compatible:=C2=A0 Shall be &quot;arm,mhuv2&quot;=
 &amp; &quot;arm,primecell&quot;<br>
=C2=A0 =C2=A0 &gt; &gt; +- reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Contains t=
he mailbox register address range (base<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0address and length)<br>
=C2=A0 =C2=A0 &gt; &gt; +- #mbox-cells=C2=A0 Shall be 1 - the index of the =
channel needed.<br>
=C2=A0 =C2=A0 &gt; &gt; +- mhu-frame=C2=A0 =C2=A0 Frame type of the device.=
<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Shall be either &quot;sender&quot; or &quot;receiver&quot;<br>
=C2=A0 =C2=A0 &gt; &gt; +- mhu-protocol Transport protocol of the device. S=
hall be one of the<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0following: &quot;single-word&quot;, &quot;multi-word&quot;, &quot;doo=
rbell&quot;<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +Required properties (receiver frame):<br>
=C2=A0 =C2=A0 &gt; &gt; +-------------------------------------<br>
=C2=A0 =C2=A0 &gt; &gt; +- interrupts:=C2=A0 Contains the interrupt informa=
tion corresponding to the<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0combined interrupt of the receiver frame<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +Example:<br>
=C2=A0 =C2=A0 &gt; &gt; +--------<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mbox_mw_tx: mhu@1000000=
0 {<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0compatible =3D &quot;arm,mhuv2&quot;,&quot;arm,primecell&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reg =3D &lt;0x10000000 0x1000&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clocks =3D &lt;&amp;refclk100mhz&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clock-names =3D &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0#mbox-cells =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-protocol =3D &quot;multi-word&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-frame =3D &quot;sender&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mbox_sw_tx: mhu@1000000=
0 {<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0compatible =3D &quot;arm,mhuv2&quot;,&quot;arm,primecell&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reg =3D &lt;0x11000000 0x1000&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clocks =3D &lt;&amp;refclk100mhz&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clock-names =3D &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0#mbox-cells =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-protocol =3D &quot;single-word&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-frame =3D &quot;sender&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mbox_db_rx: mhu@1000000=
0 {<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0compatible =3D &quot;arm,mhuv2&quot;,&quot;arm,primecell&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reg =3D &lt;0x12000000 0x1000&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clocks =3D &lt;&amp;refclk100mhz&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clock-names =3D &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0#mbox-cells =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interrupts =3D &lt;0 45 4&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interrupt-names =3D &quot;mhu_rx&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-protocol =3D &quot;doorbell&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mhu-frame =3D &quot;receiver&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mhu_client: scb@2e00000=
0 {<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;fu=
jitsu,mb86s70-scb-1.0&quot;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0 0x2e00000=
0 0x4000&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mboxes =3D<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// For multi-word frames, client may only instantiate a single<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// mailbox for a mailbox controller<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&lt;&amp;mbox_mw_tx 0&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// For single-word frames, client may instantiate as many<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// mailboxes as there are channel windows in the MHU<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;mbox_sw_tx 0&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;mbox_sw_tx 1&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;mbox_sw_tx 2&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;mbox_sw_tx 3&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// For doorbell frames, client may instantiate as many mailboxes<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// as there are bits available in the combined number of channel<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0// windows ((channel windows * 32) mailboxes)<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;mbox_db_rx 0&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;mbox_db_rx 1&gt;,<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ...<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;mbox_db_rx 17&gt;;<br>
=C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; If the mhuv2 instance implements, say, 3 channel windows=
 between<br>
=C2=A0 =C2=A0 &gt; sender (linux) and receiver (firmware), and Linux runs t=
wo protocols<br>
=C2=A0 =C2=A0 &gt; each requiring 1 and 2-word sized messages respectively.=
 The hardware<br>
=C2=A0 =C2=A0 &gt; supports that by assigning windows [0] and [1,2] to each=
 protocol.<br>
=C2=A0 =C2=A0 &gt; However, I don&#39;t think the driver can support that. =
Or does it?<br>
=C2=A0 =C2=A0 &gt;<br>
<br>
=C2=A0 =C2=A0 FWIW, the IP is designed to cover wide range of usecase from =
IoT to servers<br>
=C2=A0 =C2=A0 with variable window length. I don&#39;t see the need to comp=
licate the driver<br>
=C2=A0 =C2=A0 supporting mix-n-match at the cost of latency. Each platform =
choose one<br>
=C2=A0 =C2=A0 transport protocol for all it&#39;s use.<br>
<br>
The driver design is to address the most probable scenarios and not all.<br=
>
Single-word : Client gets one 32-bit window<br>
Doorbell : Client gets 32 data pointers (arm_message)<br>
Multi-word: Client gets all channels available in the platform.<br>
<br>
--Tushar<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 Regards,<br>
=C2=A0 =C2=A0 Sudeep<br>
<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>

--000000000000798add058f854d47--
