Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <2283417.UbYyfQa1E3@diego>
References: <1454121504-12683-1-git-send-email-djkurtz@chromium.org>
	<2283417.UbYyfQa1E3@diego>
Date: Tue, 2 Feb 2016 07:59:27 +0800
Message-ID: <CAGS+omAsRFt-3tvfpeNZPBQO8Rekg_pjE9nGSNtADrMKKBGc7A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: cros-ec-keyboard: Add LOCK key to keyboard matrix
From: Daniel Kurtz <djkurtz@chromium.org>
Content-Type: multipart/alternative; boundary=001a114314dcd338b7052abe2cb0
To: Heiko Stuebner <heiko@sntech.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, YH Huang <yh.huang@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, James Chao <james_chao@asus.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--001a114314dcd338b7052abe2cb0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Feb 2, 2016 01:17, "Heiko St=C3=BCbner" <heiko@sntech.de> wrote:
>
> Hi Daniel,
>
> Am Samstag, 30. Januar 2016, 10:38:24 schrieb Daniel Kurtz:
> > From: James Chao <james_chao@asus.com>
> >
> > The LOCK key is at KSO9/KSI3 for Chromebook Flip and other devices
> > that use the Chrome OS EC keyboard matrix.
> >
> > Signed-off-by: James Chao <james_chao@asus.com>
> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> > Signed-off-by: YH Huang <yh.huang@mediatek.com>
>
> that should probably be a
>         Reviewed-by: YH Huang <yh.huang@mediatek.com>
> As I don't see any actual patch handling step by him/her.

YH independently uploaded an identical patch to a different ChromeOS kernel
version (v3.18) with his SOB to support a different device.
I wasn't sure how to deal with it, so I merged the SOB lists when posting
upstream.

> Also, you might've included Olof as the keeper of all things ChromeOS whe=
n
> sending.
>
> @Olof: this seems to be pretty Veyron-specific for the moment, so I'm
inclined
> to pick that up. Please holler if you disagree and want to pick it up
yourself
> ;-)
>
>
> Thanks
> Heiko
>
> > ---
> >  arch/arm/boot/dts/cros-ec-keyboard.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> > b/arch/arm/boot/dts/cros-ec-keyboard.dtsi index 4e42f30c..c045105 10064=
4
> > --- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> > +++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
> > @@ -55,6 +55,7 @@
> >                       MATRIX_KEY(0x03, 0x04, KEY_F5)
> >                       MATRIX_KEY(0x03, 0x06, KEY_6)
> >                       MATRIX_KEY(0x03, 0x08, KEY_MINUS)
> > +                     MATRIX_KEY(0x03, 0x09, KEY_F13)
> >                       MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)
> >                       MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)
>

--001a114314dcd338b7052abe2cb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Feb 2, 2016 01:17, &quot;Heiko St=C3=BCbner&quot; &lt;<a href=3D"mailto:=
heiko@sntech.de">heiko@sntech.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Daniel,<br>
&gt;<br>
&gt; Am Samstag, 30. Januar 2016, 10:38:24 schrieb Daniel Kurtz:<br>
&gt; &gt; From: James Chao &lt;<a href=3D"mailto:james_chao@asus.com">james=
_chao@asus.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The LOCK key is at KSO9/KSI3 for Chromebook Flip and other device=
s<br>
&gt; &gt; that use the Chrome OS EC keyboard matrix.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: James Chao &lt;<a href=3D"mailto:james_chao@asus.c=
om">james_chao@asus.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Daniel Kurtz &lt;<a href=3D"mailto:djkurtz@chromiu=
m.org">djkurtz@chromium.org</a>&gt;<br>
&gt; &gt; Signed-off-by: YH Huang &lt;<a href=3D"mailto:yh.huang@mediatek.c=
om">yh.huang@mediatek.com</a>&gt;<br>
&gt;<br>
&gt; that should probably be a<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reviewed-by: YH Huang &lt;<a href=3D"mailt=
o:yh.huang@mediatek.com">yh.huang@mediatek.com</a>&gt;<br>
&gt; As I don&#39;t see any actual patch handling step by him/her.</p>
<p dir=3D"ltr">YH independently uploaded an identical patch to a different =
ChromeOS kernel version (v3.18) with his SOB to support a different device.=
<br>
I wasn&#39;t sure how to deal with it, so I merged the SOB lists when posti=
ng upstream.</p>
<p dir=3D"ltr">&gt; Also, you might&#39;ve included Olof as the keeper of a=
ll things ChromeOS when<br>
&gt; sending.<br>
&gt;<br>
&gt; @Olof: this seems to be pretty Veyron-specific for the moment, so I&#3=
9;m inclined<br>
&gt; to pick that up. Please holler if you disagree and want to pick it up =
yourself<br>
&gt; ;-)<br>
&gt;<br>
&gt;<br>
&gt; Thanks<br>
&gt; Heiko<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 arch/arm/boot/dts/cros-ec-keyboard.dtsi | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi<br>
&gt; &gt; b/arch/arm/boot/dts/cros-ec-keyboard.dtsi index 4e42f30c..c045105=
 100644<br>
&gt; &gt; --- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi<br>
&gt; &gt; +++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi<br>
&gt; &gt; @@ -55,6 +55,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MATRIX_KEY(0x03, 0x04, KEY_F5)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MATRIX_KEY(0x03, 0x06, KEY_6)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MATRIX_KEY(0x03, 0x08, KEY_MINUS)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0MATRIX_KEY(0x03, 0x09, KEY_F13)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)<br>
&gt;<br>
</p>

--001a114314dcd338b7052abe2cb0--
