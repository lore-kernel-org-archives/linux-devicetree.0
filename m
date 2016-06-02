Return-Path: <robertcnelson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1464853310-8738-1-git-send-email-yong.b.li@intel.com>
References: <1464853310-8738-1-git-send-email-yong.b.li@intel.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 2 Jun 2016 12:36:26 -0500
Message-ID: <CAOCHtYib9YxckneM-j0Gk1YE=MnvAwAhvDjEDEuFJbH6W3EcWA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am335x-boneblack: add i2c1 DT entry
Content-Type: multipart/alternative; boundary=001a113f97c2660de105344f0d54
To: Yong Li <yong.b.li@intel.com>
Cc: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux kernel <linux-kernel@vger.kernel.org>, sdliyong@gmail.com
List-ID: <devicetree@vger.kernel.org>

--001a113f97c2660de105344f0d54
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 2, 2016 at 2:41 AM, Yong Li <yong.b.li@intel.com> wrote:

> From: Yong Li <sdliyong@gmail.com>
>
> Without this patch, I2C-1 is missing on beaglebone black boards
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>
> ---
>  arch/arm/boot/dts/am335x-boneblack.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>


This is also 'common' for the white/green, if your really going to push
this, please add it to:

am335x-bone-common.dtsi


>
> diff --git a/arch/arm/boot/dts/am335x-boneblack.dts
> b/arch/arm/boot/dts/am335x-boneblack.dts
> index 55c0e95..7eee5c4 100644
> --- a/arch/arm/boot/dts/am335x-boneblack.dts
> +++ b/arch/arm/boot/dts/am335x-boneblack.dts
> @@ -64,6 +64,13 @@
>                         AM33XX_IOPAD(0x9b0, PIN_OUTPUT_PULLDOWN |
> MUX_MODE3)    /* xdma_event_intr0 */
>                 >;
>         };
> +
> +       i2c1_pins: pinmux_i2c1_pins {
> +               pinctrl-single,pins = <
> +                       AM33XX_IOPAD(0x958, PIN_INPUT_PULLUP | MUX_MODE2)
>      /* spi0_d1.i2c1_sda */
> +                       AM33XX_IOPAD(0x95c, PIN_INPUT_PULLUP | MUX_MODE2)
>      /* spi0_cs0.i2c1_scl */
> +               >;
> +       };
>  };
>
>  &lcdc {
> @@ -91,6 +98,14 @@
>         };
>  };
>
> +&i2c1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c2_pins>;
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};
> +
>  &rtc {
>         system-power-controller;
>  };
> --
> 2.7.4
>


On the other issue, P9_17/P9_18 can also be used for spi0, pwm and pr1's
uart0.  Since there are no "i2c" devices physically connected to
P9_17/P9_18, it would best to just drop this patch and load it as an
overlay (1) (2)..

1: u-boot's overlay:

https://www.mail-archive.com/u-boot@lists.denx.de/msg214241.html

2: kernel's overlay:

https://github.com/pantoniou/linux-beagle-track-mainline/tree/bbb-overlays

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

--001a113f97c2660de105344f0d54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 2, 2016 at 2:41 AM, Yong Li <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yong.b.li@intel.com" target=3D"_blank">yong.b.li@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">From: Yong Li &lt;<a href=3D"mailto:sd=
liyong@gmail.com" target=3D"_blank">sdliyong@gmail.com</a>&gt;<br>
<br>
Without this patch, I2C-1 is missing on beaglebone black boards<br>
<br>
Signed-off-by: Yong Li &lt;<a href=3D"mailto:sdliyong@gmail.com" target=3D"=
_blank">sdliyong@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/am335x-boneblack.dts | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br></blockquote><div><br></div><div>=
<br></div><div><div>This is also &#39;common&#39; for the white/green, if y=
our really going to push this, please add it to:</div><div><br></div><div>a=
m335x-bone-common.dtsi</div></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am3=
35x-boneblack.dts<br>
index 55c0e95..7eee5c4 100644<br>
--- a/arch/arm/boot/dts/am335x-boneblack.dts<br>
+++ b/arch/arm/boot/dts/am335x-boneblack.dts<br>
@@ -64,6 +64,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 AM33XX_IOPAD(0x9b0, PIN_OUTPUT_PULLDOWN | MUX_MODE3)=C2=A0 =C2=
=A0 /* xdma_event_intr0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c1_pins: pinmux_i2c1_pins {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-single,pins=
 =3D &lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AM33XX_IOPAD(0x958, PIN_INPUT_PULLUP | MUX_MODE2)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* spi0_d1.i2c1_sda */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AM33XX_IOPAD(0x95c, PIN_INPUT_PULLUP | MUX_MODE2)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* spi0_cs0.i2c1_scl */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0};<br>
<br>
=C2=A0&amp;lcdc {<br>
@@ -91,6 +98,14 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
+&amp;i2c1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c2_pins&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;100000&gt;;<br>
+};<br>
+<br>
=C2=A0&amp;rtc {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 system-power-controller;<br>
=C2=A0};<br>
<span><font color=3D"#888888">--<br>
2.7.4<br></font></span></blockquote><div><br></div><div><br></div><div>On t=
he other issue, P9_17/P9_18 can also be used for spi0, pwm and pr1&#39;s ua=
rt0.=C2=A0 Since there are no &quot;i2c&quot; devices physically connected =
to P9_17/P9_18, it would best to just drop this patch and load it as an ove=
rlay (1) (2)..</div><div><br></div><div>1: u-boot&#39;s overlay:=C2=A0</div=
><div><br></div><div><a href=3D"https://www.mail-archive.com/u-boot@lists.d=
enx.de/msg214241.html">https://www.mail-archive.com/u-boot@lists.denx.de/ms=
g214241.html</a><br></div><div><br></div><div>2: kernel&#39;s overlay:</div=
><div><br></div><div><a href=3D"https://github.com/pantoniou/linux-beagle-t=
rack-mainline/tree/bbb-overlays">https://github.com/pantoniou/linux-beagle-=
track-mainline/tree/bbb-overlays</a><br></div><div><br></div><div>Regards,<=
/div></div><div><br></div>-- <br><div data-smartmail=3D"gmail_signature">Ro=
bert Nelson<br><a href=3D"https://rcn-ee.com/" target=3D"_blank">https://rc=
n-ee.com/</a></div>
</div></div>

--001a113f97c2660de105344f0d54--
