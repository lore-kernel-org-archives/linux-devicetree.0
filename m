From: Christian Daudt <bcm@fixthebug.org>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Wed, 16 Oct 2013 23:03:49 -0700
Message-ID: <CAEPRUYqfpdp1GqxBgx-q=hyvQDe4uyi6okzHPW2QmfmPG_Z3NQ@mail.gmail.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
	<1380846199-12829-4-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380846199-12829-4-git-send-email-syin@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sherman Yin <syin@broadcom.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2013 at 5:23 PM, Sherman Yin <syin@broadcom.com> wrote:
> Adds pinctrl driver for Broadcom Capri (BCM281xx) SoCs.
>
> Signed-off-by: Sherman Yin <syin@broadcom.com>
> Reviewed-by: Christian Daudt <bcm@fixthebug.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>
> ---
>  arch/arm/mach-bcm/Kconfig       |    2 +
>  drivers/pinctrl/Kconfig         |   10 +
>  drivers/pinctrl/Makefile        |    1 +
>  drivers/pinctrl/pinctrl-capri.c | 1727 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1740 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-capri.c
>
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index 69d67f7..2546365 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -10,6 +10,8 @@ config ARCH_BCM
>         select GENERIC_CLOCKEVENTS
>         select GENERIC_TIME
>         select GPIO_BCM
> +       select PINCTRL
> +       select PINCTRL_CAPRI
>         select SPARSE_IRQ
>         select TICK_ONESHOT
>         select CACHE_L2X0

On your subsequent patchset pls move this from Kconfig to
arm/configs/bcm_defconfig, and break that modification into a separate
patch from the drivers/* modification.

 thanks,
   csd
