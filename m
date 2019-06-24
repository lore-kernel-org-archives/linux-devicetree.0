From: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: sc9860: Update coresight DT bindings
Date: Mon, 24 Jun 2019 13:58:17 +0800
Message-ID: <CAAfSe-uwxTtSs1DN_SMzqV+TBSOUM4mv2_vC94CK2-j3_AaBAg@mail.gmail.com>
References: <20190508021902.10358-1-leo.yan@linaro.org> <20190508021902.10358-12-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508021902.10358-12-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Linux ARM <linux-arm-kernel@l>
List-Id: devicetree@vger.kernel.org

Hi Leo,

Applied the patch 10-11/11 to my tree, thanks!

Chunyan



Chunyan

On Wed, 8 May 2019 at 10:21, Leo Yan <leo.yan@linaro.org> wrote:
>
> CoreSight DT bindings have been updated, thus the old compatible strings
> are obsolete and the drivers will report warning if DTS uses these
> obsolete strings.
>
> This patch switches to the new bindings for CoreSight dynamic funnel,
> so can dismiss warning during initialisation.
>
> Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Acked-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
>  arch/arm64/boot/dts/sprd/sc9860.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> index b25d19977170..e27eb3ed1d47 100644
> --- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -300,7 +300,7 @@
>                 };
>
>                 funnel@10001000 { /* SoC Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x10001000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -367,7 +367,7 @@
>                 };
>
>                 funnel@11001000 { /* Cluster0 Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11001000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -415,7 +415,7 @@
>                 };
>
>                 funnel@11002000 { /* Cluster1 Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11002000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> @@ -513,7 +513,7 @@
>                 };
>
>                 funnel@11005000 { /* Main Funnel */
> -                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                         reg = <0 0x11005000 0 0x1000>;
>                         clocks = <&ext_26m>;
>                         clock-names = "apb_pclk";
> --
> 2.17.1
>
