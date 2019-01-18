Return-Path: <SRS0=ctnT=P2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:44977 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbfAROVC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Jan 2019 09:21:02 -0500
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: change suspend/resume time
References: <20190108162843.6194-1-miquel.raynal@bootlin.com>
Date: Fri, 18 Jan 2019 15:20:59 +0100
In-Reply-To: <20190108162843.6194-1-miquel.raynal@bootlin.com> (Miquel
        Raynal's message of "Tue, 8 Jan 2019 17:28:43 +0100")
Message-ID: <87sgxqm4hg.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Miquel,
 
 On mar., janv. 08 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Armada 3700 PCIe IP relies on the pinctrl IP managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().
>
> In the current state, after resuming from a suspend to RAM cycle the
> PCIe IP is reconfigured before the pinctrl one which produces an
> interrupt storm. The solution to support PCIe resume operation is to
> change the "priority" of this pinctrl driver PM callbacks to
> "_noirq()".
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 4b9f2cf94431..6462d3ca7ceb 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -1107,8 +1107,8 @@ static int armada_3700_pinctrl_resume(struct device *dev)
>   * to other IO drivers.
>   */
>  static const struct dev_pm_ops armada_3700_pinctrl_pm_ops = {
> -	.suspend_late = armada_3700_pinctrl_suspend,
> -	.resume_early = armada_3700_pinctrl_resume,
> +	.suspend_noirq = armada_3700_pinctrl_suspend,
> +	.resume_noirq = armada_3700_pinctrl_resume,
>  };
>  
>  #define PINCTRL_ARMADA_37XX_DEV_PM_OPS (&armada_3700_pinctrl_pm_ops)
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
