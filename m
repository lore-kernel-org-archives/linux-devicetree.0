Return-Path: <monstr@monstr.eu>
MIME-Version: 1.0
References: <74a9934eab231714e65f74e442ad79cab0475267.1541684144.git.michal.simek@xilinx.com>
In-Reply-To: <74a9934eab231714e65f74e442ad79cab0475267.1541684144.git.michal.simek@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 16 Nov 2018 09:13:57 +0100
Message-ID: <CAHTX3dLaX9W3q2EBLG30Mo+h9vrg_jfdy6VTuOYuUk0Cr52V8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add missing gpio-controller to ps gpio
Content-Type: multipart/alternative; boundary="0000000000006606c5057ac3c0ac"
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Rob Herring <robherring2@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Will Deacon <will.deacon@arm.com>, Manish Narani <manish.narani@xilinx.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000006606c5057ac3c0ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 8. 11. 2018 v 14:35 odes=C3=ADlatel Michal Simek <michal.simek@xili=
nx.com>
napsal:

> Add missing gpio-controller property to ps gpio.
> This was found via DT schema validation.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 07f2dd13ab33..ae3c1b929648 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -410,6 +410,7 @@
>                         compatible =3D "xlnx,zynqmp-gpio-1.0";
>                         status =3D "disabled";
>                         #gpio-cells =3D <0x2>;
> +                       gpio-controller;
>                         interrupt-parent =3D <&gic>;
>                         interrupts =3D <0 16 4>;
>                         interrupt-controller;
> --
> 1.9.1
>
>
Applied but with zynqmp: subsystem.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform

--0000000000006606c5057ac3c0ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=C4=8D=
t 8. 11. 2018 v=C2=A014:35 odes=C3=ADlatel Michal Simek &lt;<a href=3D"mail=
to:michal.simek@xilinx.com">michal.simek@xilinx.com</a>&gt; napsal:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Add missing gpio-controller property to ps=
 gpio.<br>
This was found via DT schema validation.<br>
<br>
Signed-off-by: Michal Simek &lt;<a href=3D"mailto:michal.simek@xilinx.com" =
target=3D"_blank">michal.simek@xilinx.com</a>&gt;<br>
---<br>
<br>
=C2=A0arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/x=
ilinx/zynqmp.dtsi<br>
index 07f2dd13ab33..ae3c1b929648 100644<br>
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi<br>
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi<br>
@@ -410,6 +410,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 compatible =3D &quot;xlnx,zynqmp-gpio-1.0&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D &quot;disabled&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 #gpio-cells =3D &lt;0x2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpio-controller;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 interrupt-parent =3D &lt;&amp;gic&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 interrupts =3D &lt;0 16 4&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 interrupt-controller;<br>
-- <br>
1.9.1<br>
<br>
</blockquote></div><br clear=3D"all"><div>Applied but with zynqmp: subsyste=
m.</div><div><br></div><div>Thanks,</div><div>Michal<br></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature">Michal Simek, Ing. (M.Eng), OpenPGP -&gt; KeyID: FE3D1F91<br>w:=
 <a href=3D"http://www.monstr.eu" target=3D"_blank">www.monstr.eu</a> p: +4=
2-0-721842854<br>Maintainer of Linux kernel - Microblaze cpu - <a href=3D"h=
ttp://www.monstr.eu/fdt/" target=3D"_blank">http://www.monstr.eu/fdt/</a><b=
r>Maintainer of Linux kernel - Xilinx Zynq ARM architecture<br>Microblaze U=
-BOOT custodian and responsible for u-boot arm zynq platform</div></div>

--0000000000006606c5057ac3c0ac--
