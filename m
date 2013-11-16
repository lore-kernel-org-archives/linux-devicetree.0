From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] of: make of_get_phy_mode parse 'phy-connection-type'
Date: Sat, 16 Nov 2013 12:24:51 +0000
Message-ID: <20131116122451.3F0B9C4038F@trevor.secretlab.ca>
References: <20131114074711.9A8C5C402E1@trevor.secretlab.ca> < 1384496612-28392-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384496612-28392-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 15 Nov 2013 06:23:32 +0000, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Per the ePAPR v1.1 specification, 'phy-connection-type' is the canonical
> property name for describing an Ethernet to PHY connection type. Make
> sure that of_get_phy_mode() also attempts to parse that property and
> update the comments mentioning 'phy-mode' to also include
> 'phy-connection-type'.
> 
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks

g.

> ---
> Changes since v2:
> - reworked the error condition to look nicer per Grant's suggestion
> - added Grant's Acked-by tag
> - fixed a typo in the commit message on "mentioning"
> 
>  drivers/of/of_net.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index 8f9be2e..651e249 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -13,8 +13,8 @@
>  
>  /**
>   * It maps 'enum phy_interface_t' found in include/linux/phy.h
> - * into the device tree binding of 'phy-mode', so that Ethernet
> - * device driver can get phy interface from device tree.
> + * into the device tree binding of 'phy-mode' or 'phy-connection-type',
> + * so that Ethernet device driver can get phy interface from device tree.
>   */
>  static const char *phy_modes[] = {
>  	[PHY_INTERFACE_MODE_NA]		= "",
> @@ -36,8 +36,9 @@ static const char *phy_modes[] = {
>   * of_get_phy_mode - Get phy mode for given device_node
>   * @np:	Pointer to the given device_node
>   *
> - * The function gets phy interface string from property 'phy-mode',
> - * and return its index in phy_modes table, or errno in error case.
> + * The function gets phy interface string from property 'phy-mode' or
> + * 'phy-connection-type', and return its index in phy_modes table, or errno in
> + * error case.
>   */
>  int of_get_phy_mode(struct device_node *np)
>  {
> @@ -46,6 +47,8 @@ int of_get_phy_mode(struct device_node *np)
>  
>  	err = of_property_read_string(np, "phy-mode", &pm);
>  	if (err < 0)
> +		err = of_property_read_string(np, "phy-connection-type", &pm);
> +	if (err < 0)
>  		return err;
>  
>  	for (i = 0; i < ARRAY_SIZE(phy_modes); i++)
> -- 
> 1.8.3.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
