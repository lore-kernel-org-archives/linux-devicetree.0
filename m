Return-Path: <SRS0=cqFI=4W=semihalf.com=mw@kernel.org>
MIME-Version: 1.0
In-Reply-To: <E1dAcn4-0004z2-Fl@rmk-PC.armlinux.org.uk>
References: <E1dAcn4-0004z2-Fl@rmk-PC.armlinux.org.uk>
From: Marcin Wojtas <mw@semihalf.com>
Date: Tue, 16 May 2017 17:40:57 +0200
Message-ID: <CAPv3WKf4GcOc7g-2yMCjGN4HrftDL0Ro6jHErQL8-zSH-tC10w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: mcbin: add sdhci
Content-Type: multipart/alternative; boundary="001a114495247cc6ce054fa5ff0e"
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--001a114495247cc6ce054fa5ff0e
Content-Type: text/plain; charset="UTF-8"

Russel,

2017-05-16 15:45 GMT+02:00 Russell King <rmk+kernel@armlinux.org.uk>:

> Add sdhci support for MACCHIATOBin boards.  This uses the AP806 SDHCI
> for eMMC and CP110 master for the SD card slot.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>
> This version labels up the uSD connector, adds the vqmmc regulator for
> the uSD (the regulator itself already present in the DT), and supports
> the card detect signal.
>
> For eMMC, this version adds the vqmmc regulator, which again is already
> present in the DT, marks it as not supporting SD or SDIO, and also
> includes "slow mode" since testing with previous versions of the driver
> have shown that selecting faster speeds results in errors.
>
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts |   23
> ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> index cc167e05941a..60111ed3234a 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> @@ -95,6 +95,21 @@
>         status = "okay";
>  };
>
> +&ap_sdhci0 {
> +       bus-width = <8>;
> +       /*
> +        * Not stable in HS modes - phy needs "more calibration", so add
> +        * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
> +        */
> +       marvell,xenon-phy-slow-mode;
>

FYI, this property is by default present in armada-ap806.dtsi.

Marcin


> +       no-1-8-v;
> +       no-sd;
> +       no-sdio;
> +       non-removable;
> +       status = "okay";
> +       vqmmc-supply = <&v_vddo_h>;
> +};
> +
>  &cpm_i2c0 {
>         clock-frequency = <100000>;
>         status = "okay";
> @@ -105,6 +120,14 @@
>         status = "okay";
>  };
>
> +&cpm_sdhci0 {
> +       /* U6 */
> +       broken-cd;
> +       bus-width = <4>;
> +       status = "okay";
> +       vqmmc-supply = <&v_3_3>;
> +};
> +
>  &cpm_usb3_0 {
>         /* J38? - USB2.0 only */
>         status = "okay";
> --
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--001a114495247cc6ce054fa5ff0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Russel,<div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">2017-05-16 15:45 GMT+02:00 Russell King <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rmk+kernel@armlinux.org.uk" target=3D"_blank">rmk+kernel@armlin=
ux.org.uk</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Add sdhci support for MACCHIATOBin boards.=C2=A0 This uses the AP806 SD=
HCI<br>
for eMMC and CP110 master for the SD card slot.<br>
<br>
Signed-off-by: Russell King &lt;<a href=3D"mailto:rmk%2Bkernel@armlinux.org=
.uk">rmk+kernel@armlinux.org.uk</a>&gt;<br>
---<br>
<br>
This version labels up the uSD connector, adds the vqmmc regulator for<br>
the uSD (the regulator itself already present in the DT), and supports<br>
the card detect signal.<br>
<br>
For eMMC, this version adds the vqmmc regulator, which again is already<br>
present in the DT, marks it as not supporting SD or SDIO, and also<br>
includes &quot;slow mode&quot; since testing with previous versions of the =
driver<br>
have shown that selecting faster speeds results in errors.<br>
<br>
=C2=A0arch/arm64/boot/dts/marvell/<wbr>armada-8040-mcbin.dts |=C2=A0 =C2=A0=
23 ++++++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/marvell/<wbr>armada-8040-mcbin.dts b/arch/=
arm64/boot/dts/marvell/<wbr>armada-8040-mcbin.dts<br>
index cc167e05941a..60111ed3234a 100644<br>
--- a/arch/arm64/boot/dts/marvell/<wbr>armada-8040-mcbin.dts<br>
+++ b/arch/arm64/boot/dts/marvell/<wbr>armada-8040-mcbin.dts<br>
@@ -95,6 +95,21 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;ap_sdhci0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;8&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Not stable in HS modes - phy needs &quot;mor=
e calibration&quot;, so add<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the &quot;slow-mode&quot; and disable SDR104=
, SDR50 and DDR50 modes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0marvell,xenon-phy-slow-mode;<br></blockquote><d=
iv><br></div><div>FYI, this property is by default present in=C2=A0armada-a=
p806.dtsi.</div><div><br></div><div>Marcin</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0no-1-8-v;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0no-sd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0no-sdio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D &lt;&amp;v_vddo_h&gt;;<br>
+};<br>
+<br>
=C2=A0&amp;cpm_i2c0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;100000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
@@ -105,6 +120,14 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;cpm_sdhci0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* U6 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0broken-cd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D &lt;&amp;v_3_3&gt;;<br>
+};<br>
+<br>
=C2=A0&amp;cpm_usb3_0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* J38? - USB2.0 only */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.<wbr>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr>mailman/=
listinfo/linux-arm-<wbr>kernel</a><br>
</font></span></blockquote></div><br></div></div>

--001a114495247cc6ce054fa5ff0e--
