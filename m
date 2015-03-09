From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 02/15] phy-sun4i-usb: Add a helper function to update the iscr register
Date: Mon, 09 Mar 2015 22:47:11 +0100
Message-ID: <4772280.xE1WBZVd8Z@wuerfel>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com> <1425933628-9672-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425933628-9672-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 09 March 2015 21:40:15 Hans de Goede wrote:
> +void sun4i_usb_phy_update_iscr(struct phy *_phy, u32 clr, u32 set)
> +{
> +       struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
> +       struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
> +       u32 iscr;
> +
> +       iscr = readl(data->base + REG_ISCR);
> +       iscr &= ~clr;
> +       iscr |= set;
> +       writel(iscr, data->base + REG_ISCR);
> +}
> +EXPORT_SYMBOL(sun4i_usb_phy_update_iscr);
> +
> 

I would generally consider this a bad design. What is the purpose of
calling sun4i_usb_phy_update_iscr() and why can't there be a high-level
PHY API for this?

The only other phy driver with exports like this is the OMAP driver,
and that has caused problems in the past.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
