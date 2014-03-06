From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] phy: omap-usb2: Adapt phy-omap-usb2 for AM437x
Date: Thu, 6 Mar 2014 16:43:07 +0530
Message-ID: <53185843.8060101@ti.com>
References: <1393841424-27656-1-git-send-email-george.cherian@ti.com> <1393841424-27656-2-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393841424-27656-2-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

George,

On Monday 03 March 2014 03:40 PM, George Cherian wrote:
> Adapt phy-omap-usb2 driver for AM437x.
> 	- Add new comaptible "ti,am437x-usb2" for AM437x
> 	- Pass proper data to differentiate AM437x and others.
> 	- AM437x doesnot support  set_vbus and start_srp.
> 	- Also update the Documentation to add new compatible.
>
> Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/usb/usb-phy.txt |  4 +-
>   drivers/phy/phy-omap-usb2.c                       | 49 +++++++++++++++++------
>   include/linux/usb/omap_usb.h                      |  9 +++++
>   3 files changed, 49 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-phy.txt b/Documentation/devicetree/bindings/usb/usb-phy.txt
> index c0245c8..b3fa409 100644
> --- a/Documentation/devicetree/bindings/usb/usb-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-phy.txt
> @@ -3,7 +3,9 @@ USB PHY
>   OMAP USB2 PHY
>
>   Required properties:
> - - compatible: Should be "ti,omap-usb2"
> + - compatible: Should be either of
> +	* "ti,omap-usb2" for OMAP4, OMAP5, DRA7
> +	* "ti,am437x-usb2" for AM437x
>    - reg : Address and length of the register set for the device.
>    - #phy-cells: determine the number of cells that should be given in the
>      phandle while referencing this phy.
> diff --git a/drivers/phy/phy-omap-usb2.c b/drivers/phy/phy-omap-usb2.c
> index 7699752..d54f24b 100644
> --- a/drivers/phy/phy-omap-usb2.c
> +++ b/drivers/phy/phy-omap-usb2.c
> @@ -144,6 +144,31 @@ static struct phy_ops ops = {
>   	.owner		= THIS_MODULE,
>   };
>
> +#ifdef CONFIG_OF
> +static const struct usb_phy_data omap_usb2_data = {
> +	.label = "omap_usb2",
> +	.flags = OMAP_USB2_HAS_START_SRP | OMAP_USB2_HAS_SET_VBUS,
> +};
> +
> +static const struct usb_phy_data am437x_usb2_data = {
> +	.label = "am437x_usb2",
> +	.flags =  0,
> +};
> +
> +static const struct of_device_id omap_usb2_id_table[] = {
> +	{
> +		.compatible = "ti,omap-usb2",
> +		.data = &omap_usb2_data,
> +	},
> +	{
> +		.compatible = "ti,am437x-usb2",
> +		.data = &am437x_usb2_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
> +#endif
> +
>   static int omap_usb2_probe(struct platform_device *pdev)
>   {
>   	struct omap_usb	*phy;
> @@ -153,10 +178,16 @@ static int omap_usb2_probe(struct platform_device *pdev)
>   	struct device_node *node = pdev->dev.of_node;
>   	struct device_node *control_node;
>   	struct platform_device *control_pdev;
> +	const struct of_device_id *of_id;
> +	struct usb_phy_data *phy_data;
> +
> +	of_id = of_match_device(of_match_ptr(omap_usb2_id_table), &pdev->dev);
>
> -	if (!node)
> +	if (!of_id)
>   		return -EINVAL;
>
> +	phy_data = (struct usb_phy_data *)of_id->data;
> +
>   	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
>   	if (!phy) {
>   		dev_err(&pdev->dev, "unable to allocate memory for USB2 PHY\n");
> @@ -172,7 +203,7 @@ static int omap_usb2_probe(struct platform_device *pdev)
>   	phy->dev		= &pdev->dev;
>
>   	phy->phy.dev		= phy->dev;
> -	phy->phy.label		= "omap-usb2";
> +	phy->phy.label		= phy_data->label;
>   	phy->phy.set_suspend	= omap_usb2_suspend;
>   	phy->phy.otg		= otg;
>   	phy->phy.type		= USB_PHY_TYPE_USB2;
> @@ -196,8 +227,10 @@ static int omap_usb2_probe(struct platform_device *pdev)
>
>   	otg->set_host		= omap_usb_set_host;
>   	otg->set_peripheral	= omap_usb_set_peripheral;
> -	otg->set_vbus		= omap_usb_set_vbus;
> -	otg->start_srp		= omap_usb_start_srp;
> +	if (phy_data->flags & OMAP_USB2_HAS_SET_VBUS)
> +		otg->set_vbus		= omap_usb_set_vbus;
> +	if (phy_data->flags & OMAP_USB2_HAS_START_SRP)
> +		otg->start_srp		= omap_usb_start_srp;
>   	otg->phy		= &phy->phy;
>
>   	platform_set_drvdata(pdev, phy);
> @@ -297,14 +330,6 @@ static const struct dev_pm_ops omap_usb2_pm_ops = {
>   #define DEV_PM_OPS     NULL
>   #endif
>
> -#ifdef CONFIG_OF
> -static const struct of_device_id omap_usb2_id_table[] = {
> -	{ .compatible = "ti,omap-usb2" },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
> -#endif
> -
>   static struct platform_driver omap_usb2_driver = {
>   	.probe		= omap_usb2_probe,
>   	.remove		= omap_usb2_remove,
> diff --git a/include/linux/usb/omap_usb.h b/include/linux/usb/omap_usb.h
> index 6ae2936..034161d 100644
> --- a/include/linux/usb/omap_usb.h
> +++ b/include/linux/usb/omap_usb.h
> @@ -42,6 +42,15 @@ struct omap_usb {
>   	u8			is_suspended:1;
>   };
>
> +struct usb_phy_data {
> +	const char *label;
> +	u32 flags;

u8 should be sufficient no?

Can you also refresh the patch on linux-phy next?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
