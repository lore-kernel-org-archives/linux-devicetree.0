From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 04/10] usb: ehci-orion: add S2RAM support
Date: Fri, 25 Jan 2019 21:56:27 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1901252152190.18583-100000@netrider.rowland.org>
References: <20190125103925.15753-5-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125103925.15753-5-miquel.raynal@bootlin.com>
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

On Fri, 25 Jan 2019, Miquel Raynal wrote:

> Add suspend/resume callbacks to reset the host controller properly
> during S2RAM operation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/usb/host/ehci-orion.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 3109f082949e..0dab099b5d15 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -182,6 +182,23 @@ static int ehci_orion_drv_reset(struct usb_hcd *hcd)
>  	return ret;
>  }
>  
> +static int __maybe_unused ehci_orion_drv_suspend(struct device *dev)
> +{
> +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> +
> +	return ehci_suspend(hcd, device_may_wakeup(dev));

Okay, good.

> +}
> +
> +static int __maybe_unused ehci_orion_drv_resume(struct device *dev)
> +{
> +	struct usb_hcd *hcd = dev_get_drvdata(dev);
> +
> +	return ehci_resume(hcd, device_may_wakeup(dev));

Not so good.  The second argument here is force_reset; presumably you 
want it always to be false.  (Note that the v3 version of this patch 
did not call device_may_wakeup() in ehci_orion_drv_resume.)

Yes, the API is not symmetrical.  So sue me...

Alan Stern
