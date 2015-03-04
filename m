From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] arm64: mediatek: Add config option for mt8173.
Date: Wed, 04 Mar 2015 10:53:39 +0100
Message-ID: <2108883.zjHYNOn4mC@wuerfel>
References: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com> <20150225111107.GA29206@localhost> <1425436267.21342.39.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425436267.21342.39.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, eddie.huang@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, maoguang.meng@mediatek.com, alan.cheng@mediatek.com, toby.liu@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 04 March 2015 10:31:07 Yingjoe Chen wrote:
> Hi,
> 
> Since we support devicetree, we don't need MACH_* to build a working
> kernel. This is true even for our v7 soc. We intend to use it to reduce
> numbers of drivers in product kernel binary.
> Most drivers are shared among the same SoCs family, but some are not.
> Currently for pinctrl driver, we are doing this so user don't need to
> select them one by one:
> 
> config PINCTRL_MT8173
>         def_bool MACH_MT8173
>         select PINCTRL_MTK_COMMON
> 
> Alternatively, we could add these MACH_* to some other places, eg,
> drivers/soc/mediatek. Or we don't add MACH_* at all, and have all
> drivers export their own Kconfig option. User will need to select each
> of them one-by-one.
> 
> What do you think?

I would rather see these as user-selectable options, which has the
other benefit of giving compile-time coverage. For your example,
I'd suggest doing

config PINCTRL_MT8173
        bool "Mediatek MT8173 pin control"
	depends on ARCH_MEDIATEK || COMPILE_TEST
        select PINCTRL_MTK_COMMON
	help
	   ... a useful description ...


	Arnd
