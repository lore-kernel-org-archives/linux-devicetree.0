From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: bindings: add allwinner,otg-routed property for
 phy-sun4i-usb
Date: Wed, 21 Sep 2016 10:10:14 +0300
Message-ID: <4a1ab62a-4091-fd75-d753-fb30585dffa5@redhat.com>
References: <20160921070406.27445-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160921070406.27445-1-icenowy-ymACFijhrKM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 09/21/2016 10:04 AM, Icenowy Zheng wrote:
> On some newer Allwinner SoCs (H3 or A64), the PHY0 can be either routed to
> the MUSB controller (which is an OTG controller) or the OHCI/EHCI pair
> (which is a Host-only controller, but more stable and easy to implement).
>
> This property marks whether on a certain board which controller should be
> attached to the PHY.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

Erm, I think that the idea here is to dynamically switch the routing
based on the id-pin of the otg connector. IOW use the musb controller
for device mode, and the ehci/ohci proper for proper host support
when in host mode.

Regards,

Hans



> ---
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index 287150d..5c11d57 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -36,6 +36,13 @@ Optional properties:
>  - usb1_vbus-supply : regulator phandle for controller usb1 vbus
>  - usb2_vbus-supply : regulator phandle for controller usb2 vbus
>
> +Optional properties for H3 or A64 SoCs:
> +- allwinner,otg-routed : USB0 (OTG) PHY is routed to OHCI/EHCI pair rather than
> +			 MUSB. (boolean, if this property is set, the OHCI/EHCI
> +			 controllers at PHY0 should be enabled and the MUSB
> +			 controller must *NOT* be enabled, and thus the PHY can
> +			 only work in host mode)
> +
>  Example:
>  	usbphy: phy@0x01c13400 {
>  		#phy-cells = <1>;
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
