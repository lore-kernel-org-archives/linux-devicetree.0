From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 11/13] dtb: amd: Add PCIe SMMU device tree node
Date: Thu, 28 Jan 2016 11:19:49 +0000
Message-ID: <20160128111949.GG30928@arm.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <1453929121-12171-12-git-send-email-Suravee.Suthikulpanit@amd.com>
 <20160128111453.GG17123@leverpostej>
 <20160128111738.GF30928@arm.com>
 <20160128111818.GH17123@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160128111818.GH17123@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 11:18:19AM +0000, Mark Rutland wrote:
> On Thu, Jan 28, 2016 at 11:17:39AM +0000, Will Deacon wrote:
> > On Thu, Jan 28, 2016 at 11:14:53AM +0000, Mark Rutland wrote:
> > > On Wed, Jan 27, 2016 at 03:11:59PM -0600, Suravee Suthikulpanit wrote:
> > > > From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> > > > 
> > > > Add PCIe SMMU device tree node for AMD Seattle SOC.
> > > > 
> > > > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> > > > ---
> > > >  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 23 +++++++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> > > > index a7fc059..bfccfea 100644
> > > > --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> > > > +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> > > > @@ -210,6 +210,7 @@
> > > >  			device_type = "pci";
> > > >  			bus-range = <0 0x7f>;
> > > >  			msi-parent = <&v2m0>;
> > > > +			#stream-id-cells = <16>;
> > > >  			reg = <0 0xf0000000 0 0x10000000>;
> > > >  
> > > >  			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
> > > > @@ -230,6 +231,28 @@
> > > >  				<0x03000000 0x01 0x00000000 0x01 0x00000000 0x7f 0x00000000>;
> > > >  		};
> > > >  
> > > > +		pcie0_smmu: smmu@e0a00000 {
> > > > +			 compatible = "arm,mmu-401";
> > > > +			 reg = <0 0xe0a00000 0 0x10000>;
> > > > +			 #global-interrupts = <1>;
> > > > +			 interrupts = /* Uses combined intr for both
> > > > +				       * global and context
> > > > +				       */
> > > > +				      <0 333 4>,
> > > > +				      <0 333 4>;
> > > > +			/* Note:
> > > > +			 * SID[2:0]  = PCIe function number
> > > > +			 * SID[7:3]  = PCIe device number
> > > > +			 * SID[14:8] = PCIe bus number
> > > > +			 */
> > > > +			 mmu-masters = <&pcie0
> > > > +				/* 1:00:[0,3] */ 256 257 258 259
> > > > +				/* 2:00:[0,3] */ 512 513 514 515
> > > > +				/* 3:00:[0,3] */ 768 769 770 771
> > > > +				/* 4:00:[0,3] */ 1024 1025 1026 1027
> > > > +			 >;
> > > > +		 };
> > > 
> > > This doesn't look right to me.
> > > 
> > > I didn't think that RID->SID mapping was actually defined by any
> > > binding, so (how) are these numbers used?
> > > 
> > > I'm uncomfortable with this, given we should be moving towards the
> > > generic IOMMU binding (and then we'd use the iommu-map binding [1] for
> > > this).
> > > 
> > > Will, Robin, thoughts?
> > 
> > The driver currently assumes a 1:1 RID:SID mapping when it sees a PCI
> > device, so those numbers should be ignored.
> 
> Given that, they shouldn't be in the DT, then?

Not unless there's a patch extending the driver/binding so that they do
something useful, no.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
