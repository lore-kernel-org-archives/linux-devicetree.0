From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] ARM: i.MX: dts: add fsl, imx25-wdt compatible to
 all relevant watchdog nodes
Date: Mon, 26 Sep 2016 07:34:19 +0300
Message-ID: <20160926043419.wljnbmopmfy4kor4@tarshish>
References: <1474850361-20884-1-git-send-email-vz@mleia.com>
 <1474850361-20884-3-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474850361-20884-3-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Mon, Sep 26, 2016 at 03:39:21AM +0300, Vladimir Zapolskiy wrote:
> Watchdog device controller found on all modern SoCs from i.MX series
> and firstly introduced in i.MX25 is not one in one compatible with the
> watchdog controllers on i.MX21, i.MX27 and i.MX31, the latter
> controlles don't have WICR (and pretimeout notification support) and
> WMCR registers. To get benefit from the more advanced watchdog device
> and to avoid operations over non-existing registers on legacy SoCs add
> fsl,imx25-wdt compatible to descriptions of all i.MX25 compatible
> watchdog controllers.

Maybe also update Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt? 
In a separate patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
