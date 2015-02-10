From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/5] ARM: mediatek: Add Pinctrl/GPIO driver for mt8135.
Date: Tue, 10 Feb 2015 16:17:03 +0800
Message-ID: <CACRpkdasVPUtn=-DhJ4OUXGZh36sLKwLhvm-nD-mkZjP7gQXww@mail.gmail.com>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
	<1421818097-9281-4-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421818097-9281-4-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dandan.he@mediatek.com, alan.cheng@mediatek.com, toby.liu@mediatek.com, maoguang.meng@mediatek.com, huang eddie <eddie.huang@mediatek.com>, Jean-Christophe
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 1:28 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> From: Hongzhou Yang <hongzhou.yang@mediatek.com>
>
> The mediatek SoCs have GPIO controller that handle both the muxing and GPIOs.
>
> The GPIO controller have pinmux, pull enable, pull select, direction and output high/low control.
>
> This driver include common driver and mt8135 part.
> The common driver include the pinctrl driver and GPIO driver.
> The mt8135 part contain its special device data.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

I have merged this patch for v3.21, except:

>  arch/arm/mach-mediatek/Kconfig                |    1 +
(...)
 --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -1,6 +1,7 @@
>  menuconfig ARCH_MEDIATEK
>         bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
>         select ARM_GIC
> +       select PINCTRL
>         select MTK_TIMER
>         help
>           Support for Mediatek MT65xx & MT81xx SoCs

This, which should come in through the ARM SoC tree. It's not
dependent on this series anyway.

This will appear after the merge window as we start the v3.21 cycle.

Yours,
Linus Walleij
