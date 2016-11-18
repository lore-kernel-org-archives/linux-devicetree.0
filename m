From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/3] driver: Add DT support for DA8xx
Date: Fri, 18 Nov 2016 11:37:14 -0600
Message-ID: <20161118173714.GA29773@uda0271908>
References: <1479293545-7516-1-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479293545-7516-1-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 16, 2016 at 11:52:22AM +0100, Alexandre Bailon wrote:
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
> Changes in v5:
> * Nothing. Resent the v4 in two seppaated series: one for platform and one for
>   driver.
> 
> Petr Kulhavy (3):
>   dt/bindings: Add binding for the DA8xx MUSB driver
>   usb: musb: core: added helper function for parsing DT
>   usb: musb: da8xx: Add DT support for the DA8xx driver

Applied. Thanks.
-Bin.

> 
>  .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++
>  drivers/usb/musb/da8xx.c                           | 46 ++++++++++++++++++++++
>  drivers/usb/musb/musb_core.c                       | 19 +++++++++
>  drivers/usb/musb/musb_core.h                       |  6 +++
>  4 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
> 
> -- 
> 2.7.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
