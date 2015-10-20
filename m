Return-Path: <lkml.alex@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1445008929-32267-3-git-send-email-Liviu.Dudau@arm.com>
References: <1445008929-32267-1-git-send-email-Liviu.Dudau@arm.com>
	<1445008929-32267-3-git-send-email-Liviu.Dudau@arm.com>
Date: Tue, 20 Oct 2015 11:33:13 +0800
Message-ID: <CAGjg+kGhTPXxYS84DTgwhHwqct2Enz_L1Cxsx+QR+tvyU6JzLQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: Juno: Add support for the PCIe host bridge
 on Juno R1
From: Alex Shi <lkml.alex@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b2e489af6466f052280eb59
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Jon Medhurst <tixy@linaro.org>, linux-pci <linux-pci@vger.kernel.org>, device-tree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b2e489af6466f052280eb59
Content-Type: text/plain; charset=UTF-8

Is there any concern to merge the juno r1 pcie DT part into upstream?

On Fri, Oct 16, 2015 at 11:22 PM, Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> Juno R1 board sports a functional PCIe host bridge that is
> compliant with the SBSA standard found [1] here. With the right
> firmware that initialises the XpressRICH3 controller one can
> use the generic Host Bridge driver to use the PCIe hardware.
>
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> [1] http://infocenter.arm.com/help/topic/com.arm.doc.den0029a/
> ---
>  arch/arm64/boot/dts/arm/juno-r1.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts
> b/arch/arm64/boot/dts/arm/juno-r1.dts
> index c627511..a25964d 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -109,6 +109,26 @@
>
>         #include "juno-base.dtsi"
>
> +       pcie-controller@40000000 {
> +               compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi",
> "pci-host-ecam-generic";
> +               device_type = "pci";
> +               reg = <0 0x40000000 0 0x10000000>;      /* ECAM config
> space */
> +               bus-range = <0 255>;
> +               linux,pci-domain = <0>;
> +               #address-cells = <3>;
> +               #size-cells = <2>;
> +               dma-coherent;
> +               ranges = <0x01000000 0x00 0x5f800000 0x00 0x5f800000 0x0
> 0x00800000>,
> +                        <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0
> 0x08000000>,
> +                        <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1
> 0x00000000>;
> +               #interrupt-cells = <1>;
> +               interrupt-map-mask = <0 0 0 7>;
> +               interrupt-map = <0 0 0 1 &gic 0 0 0 136 4>,
> +                               <0 0 0 2 &gic 0 0 0 137 4>,
> +                               <0 0 0 3 &gic 0 0 0 138 4>,
> +                               <0 0 0 4 &gic 0 0 0 139 4>;
> +               msi-parent = <&v2m_0>;
> +       };
>  };
>
>  &memtimer {
> --
> 2.6.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>



-- 
Thanks
    Alex

--047d7b2e489af6466f052280eb59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there any concern to merge the juno r1 pcie DT part int=
o upstream?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 16, 2015 at 11:22 PM, Liviu Dudau <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Liviu.Dudau@arm.com" target=3D"_blank">Liviu.Dudau@arm.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Juno R1 board sports a f=
unctional PCIe host bridge that is<br>
compliant with the SBSA standard found [1] here. With the right<br>
firmware that initialises the XpressRICH3 controller one can<br>
use the generic Host Bridge driver to use the PCIe hardware.<br>
<br>
Signed-off-by: Liviu Dudau &lt;<a href=3D"mailto:Liviu.Dudau@arm.com">Liviu=
.Dudau@arm.com</a>&gt;<br>
Acked-by: Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com">mark.rut=
land@arm.com</a>&gt;<br>
<br>
[1] <a href=3D"http://infocenter.arm.com/help/topic/com.arm.doc.den0029a/" =
rel=3D"noreferrer" target=3D"_blank">http://infocenter.arm.com/help/topic/c=
om.arm.doc.den0029a/</a><br>
---<br>
=C2=A0arch/arm64/boot/dts/arm/juno-r1.dts | 20 ++++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/=
juno-r1.dts<br>
index c627511..a25964d 100644<br>
--- a/arch/arm64/boot/dts/arm/juno-r1.dts<br>
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts<br>
@@ -109,6 +109,26 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &quot;juno-base.dtsi&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-controller@40000000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;arm,juno-r1-pcie&quot;, &quot;plda,xpressrich3-axi&quot;, &quot;pci-host-=
ecam-generic&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &qu=
ot;pci&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0 0x400=
00000 0 0x10000000&gt;;=C2=A0 =C2=A0 =C2=A0 /* ECAM config space */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D &lt;0=
 255&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,pci-domain =
=3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;2&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges =3D &lt;0x01=
000000 0x00 0x5f800000 0x00 0x5f800000 0x0 0x00800000&gt;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000&gt=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000&gt=
;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-cells =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map-mask =
=3D &lt;0 0 0 7&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map =3D &=
lt;0 0 0 1 &amp;gic 0 0 0 136 4&gt;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0 0 0 2 &amp;gic 0 0 0 137 4&gt;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0 0 0 3 &amp;gic 0 0 0 138 4&gt;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0 0 0 4 &amp;gic 0 0 0 139 4&gt;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msi-parent =3D &lt;=
&amp;v2m_0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0};<br>
<br>
=C2=A0&amp;memtimer {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.0<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/majord=
omo-info.html</a><br>
Please read the FAQ at=C2=A0 <a href=3D"http://www.tux.org/lkml/" rel=3D"no=
referrer" target=3D"_blank">http://www.tux.org/lkml/</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">Thanks<br>=C2=A0 =C2=A0 Alex</div>
</div>

--047d7b2e489af6466f052280eb59--
