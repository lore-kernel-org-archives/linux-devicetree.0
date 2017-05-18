From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: Enable some SMMUs
Date: Thu, 18 May 2017 14:20:02 +0100
Message-ID: <20170518132002.GZ7759@e110455-lin.cambridge.arm.com>
References: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy@arm.com>
 <1495113239.3174.11.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495113239.3174.11.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 18, 2017 at 02:13:59PM +0100, Jon Medhurst (Tixy) wrote:
> On Thu, 2017-05-18 at 13:23 +0100, Robin Murphy wrote:
> > The IOMMU-backed DMA API support has now been in place for a while and
> > proven stable, so there's no real need to keep most of Juno's SMMUs
> > disabled. The USB, HDLCDs, and CoreSight ETR all just need to map RAM
> > buffers for DMA - enabling their SMMUs obviates CPU bounce buffering for
> > USB's streaming DMA to the upper memory bank, and lets the other two
> > allocate their relatively large coherent buffers without pressuring CMA.
> > 
> > Some more software work is still needed for the DMA-330 and PCIe before
> > those can accommodate SMMU translation correctly in all cases, so we
> > leave those alone for now.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> > ---
> 
> For those that don't already know, status = "disabled" for smmu is
> broken in Linux 4.12-rc1, and this fixes it...
> https://lkml.org/lkml/2017/5/17/344

Hey, fancy that!! I was just starting to wonder why some of my "disabled" nodes
in the juno-base.dts were showing as "okay". :)

Thanks Tixy for the tip!
Liviu

> 
> >  arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> > index bfe7d683a42e..02aea43238fc 100644
> > --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> > +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> > @@ -53,7 +53,6 @@
> >  		#global-interrupts = <1>;
> >  		dma-coherent;
> >  		power-domains = <&scpi_devpd 0>;
> > -		status = "disabled";
> >  	};
> >  
> >  	gic: interrupt-controller@2c010000 {
> > @@ -546,7 +545,6 @@
> >  			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> >  		#iommu-cells = <1>;
> >  		#global-interrupts = <1>;
> > -		status = "disabled";
> >  	};
> >  
> >  	smmu_hdlcd0: iommu@7fb20000 {
> > @@ -556,7 +554,6 @@
> >  			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> >  		#iommu-cells = <1>;
> >  		#global-interrupts = <1>;
> > -		status = "disabled";
> >  	};
> >  
> >  	smmu_usb: iommu@7fb30000 {
> > @@ -567,7 +564,6 @@
> >  		#iommu-cells = <1>;
> >  		#global-interrupts = <1>;
> >  		dma-coherent;
> > -		status = "disabled";
> >  	};
> >  
> >  	dma@7ff00000 {

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
