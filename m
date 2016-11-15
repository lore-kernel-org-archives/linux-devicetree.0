From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Add DT support for DA8xx
Date: Tue, 15 Nov 2016 15:12:39 -0600
Message-ID: <20161115211239.GA11011@uda0271908>
References: <1478188752-22447-1-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478188752-22447-1-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 04:59:08PM +0100, Alexandre Bailon wrote:
> Changes in v2:
> * Remove unrelated changes in patch 3
> * Rename the device node in patch 4
> 
> Changes in v3:
> * Fix few mistakes in DT binding sample
> * Only build the device table if DT is enabled
> 
> Change in v4:
> * Fix a nit
> 
> Alexandre Bailon (1):
>   ARM: dts: da850: Add the usb otg device node
> 
> Petr Kulhavy (3):
>   dt/bindings: Add binding for the DA8xx MUSB driver
>   usb: musb: core: added helper function for parsing DT
>   usb: musb: da8xx: Add DT support for the DA8xx driver

Applied. Thanks.
-Bin.

> 
>  .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++
>  arch/arm/boot/dts/da850-lcdk.dts                   |  8 ++++
>  arch/arm/boot/dts/da850.dtsi                       | 15 +++++++
>  drivers/usb/musb/da8xx.c                           | 46 ++++++++++++++++++++++
>  drivers/usb/musb/musb_core.c                       | 19 +++++++++
>  drivers/usb/musb/musb_core.h                       |  6 +++
>  6 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
> 
> -- 
> 2.7.3
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
