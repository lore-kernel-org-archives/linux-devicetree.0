From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/3] musb: sunxi: Add support for the
 Allwinner sunxi musb controller
Date: Mon, 6 Jul 2015 13:54:49 -0500
Message-ID: <20150706185449.GL20779@saruman.tx.rr.com>
References: <1434199330-22263-1-git-send-email-hdegoede@redhat.com>
 <1434199330-22263-2-git-send-email-hdegoede@redhat.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Return-path: <linux-sunxi+bncBC5M7T4HYEKRBA465OWAKGQENMEUAWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434199330-22263-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--x38akuY2VS0PywU3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Jun 13, 2015 at 02:42:08PM +0200, Hans de Goede wrote:
> This is based on initial code to get the Allwinner sunxi musb controller
> supported by Chen-Yu Tsai and Roman Byshko.
> 
> This adds support for the Allwinner sunxi musb controller in both host only
> and otg mode. Peripheral only mode is not supported, as no boards use that.
> 
> This has been tested on a cubietruck (A20 SoC) and an UTOO P66 tablet
> (A13 SoC) with a variety of devices in host mode and with the g_serial gadget
> driver in peripheral mode, plugging otg / host cables in/out a lot of times
> in all possible imaginable plug orders.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Move polling of id and vbus-det gpio-s to the phy driver
> -Use extcon to get id (USB_HOST mode) status changes from the phy driver
> -Stop using syscon, instead use Maxime Ripard's sunxi SRAM controller driver
> Changes in v3:
> -Check that USB_MUSB_FOO config is compatible with the dr_mode setting from dt
> Changes in v4:
> -Squash in "musb: sunxi: Add pre/post root reset end platform functions" patch
> -Adjust for sunxi_sram controller driver changes
> -Stop musb work from turning vbus off again when in host mode
> Changes in v5:
> -Squash in "musb: sunxi: Remove special MUSB_SUN4I flag" patch, as it was
>  mostly revering changes done by this patch
> -Adjust for extcon api changes landing in 4.2

drivers/usb/musb/sunxi.c:75:13: warning: symbol 'sunxi_musb' was not declared. Should it be static?
drivers/usb/musb/sunxi.c:151:6: warning: symbol 'sunxi_musb_pre_root_reset_end' was not declared. Should it be static?
drivers/usb/musb/sunxi.c:158:6: warning: symbol 'sunxi_musb_post_root_reset_end' was not declared. Should it be static?

please fix.

-- 
balbi
--x38akuY2VS0PywU3--
