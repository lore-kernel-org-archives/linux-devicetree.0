From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6sx-sdb: update TX D_CAL for USBPHY
Date: Mon, 7 Nov 2016 10:06:08 +0800
Message-ID: <20161107020607.GC14622@dragon>
References: <1477882709-2518-1-git-send-email-peter.chen@nxp.com>
 <20161105083145.GF5597@dragon>
 <VI1PR04MB14556348390F18AF8D5A261D8BA70@VI1PR04MB1455.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB14556348390F18AF8D5A261D8BA70-mr6QIVyDiCG7FDLoODJFCc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 07, 2016 at 01:32:29AM +0000, Peter Chen wrote:
>  
> >On Mon, Oct 31, 2016 at 10:58:28AM +0800, Peter Chen wrote:
> >> We need to change trimming value (as a percentage) of the 17.78mA TX
> >> reference current for better signal quality. With this change, we can
> >> patch the eye-diagram test on this board.
> >
> >s/patch/pass?  I just want to confirm this is a typo, and can fix it up when applying.
> >
> 
> Thanks, Shawn. It is a typo. Help me to change both of patches please.

Applied both, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
