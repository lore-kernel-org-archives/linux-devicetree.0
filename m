From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: add basic DTS for i.MX8MQ
Date: Mon, 29 Jan 2018 19:00:44 +0100
Message-ID: <1517248844.2804.16.camel@pengutronix.de>
References: <20180117183244.28303-1-l.stach@pengutronix.de>
         <20180117183244.28303-2-l.stach@pengutronix.de>
         <20180129175549.f6ljaccpo5ms6xkc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180129175549.f6ljaccpo5ms6xkc@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 29.01.2018, 11:55 -0600 schrieb Rob Herring:
> On Wed, Jan 17, 2018 at 07:32:42PM +0100, Lucas Stach wrote:
> > This adds the basic DTS for the i.MX8MQ.
> > For now only the following peripherals are supported:
> > - IOMUXC (pin controller)
> > - CCM (clock controller)
> > - GPIO
> > - UART
> > - uSDHC (SD/eMMC controller)
> > - FEC (ethernet controller)
> > - i2c
> > 
> > This is enough to get a very basic board support up and running.
> > +			compatible = "nxp,imx8mq-aips-bus",
> > "simple-bus";
> > +				compatible = "nxp,imx8mq-gpio",
> > "fsl,imx35-gpio";
> > +				compatible = "nxp,imx8mq-iomuxc";
> 
> Also, are all these new compatibles documented?

Only those where the driver isn't matching one of the older
compatibles.

I'm not sure what the policy is for those "just in case" compatibles,
where we have older compatibles that are currently used, but the newer
compatibles are in the DT to make it easy to match them when any IP
integration issues turn up at a later time.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
