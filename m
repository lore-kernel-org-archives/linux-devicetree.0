From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v5 2/7] phy-sun4i-usb: Add extcon support
 for the otg phy (phy0)
Date: Sat, 01 Aug 2015 00:23:19 +1000
Message-ID: <55BB84D7.70109@gmail.com>
References: <1434199071-22127-1-git-send-email-hdegoede@redhat.com> <1434199071-22127-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434199071-22127-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On 13/06/2015 10:37 PM, Hans de Goede wrote:
> The sunxi musb glue needs to know if a host or normal usb cable is plugged
> in, add extcon support so that the musb glue can monitor the host status.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> -Split out of the "Add id and vbus detection support" commit
> -Ported to the new extcon API queued for 4.2
> ---
>   drivers/phy/Kconfig         |  1 +
>   drivers/phy/phy-sun4i-usb.c | 32 +++++++++++++++++++++++++++++++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index a53bd5b..9841780 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -173,6 +173,7 @@ config PHY_SUN4I_USB
>   	tristate "Allwinner sunxi SoC USB PHY driver"
>   	depends on ARCH_SUNXI && HAS_IOMEM && OF
>   	depends on RESET_CONTROLLER
> +	depends on EXTCON
>   	select GENERIC_PHY
>   	help
>   	  Enable this to support the transceiver that is part of Allwinner
>
Should probably add CONFIG_EXTCON=y to arch/arm/configs/sunxi_defconfig 
so that CONFIG_PHY_SUN4I_USB=y works out of the box.

Regards,
Jonathan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
