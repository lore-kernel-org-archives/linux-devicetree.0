Return-Path: <SRS0=/Rmg=T5=linaro.org=manivannan.sadhasivam@kernel.org>
MIME-Version: 1.0
References: <20190528044850.23703-1-jay.xu@rock-chips.com> <20190529074752.19388-1-jay.xu@rock-chips.com>
In-Reply-To: <20190529074752.19388-1-jay.xu@rock-chips.com>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 29 May 2019 17:57:26 +0530
Message-ID: <CAOZjjh=30Wo1QZ3FrNzj7MMLd8c5h2XYbo7v5=e=j7RwGKsePg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: add core dtsi file for
 RK3399Pro SoCs
Content-Type: multipart/alternative; boundary="0000000000004d03ab058a05e858"
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org, zhangzj@rock-chips.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000004d03ab058a05e858
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for the patch.

On top of Heiko's review:

On Wed, 29 May, 2019, 1:18 PM Jianqun Xu, <jay.xu@rock-chips.com> wrote:

> This patch adds core dtsi file for Rockchip RK3399Pro SoCs,
> include rk3399.dtsi. Also enable these nodes:
> - pcie/pcie_phy
> - sdhci/sdio/emmc/sdmmc
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> changes since v1:
> - remove dfi and dmc
>
>  arch/arm64/boot/dts/rockchip/rk3399pro.dtsi | 74 +++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
> new file mode 100644
> index 000000000000..b6d433ffa67d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd.
> +
> +#include "rk3399.dtsi"
> +
> +/ {
> +       compatible = "rockchip,rk3399pro";
> +
> +       xin32k: xin32k {
> +               compatible = "fixed-clock";
> +               clock-frequency = <32768>;
> +               clock-output-names = "xin32k";
> +               #clock-cells = <0>;
> +       };
> +};
> +
> +&emmc_phy {
> +       status = "okay";
> +};
> +
> +&pcie_phy {
> +       status = "okay";
> +};
> +
> +&pcie0 {
> +       ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +       num-lanes = <4>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pcie_clkreqn_cpm>;
> +       status = "okay";
> +};
>

So, this is for the NPU inside the soc? If yes, then probably only pcie
nodes should be present in rk3399pro.dtsi and others should be in
respective board dts.

Thanks,
Mani

> +
> +&sdhci {
> +       bus-width = <8>;
> +       mmc-hs400-1_8v;
> +       supports-emmc;
> +       non-removable;
> +       keep-power-in-suspend;
> +       mmc-hs400-enhanced-strobe;
> +       status = "okay";
> +};
> +
> +&sdio0 {
> +       clock-frequency = <150000000>;
> +       clock-freq-min-max = <200000 150000000>;
> +       supports-sdio;
> +       bus-width = <4>;
> +       disable-wp;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       mmc-pwrseq = <&sdio_pwrseq>;
> +       non-removable;
> +       num-slots = <1>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
> +       sd-uhs-sdr104;
> +       status = "okay";
> +};
> +
> +&sdmmc {
> +       clock-frequency = <150000000>;
> +       clock-freq-min-max = <400000 150000000>;
> +       supports-sd;
> +       bus-width = <4>;
> +       cap-mmc-highspeed;
> +       cap-sd-highspeed;
> +       disable-wp;
> +       num-slots = <1>;
> +       vqmmc-supply = <&vccio_sd>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
> +       status = "okay";
> +};
> --
> 2.17.1
>
>
>
>

--0000000000004d03ab058a05e858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for the patch.=C2=A0</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">On top of Heiko&#39;s review:<br><br><div class=3D"gmail_quot=
e" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 29 May, 2019,=
 1:18 PM Jianqun Xu, &lt;<a href=3D"mailto:jay.xu@rock-chips.com">jay.xu@ro=
ck-chips.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This pa=
tch adds core dtsi file for Rockchip RK3399Pro SoCs,<br>
include rk3399.dtsi. Also enable these nodes:<br>
- pcie/pcie_phy<br>
- sdhci/sdio/emmc/sdmmc<br>
<br>
Signed-off-by: Jianqun Xu &lt;<a href=3D"mailto:jay.xu@rock-chips.com" targ=
et=3D"_blank" rel=3D"noreferrer">jay.xu@rock-chips.com</a>&gt;<br>
---<br>
changes since v1:<br>
- remove dfi and dmc<br>
<br>
=C2=A0arch/arm64/boot/dts/rockchip/rk3399pro.dtsi | 74 ++++++++++++++++++++=
+<br>
=C2=A01 file changed, 74 insertions(+)<br>
=C2=A0create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi<br>
<br>
diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi b/arch/arm64/boot/=
dts/rockchip/rk3399pro.dtsi<br>
new file mode 100644<br>
index 000000000000..b6d433ffa67d<br>
--- /dev/null<br>
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi<br>
@@ -0,0 +1,74 @@<br>
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)<br>
+// Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd.<br>
+<br>
+#include &quot;rk3399.dtsi&quot;<br>
+<br>
+/ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;rockchip,rk3399pro&quot;;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xin32k: xin32k {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;fixed-clock&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D=
 &lt;32768&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-output-names =
=3D &quot;xin32k&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#clock-cells =3D &l=
t;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;emmc_phy {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;pcie_phy {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;pcie0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ep-gpios =3D &lt;&amp;gpio0 RK_PB4 GPIO_ACTIVE_=
HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0num-lanes =3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pcie_clkreqn_cpm&gt;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">So, this is for the NPU inside the soc? If yes, then probably only pcie =
nodes should be present in rk3399pro.dtsi and others should be in respectiv=
e board dts.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank=
s,=C2=A0</div><div dir=3D"auto">Mani</div><div dir=3D"auto"><div class=3D"g=
mail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+&amp;sdhci {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;8&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmc-hs400-1_8v;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0supports-emmc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0keep-power-in-suspend;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmc-hs400-enhanced-strobe;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;sdio0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;150000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-freq-min-max =3D &lt;200000 150000000&gt;=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0supports-sdio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sdio-irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0keep-power-in-suspend;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mmc-pwrseq =3D &lt;&amp;sdio_pwrseq&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0num-slots =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;sdio0_bus4 &amp;sdio0_cm=
d &amp;sdio0_clk&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr104;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;sdmmc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;150000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-freq-min-max =3D &lt;400000 150000000&gt;=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0supports-sd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-mmc-highspeed;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0num-slots =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D &lt;&amp;vccio_sd&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;sdmmc_clk &amp;sdmmc_cmd=
 &amp;sdmmc_cd &amp;sdmmc_bus4&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000004d03ab058a05e858--
