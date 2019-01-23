From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 04/10] usb: ehci-orion: add S2RAM support
Date: Wed, 23 Jan 2019 14:58:44 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1901231456060.1564-100000@iolanthe.rowland.org>
References: <20190121112336.23489-5-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121112336.23489-5-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Jan 2019, Miquel Raynal wrote:

> Add suspend/resume callbacks to reset the host controller properly
> during S2RAM operation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/usb/host/ehci-orion.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 3109f082949e..dab22aa57c0b 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -182,6 +182,30 @@ static int ehci_orion_drv_reset(struct usb_hcd *hcd)
>  	return ret;
>  }
>  
> +static int __maybe_unused ehci_orion_drv_suspend(struct device *dev)
> +{
> +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> +	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> +
> +	ehci_prepare_ports_for_controller_suspend(ehci,
> +						  device_may_wakeup(dev));
> +
> +	return ehci_suspend(hcd, false);

This is a little odd.  Why not just call

	ehci_suspend(hcd, device_may_wakeup(dev));

directly and let it take care of calling
ehci_prepare_ports_for_controller_suspend() for you?  If you have a
good reason for doing things this way, please mention that reason in
the Changelog.

> +}
> +
> +static int __maybe_unused ehci_orion_drv_resume(struct device *dev)
> +{
> +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> +	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> +
> +	ehci_prepare_ports_for_controller_resume(ehci);
> +
> +	return ehci_resume(hcd, false);

Same thing here.

> +}
> +
> +static SIMPLE_DEV_PM_OPS(ehci_orion_pm_ops, ehci_orion_drv_suspend,
> +			 ehci_orion_drv_resume);
> +
>  static const struct ehci_driver_overrides orion_overrides __initconst = {
>  	.extra_priv_size =	sizeof(struct orion_ehci_hcd),
>  	.reset = ehci_orion_drv_reset,
> @@ -334,6 +358,7 @@ static struct platform_driver ehci_orion_driver = {
>  	.driver = {
>  		.name	= "orion-ehci",
>  		.of_match_table = ehci_orion_dt_ids,
> +		.pm = &ehci_orion_pm_ops,
>  	},
>  };

Alan Stern
