From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: socfpga: dts: Move common nodes to cyclone5
 dtsi
Date: Thu, 3 Oct 2013 13:29:47 -0500
Message-ID: <1380824987.32672.2.camel@linux-builds1>
References: <1380699333-558-1-git-send-email-s.trumtrar@pengutronix.de>
	 <1380699333-558-2-git-send-email-s.trumtrar@pengutronix.de>
	 <1380812321.7464.7.camel@linux-builds1>
	 <20131003163743.GB14042@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131003163743.GB14042-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2013-10-03 at 18:37 +0200, Steffen Trumtrar wrote:
> Hi Dinh,
> 
> On Thu, Oct 03, 2013 at 09:58:41AM -0500, Dinh Nguyen wrote:
> > On Wed, 2013-10-02 at 09:35 +0200, Steffen Trumtrar wrote:
> > > +/include/ "socfpga_cyclone5.dtsi"
> > > +
> > > +/ {
> > > +	model = "Altera SOCFPGA Cyclone V SoC Development Kit";
> > > +	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
> > > +
> > > +	chosen {
> > > +		bootargs = "console=ttyS0,57600";
> > 
> > Thanks for doing this. It looks good. While you're at it can you make
> > this 115200? 57600 was early in the bring-up stage.
> > 
> 
> I can also completely remove this. The question is: does u-boot need this
> line or does it add this line itself?
> We added basic support for SoCFPGA to barebox (well, it will go live with the
> october release AFAIK. With SoCKit and SoCrates boards) and we normally do not
> need to put the bootargs in the DT. So, I would be okay to remove this line
> OR if u-boot uses it, change it to 115200. What do you think?

If bootargs is not specified in uboot, then this dts bootargs will be
used. So yes, please change it to 115200.

Thanks,
Dinh
> 
> > > +	};
> > > +
> > > +	memory {
> > > +		name = "memory";
> > > +		device_type = "memory";
> > > +		reg = <0x0 0x40000000>; /* 1GB */
> > > +	};
> > > +
> > > +	aliases {
> > > +		/* this allow the ethaddr uboot environmnet variable contents
> > > +		 * to be added to the gmac1 device tree blob.
> > > +		 */
> > > +		ethernet0 = &gmac1;
> > > +	};
> > > +};
> > 
> > With the change to 115200,
> > 
> > Acked-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > 
> 
> Thanks.
> 
> Regards,
> Steffen
> 



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
