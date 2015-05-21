From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v2 6/6] usb: chipidea: add work-around for Marvell HSIC
 PHY startup
Date: Thu, 21 May 2015 11:13:36 +0800
Message-ID: <20150521031334.GA2897@shlinux2>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-7-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432087805-16671-7-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 09:10:05PM -0500, Rob Herring wrote:
> The Marvell 28nm HSIC PHY requires the port to be forced to HS mode after
> the port power is applied. This is done using the test mode in the PORTSC
> register.
> 
> As HSIC is always HS, this work-around should be safe to do with all HSIC
> PHYs. If not, a flag can also be added.

I think a flag is needed, not sure all vendors can work well with that.

> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Peter Chen <Peter.Chen@freescale.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  drivers/usb/chipidea/host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 21fe1a3..6cf87b8 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -37,12 +37,14 @@ static int (*orig_bus_suspend)(struct usb_hcd *hcd);
>  
>  struct ehci_ci_priv {
>  	struct regulator *reg_vbus;
> +	struct ci_hdrc *ci;
>  };
>  
>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
>  {
>  	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
>  	struct ehci_ci_priv *priv = (struct ehci_ci_priv *)ehci->priv;
> +	struct ci_hdrc *ci = priv->ci;
>  	struct device *dev = hcd->self.controller;
>  	int ret = 0;
>  	int port = HCS_N_PORTS(ehci->hcs_params);
> @@ -64,6 +66,15 @@ static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
>  			return ret;
>  		}
>  	}
> +
> +	if (enable && (ci->platdata->phy_mode == USBPHY_INTERFACE_MODE_HSIC)) {
> +		/*
> +		 * Marvell 28nm HSIC PHY requires forcing the port to HS mode.
> +		 * As HSIC is always HS, this should be safe for others.
> +		 */
> +		hw_port_test_set(ci, 5);
> +		hw_port_test_set(ci, 0);
> +	}
>  	return 0;
>  };
>  
> @@ -112,6 +123,7 @@ static int host_start(struct ci_hdrc *ci)
>  
>  	priv = (struct ehci_ci_priv *)ehci->priv;
>  	priv->reg_vbus = NULL;
> +	priv->ci = ci;
>  
>  	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
>  		if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
> -- 
> 2.1.0
> 

-- 

Best Regards,
Peter Chen
