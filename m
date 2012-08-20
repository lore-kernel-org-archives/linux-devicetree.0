From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/11] arm: mvebu: enable PINCTRL usage
Date: Mon, 20 Aug 2012 16:29:55 +0200
Message-ID: <CACRpkda+X5-GtsMJ07TA7UBbbk1W+pJzTtQjQJ8VPD9z_5UoDQ@mail.gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1344689809-6223-11-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344689809-6223-11-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Now that we have a proper pinctrl driver for Marvell EBU platforms,
> enable PINCTRL support in ARCH_MVEBU.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(...)
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 361f513..95317a9 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -573,6 +573,7 @@ config ARCH_MVEBU
>         select GENERIC_IRQ_CHIP
>         select IRQ_DOMAIN
>         select COMMON_CLK
> +       select PINCTRL
>         help
>           Support for the Marvell SoC Family with device tree support

So this symbol collects all the DT-migrated platforms?

Probably OK but want to figure out if the PLAT_NOMADIK symbol
is applicable.

Yours,
Linus Walleij
