From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/8] ARM: dts: imx7: build imx7d-sbc-iot-imx7 dtb
Date: Fri, 1 Dec 2017 18:11:32 -0200
Message-ID: <CAOMZO5AKyYR+AYMpbOokKbkgAbaGAucHtdHrosPOh3wbEHY1sA@mail.gmail.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com> <20171130201434.14122-3-tyler@opensourcefoundries.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171130201434.14122-3-tyler@opensourcefoundries.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tyler@opensourcefoundries.com
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 6:14 PM,  <tyler@opensourcefoundries.com> wrote:
> From: Tyler Baker <tyler@opensourcefoundries.com>
>
> Build the imx7d-sbc-iot-imx7 device tree blob.
>
> Signed-off-by: Tyler Baker <tyler@opensourcefoundries.com>
> ---
>  arch/arm/boot/dts/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0381e9..0334137 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -515,6 +515,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>         imx7d-nitrogen7.dtb \
>         imx7d-pico.dtb \
>         imx7d-sbc-imx7.dtb \
> +       imx7d-sbc-iot-imx7.dtb \

This could be part of the previous patch that introduces the dts.
