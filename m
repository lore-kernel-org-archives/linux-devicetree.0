From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v4 7/7] arm64: dts: mt8173: Add subsystem clock controller
 device nodes
Date: Fri, 24 Jul 2015 19:32:32 +0800
Message-ID: <CAGS+omAUAHZUJQMnWJbH7NXB_Etp=OF3dWyMB7Ri1+rAyzyPBg@mail.gmail.com>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com> <1437706925-3222-8-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437706925-3222-8-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>, srv_heupstream <srv_heupstream@mediatek.com>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 11:02 AM, James Liao <jamesjj.liao@mediatek.com> wrote:
> This patch adds device nodes providing subsystem clocks on MT8173,
> includes mmsys, imgsys, vdecsys, vencsys and vencltsys.
>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 37 ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index a2f63e4..8731d24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -88,6 +88,13 @@
>                 #clock-cells = <0>;
>         };
>
> +       cpum_ck: dummy_clk {

I'm not a big fan of this "dummy_clk".
The 'name' part of the devicetree node is supposed to be generic.
So, perhaps just oscillator@2, and move it down below clk32k: oscillator@1.
Otherwise:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>


-Dan


> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <0>;
> +               clock-output-names = "cpum_ck";
> +       };
> +
>         clk26m: oscillator@0 {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
> @@ -227,6 +234,36 @@
>                         clocks = <&uart_clk>;
>                         status = "disabled";
>                 };
> +
> +               mmsys: clock-controller@14000000 {
> +                       compatible = "mediatek,mt8173-mmsys", "syscon";
> +                       reg = <0 0x14000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               imgsys: clock-controller@15000000 {
> +                       compatible = "mediatek,mt8173-imgsys", "syscon";
> +                       reg = <0 0x15000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vdecsys: clock-controller@16000000 {
> +                       compatible = "mediatek,mt8173-vdecsys", "syscon";
> +                       reg = <0 0x16000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vencsys: clock-controller@18000000 {
> +                       compatible = "mediatek,mt8173-vencsys", "syscon";
> +                       reg = <0 0x18000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vencltsys: clock-controller@19000000 {
> +                       compatible = "mediatek,mt8173-vencltsys", "syscon";
> +                       reg = <0 0x19000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
>         };
>  };
>
> --
> 1.8.1.1.dirty
>
