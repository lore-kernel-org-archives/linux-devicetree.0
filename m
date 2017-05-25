From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Thu, 25 May 2017 16:20:32 +0800
Message-ID: <20170525082030.GB26102@dragon>
References: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
 <20170525070007.GU26102@dragon>
 <eb86f383-3c27-2276-6213-99c5143420f5@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <eb86f383-3c27-2276-6213-99c5143420f5-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 11:06:47AM +0300, Nikita Yushchenko wrote:
> >> +&edma1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&dspi2 {
> > 
> > Please keep these labelled nodes sort alphabetically.
> 
> Ok
> 
> >> +	bus-num = <1>;
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&pinctrl_dspi2>;
> >> +	status = "okay";
> > 
> > We usually have 'status' line at the bottom of property list.
> 
> Ok
> 
> >> +	spi-num-chipselects = <2>;
> >> +
> >> +	hi8435@1 {
> > 
> > Node name should be something generic, while label can be specific
> > model name.  The following form might be better.
> > 
> > 	hi8435: sensor@1
> 
> Ok
> 
> Although the same file, in lines nearby, has m25p128@0 and at93c46d@1.

It seems that I need more eyes to help review.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
