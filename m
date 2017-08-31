From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] RM64: dts: ls208xa: Add iommu-map property for pci
Date: Thu, 31 Aug 2017 12:30:39 +0100
Message-ID: <20170831113039.GF15031@leverpostej>
References: <1504171424-15536-1-git-send-email-Bharat.Bhushan@nxp.com>
 <06c57ca4-edaa-df26-b1d9-1906141c5065@arm.com>
 <AM5PR0401MB2545B7C55F634D7B9CABAE629A9D0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
 <10be1849-8071-64fc-5ee2-b6e429c64b9e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <10be1849-8071-64fc-5ee2-b6e429c64b9e-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Bharat Bhushan <bharat.bhushan-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Gang Liu <gang.liu-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 11:49:37AM +0100, Marc Zyngier wrote:
> [Fixing Mark's address...]

Thanks!

> On 31/08/17 11:41, Bharat Bhushan wrote:
> > 
> >> -----Original Message-----
> >> From: Marc Zyngier [mailto:marc.zyngier-5wv7dgnIgG8@public.gmane.org]
> >> Sent: Thursday, August 31, 2017 3:02 PM
> >> To: Bharat Bhushan <bharat.bhushan-3arQi8VN3Tc@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> >> ark.rutland-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Gang Liu
> >> <gang.liu-3arQi8VN3Tc@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> >> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> >> catalin.marinas-5wv7dgnIgG8@public.gmane.org
> >> Subject: Re: [PATCH] RM64: dts: ls208xa: Add iommu-map property for pci
> >>
> >> On 31/08/17 10:23, Bharat Bhushan wrote:
> >>> This patch adds iommu-map property for PCIe, which enables SMMU for
> >>> these devices on LS208xA devices.
> >>>
> >>> Signed-off-by: Bharat Bhushan <Bharat.Bhushan-3arQi8VN3Tc@public.gmane.org>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> >>> b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> >>> index 94cdd30..67cf605 100644
> >>> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> >>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> >>> @@ -606,6 +606,7 @@
> >>>  			num-lanes = <4>;
> >>>  			bus-range = <0x0 0xff>;
> >>>  			msi-parent = <&its>;
> >>> +			iommu-map = <0 &smmu 0 1>;	/* This is fixed-up by
> >> u-boot */
> >>
> >> What does this do when your version of u-boot doesn't fill this in for you?
> > 
> > Good question, frankly I have not thought of this case before.
> > But if we pass length = 0 in above property then no fixup happen with
> > happen with older u-boot. In this case of_iommu_configure() will
> > return NULL iommu-ops and it switch to swio-tlb. Will that work?
> I really don't like this. You rely on having invalid data in the DT, and
> that seems just wrong.

Indeed.

Either the property should be valid (and correctly representing the HW),
or it shouldn't be present. Relying on kernel implementation details is
*not* OK.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
