From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 12:43:28 +0200
Message-ID: <5667958.ID6Uk5LGGt@wuerfel>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <1431557340-5421-6-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431557340-5421-6-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 17:49:00 Rob Herring wrote:
> +
> +	/* enable port power and reserved bit 25 */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status |= (PORT_POWER) | (1 << 25);
> +	/* Clear bits 30:31 for HSIC to be enabled */
> +	status &= ~(0x3 << 30);
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	/* test mode: force enable hs */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status &= ~(0xf << 16);
> +	status |= (0x5 << 16);
> +	__raw_writel(status, &ehci_regs->port_status[0]);
> +
> +	/* disable test mode */
> +	status = __raw_readl(&ehci_regs->port_status[0]);
> +	status &= ~(0xf << 16);
> +	__raw_writel(status, &ehci_regs->port_status[0]);

Please make this endian-safe.
> +
> +static const struct of_device_id mv_ehci_dt_match[] = {
> +	{.compatible = "marvell,pxa1928-ehci"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mv_ehci_dt_match);

> +static struct platform_driver ehci_mv_driver = {
> +	.probe = mv_ehci_probe,
> +	.remove = mv_ehci_remove,
> +	.shutdown = mv_ehci_shutdown,
> +	.driver = {
> +		   .name = "mv-ehci-of",
> +		   .of_match_table = of_match_ptr(mv_ehci_dt_match),
> +		   },
> +};

Warning: unused symbol 'mv_ehci_dt_match'.

Just remove the of_match_ptr().

	Arnd
