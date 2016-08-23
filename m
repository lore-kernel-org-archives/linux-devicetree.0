From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/7] phy-sun4i-usb: Add
 "allwinner,usb0-usb-a-connector" dt property
Date: Tue, 23 Aug 2016 13:00:16 -0500
Message-ID: <20160823180016.GA28538@rob-hp-laptop>
References: <1471781799-10457-1-git-send-email-hdegoede@redhat.com>
 <1471781799-10457-6-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471781799-10457-6-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 21, 2016 at 02:16:38PM +0200, Hans de Goede wrote:
> On some devices the musb otg controller can be used in both device and
> host mode, but requires software mode switching since there is no id pin
> connected. The usb0 phy code will default to device mode in this case.
> 
> On some systems usb0 is connected to a female USB-A port. It can still
> be used in device mode when using software mode switching and a USB
> A to A cable. To configure the controller to support both modes we must
> set its "dr_mode" dt property to "otg" (*). For these setups the device
> mode default is wrong, for a female USB-A port the default should be
> host mode.
> 
> This commit adds support to the sun4i phy code for a new
> "allwinner,usb0-usb-a-connector" dt property which can be used in dt
> files to indicate this scenario and when present it changes the default
> mode to host mode.
> 
> *) dr_mode = "host" is used when device mode is _never_ used. E.g.
> a wifi module soldered onto the PCB is connected to the musb controller.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -New patch in v2 of this patchset
> Changes in v3:
> -No changes
> ---
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 2 ++
>  drivers/phy/phy-sun4i-usb.c                             | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 287150d..8646b53 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -35,6 +35,8 @@ Optional properties:
>  - usb0_vbus-supply : regulator phandle for controller usb0 vbus
>  - usb1_vbus-supply : regulator phandle for controller usb1 vbus
>  - usb2_vbus-supply : regulator phandle for controller usb2 vbus
> +- allwinner,usb0-usb-a-connector: usb0 is connected to an USB-A connector,
> +                     rather then an USB-B connector as one would expect (bool)

This seems like a pretty generic problem: a board has an A connector 
wired to an OTG controller. So I think we should have a generic 
property. The only part is here that is not is you have 3 USB buses for 
the PHY. That probably should have been 3 child nodes for each PHY port.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
