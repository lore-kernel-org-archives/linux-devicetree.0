From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: shmobile: lager: enable HS-USB
Date: Wed, 08 Oct 2014 01:00:35 +0400
Message-ID: <54345473.8060305@cogentembedded.com>
References: <2438577.UAUDMkTTWI@wasted.cogentembedded.com> <2298118.7qjLAFjuvd@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2298118.7qjLAFjuvd-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2014 12:26 AM, Sergei Shtylyov wrote:

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

> Enable HS-USB device for the Lager board, defining the GPIO that the driver
> should check when probing. Since this board doesn't have the OTG ID pin, we
> assume that GP5_18 (USB0_PWEN) is an ID pin because it is 1 when the SW5 is
> in position 2-3 (meaning USB function) and 0 in other positions.

> Note that there will be pinctrl-related error messages if both internal PCI
> and HS-USB drivers are enabled but they should be just ignored.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> [Sergei: added pin function/group and prop, moved device node, fixed summary,
> supplemented changelog]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

> ---
> Changes in version 3:
> - added pin function/group and the pinctrl-related prop;
> - moved the HS-USB node to precede the USB PHY node;
> - uppercased "arm" in the summary;
> - supplemented changelog.

>   arch/arm/boot/dts/r8a7790-lager.dts |   12 ++++++++++++
>   1 file changed, 12 insertions(+)

> Index: renesas/arch/arm/boot/dts/r8a7790-lager.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7790-lager.dts
> +++ renesas/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -226,6 +226,11 @@
>   		renesas,function = "usb0";
>   	};
>
> +	hsusb_pins: usb0 {

    Oops, forgot to rename the node. :-/ Although dtc didn't protest.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
