From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 03/10] usb: ehci-orion: avoid double PHY initialization
Date: Fri, 18 Jan 2019 17:25:30 +0100
Message-ID: <874la6lypx.fsf@FE-laptop>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-4-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190111133133.24803-4-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Fri, 11 Jan 2019 14:31:26 +0100")
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On ven., janv. 11 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> No need to initialize the PHY from the driver's probe. It is done by
> the core automatically and doing it twice would increment the

Do you know exactly which core take care of it?

When the phy support was added to this driver there was not such
feature. I made some research and found that recently (less than one
year ago) a series was added to initialize PHYs at HCD level[1]. I think
that our platform was forgotten in the conversion.

Could you check that we are now aligned with the requirement of this
series?

Thanks,

Gregory

[1]:https://www.spinics.net/lists/linux-usb/msg166281.html


> phy->powercount counter to 2 instead of 1. During later suspend
> operation, the counter will be decremented to one, no phy->power_off()
> will occur and worst than that, the following phy->power_on() at
> resume time will be also skipped, failing the whole S2RAM operation.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/usb/host/ehci-orion.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 1ad72647a069..3109f082949e 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -257,15 +257,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->phy)) {
>  		err = PTR_ERR(priv->phy);
>  		if (err != -ENOSYS)
> -			goto err_phy_get;
> -	} else {
> -		err = phy_init(priv->phy);
> -		if (err)
> -			goto err_phy_init;
> -
> -		err = phy_power_on(priv->phy);
> -		if (err)
> -			goto err_phy_power_on;
> +			goto err_dis_clk;
>  	}
>  
>  	/*
> @@ -297,19 +289,12 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err)
> -		goto err_add_hcd;
> +		goto err_dis_clk;
>  
>  	device_wakeup_enable(hcd->self.controller);
>  	return 0;
>  
> -err_add_hcd:
> -	if (!IS_ERR(priv->phy))
> -		phy_power_off(priv->phy);
> -err_phy_power_on:
> -	if (!IS_ERR(priv->phy))
> -		phy_exit(priv->phy);
> -err_phy_init:
> -err_phy_get:
> +err_dis_clk:
>  	if (!IS_ERR(priv->clk))
>  		clk_disable_unprepare(priv->clk);
>  	usb_put_hcd(hcd);
> @@ -327,11 +312,6 @@ static int ehci_orion_drv_remove(struct platform_device *pdev)
>  
>  	usb_remove_hcd(hcd);
>  
> -	if (!IS_ERR(priv->phy)) {
> -		phy_power_off(priv->phy);
> -		phy_exit(priv->phy);
> -	}
> -
>  	if (!IS_ERR(priv->clk))
>  		clk_disable_unprepare(priv->clk);
>  
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
