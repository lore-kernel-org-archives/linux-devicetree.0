From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 1/4] phy-sun4i-usb: Add missing
 EXPORT_SYMBOL for sun4i_usb_phy_set_squelch_detect
Date: Wed, 15 Jul 2015 17:17:27 +0530
Message-ID: <55A6484F.9040302@ti.com>
References: <1436366500-12555-1-git-send-email-hdegoede@redhat.com> <1436366500-12555-2-git-send-email-hdegoede@redhat.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCOOP4VF5IDRBX4QTGWQKGQE5C2GYDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1436366500-12555-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 08 July 2015 08:11 PM, Hans de Goede wrote:
> sun4i_usb_phy_set_squelch_detect is used by other code, which may be built
> as a module, so it should be exported.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

merged this patch to linux-phy tree.

Cheers
Kishon
> ---
> Changes in v6:
> -New patch in v6 of the sunxi musb support series
> ---
>  drivers/phy/phy-sun4i-usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index e17c539..b82aa26 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -212,6 +212,7 @@ void sun4i_usb_phy_set_squelch_detect(struct phy *_phy, bool enabled)
>  
>  	sun4i_usb_phy_write(phy, PHY_SQUELCH_DETECT, enabled ? 0 : 2, 2);
>  }
> +EXPORT_SYMBOL(sun4i_usb_phy_set_squelch_detect);
>  
>  static struct phy_ops sun4i_usb_phy_ops = {
>  	.init		= sun4i_usb_phy_init,
> 
