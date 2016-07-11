From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Mon, 11 Jul 2016 09:58:54 -0500
Message-ID: <20160711145854.GB16636@rob-hp-laptop>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-4-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467860066-15142-4-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 10:54:24AM +0800, William Wu wrote:
> Add a quirk to configure the core to support the
> UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
> interface is hardware property, and it's platform
> dependent. Normall, the PHYIf can be configured

s/Normall/Normally/
s/PHYIf/PHYIF/

> during coreconsultant. But for some specific usb

s/usb/USB/

> cores(e.g. rk3399 soc dwc3), the default PHYIf
> configuration value is fault, so we need to
> reconfigure it by software.
> 
> And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM

s/dwc3/DWC3/

> must be set to the corresponding value according to
> the UTMI+ PHY interface.

And wrap your lines at 70-74 characters.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
