From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Wed, 9 Dec 2015 09:53:07 +0100
Message-ID: <20151209085307.GS11966@pengutronix.de>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi John,

Only a small comment

On Tue, Dec 08, 2015 at 01:29:22PM -0800, John Stultz wrote:
> +static int reboot_reason_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	u32 val;
> +	int i;
> +
> +	/* initialize the reasons */
> +	for (i = 0; i < MAX_REASONS; i++)
> +		reasons[i] = -1;
> +
> +	/* Try to grab the reason io address */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reboot_reason_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(reboot_reason_addr))
> +		return PTR_ERR(reboot_reason_addr);
> +
> +	/* initialize specified reasons from DT */
> +	if (!of_property_read_u32(pdev->dev.of_node, "reason,none", &val))
> +		reasons[NONE] = val;

can be simplified to:

	of_property_read_u32(pdev->dev.of_node, "reason,none", &reasons[NONE]);

No need to check first, &reasons[NONE] will only be modified when the
property exists.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
