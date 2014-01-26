From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/8] phy-rcar-usb-gen2: add device tree support
Date: Sun, 26 Jan 2014 21:03:34 +0300
Message-ID: <52E54DF6.5070601@cogentembedded.com>
References: <1390754945-28142-1-git-send-email-ben.dooks@codethink.co.uk> <1390754945-28142-6-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390754945-28142-6-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01/26/2014 07:49 PM, Ben Dooks wrote:

> Add support for the phy-rcar-gen2-usb driver to be probed from device tree.

> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> Reviewed-by: Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
> Fixes from v1:
> 	- use of_property_reasd-bool()
> 	- remove unused of_id variable

> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   drivers/usb/phy/phy-rcar-gen2-usb.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)

> diff --git a/drivers/usb/phy/phy-rcar-gen2-usb.c b/drivers/usb/phy/phy-rcar-gen2-usb.c
> index db3ab34..d146388 100644
> --- a/drivers/usb/phy/phy-rcar-gen2-usb.c
> +++ b/drivers/usb/phy/phy-rcar-gen2-usb.c
[...]
> @@ -203,16 +210,29 @@ static int rcar_gen2_usb_phy_probe(struct platform_device *pdev)
[...]
> +	if (of_id) {

    You've removed the variable but not its use. Have you tried to compile 
this patch?

> +		if (of_property_read_bool(dev->of_node, "renesas,usb0-hs"))
> +			priv->ugctrl2 = USBHS_UGCTRL2_USB0_HS;
> +		else
> +			priv->ugctrl2 = USBHS_UGCTRL2_USB0_PCI;
> +
> +		if (of_property_read_bool(dev->of_node, "renesas,usb2-ss"))
> +			priv->ugctrl2 |= USBHS_UGCTRL2_USB2_SS;
> +		else
> +			priv->ugctrl2 |= USBHS_UGCTRL2_USB2_PCI;
> +	} else {
> +		priv->ugctrl2 = pdata->chan0_pci ?
> +			USBHS_UGCTRL2_USB0_PCI : USBHS_UGCTRL2_USB0_HS;
> +		priv->ugctrl2 |= pdata->chan2_pci ?
> +			USBHS_UGCTRL2_USB2_PCI : USBHS_UGCTRL2_USB2_SS;
> +	}
> +
>   	retval = usb_add_phy(&priv->phy, USB_PHY_TYPE_USB2);
>   	if (retval < 0) {
>   		dev_err(dev, "Failed to add USB phy\n");

WBR, Sergei


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
