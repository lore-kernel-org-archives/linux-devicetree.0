From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [2/3,v4] powerpc/fsl-booke: Add initial T208x QDS board support
Date: Wed, 25 Jun 2014 18:39:00 -0500
Message-ID: <1403739540.2435.87.camel@snotra.buserror.net>
References: <1402481406-10830-2-git-send-email-Shengzhou.Liu@freescale.com>
	 <20140625232358.GA12402@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140625232358.GA12402-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-06-25 at 18:23 -0500, Scott Wood wrote:
> On Wed, Jun 11, 2014 at 06:10:05PM +0800, Shengzhou Liu wrote:
> > +			flash@2 {
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +				compatible = "eon,en25s64";
> > +				reg = <2>;
> > +				spi-max-frequency = <35000000>;
> > +			};
> 
> I won't hold up this patch due to this, but you should send a patch to
> add eon to Documentation/devicetree/bindings/vendor-prefixes.txt.

at24, OTOH, looks wrong.  Shouldn't it be atmel?  How did "24" become
part of the vendor?  I see lots of existing uses, though...

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
