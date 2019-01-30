From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] arm64: dts: sprd: Add SC2731 charger device
Date: Wed, 30 Jan 2019 17:45:43 +0100
Message-ID: <CAK8P3a2+N9-uLi0GS07JEt3H5hwoku6DWZr+e2DXP-nYHEcOyw@mail.gmail.com>
References: <cover.1548052878.git.baolin.wang@linaro.org> <1f57f120e915ea9af75a45f48c8ef2f446d10486.1548052878.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1f57f120e915ea9af75a45f48c8ef2f446d10486.1548052878.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 8:39 AM Baolin Wang <baolin.wang@linaro.org> wrote:
>
> Add charger device node and related battery node for SC2731 PMIC.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  arch/arm64/boot/dts/sprd/sc2731.dtsi      |    6 ++++++
>  arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |   16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> index a2edc25..b52eaf0 100644
> --- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> @@ -17,6 +17,12 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> +               charger@0 {
> +                       compatible = "sprd,sc27xx-charger", "sprd,sc2731-charger";
> +                       reg = <0x0>;
> +                       monitored-battery = <&bat>;
> +               };

I see some of these have already slipped through, but we should probably
fix those and not add new ones: "sprd,sc27xx-charger" is not an appropriate
compatible string, because it has a 'xx' wildcard.

What you should have instead is to list compatibility with specific older
models. You also need to have the more generic string as the last one,
not the first.

     Arnd
