From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: imx6ull: add imx6ull support
Date: Mon, 14 Nov 2016 14:13:12 +0800
Message-ID: <20161114061311.GA14956@dragon>
References: <1478584614-12054-1-git-send-email-peter.chen@nxp.com>
 <1478584614-12054-2-git-send-email-peter.chen@nxp.com>
 <20161114054833.GG3310@dragon>
 <HE1PR04MB14509BFD0CBA838BC1EA7D598BBC0@HE1PR04MB1450.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <HE1PR04MB14509BFD0CBA838BC1EA7D598BBC0-6LN7OEpIatVC+P/YwrXEHc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 05:59:01AM +0000, Peter Chen wrote:
> The main difference is compatible string, I can't include two compatible strings in one dts file,
> the dts build will fail for that.
> 
> imx6ull-14x14-evk.dts 
> / {
>         model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
>         compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
> };
> 
> imx6ul-14x14-evk.dts 
> / {
>         model = "Freescale i.MX6 UltraLite 14x14 EVK Board";
>         compatible = "fsl,imx6ul-14x14-evk", "fsl,imx6ul";
> };

I created imx6ull-14x14-evk.dts like below, and DTC seems happy with it.

#include "imx6ul-14x14-evk.dts"

/ {
        model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
        compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
};

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
