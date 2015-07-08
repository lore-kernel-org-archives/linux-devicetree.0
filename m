From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] GICv3: Add ITS entry to THUNDER dts
Date: Wed, 08 Jul 2015 14:26:33 -0700
Message-ID: <7hpp42cpdi.fsf@deeprootsystems.com>
References: <1435345943-31833-1-git-send-email-tchalamarla@caviumnetworks.com>
	<D2BD6D7B-E4B2-46B8-A324-9261DCFA2642@caviumnetworks.com>
	<20150703095755.GH25907@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150703095755.GH25907-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org> (Catalin
	Marinas's message of "Fri, 3 Jul 2015 10:57:56 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: "Chalamarla, Tirumalesh" <Tirumalesh.Chalamarla-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "marc.zyngier@arm.com" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "Will.Deacon@arm.com" <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "rrichter@cavium.com" <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org> writes:

> On Thu, Jul 02, 2015 at 08:26:02PM +0000, Chalamarla, Tirumalesh wrote:
>> > On Jun 26, 2015, at 12:12 PM, Tirumalesh Chalamarla <tchalamarla-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
>> > 
>> > From: Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> > 
>> > The PCIe host controller uses MSIs provided by GICv3 ITS. Enable it on
>> > Thunder SoCs by adding an entry to DT.
>> > 
>> > Signed-off-by: Tirumalesh Chalamarla <tchalamarla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> > Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>> > ---
>> > arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 9 +++++++++
>> > 1 file changed, 9 insertions(+)
>> > 
>> > diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
>> > index d8c0bdc..9cb7cf9 100644
>> > --- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
>> > +++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
>> > @@ -376,10 +376,19 @@
>> > 		gic0: interrupt-controller@8010,00000000 {
>> > 			compatible = "arm,gic-v3";
>> > 			#interrupt-cells = <3>;
>> > +			#address-cells = <2>;
>> > +			#size-cells = <2>;
>> > +			ranges;
>> > 			interrupt-controller;
>> > 			reg = <0x8010 0x00000000 0x0 0x010000>, /* GICD */
>> > 			      <0x8010 0x80000000 0x0 0x600000>; /* GICR */
>> > 			interrupts = <1 9 0xf04>;
>> > +
>> > +			its: gic-its@8010,00020000 {
>> > +				compatible = "arm,gic-v3-its";
>> > +				msi-controller;
>> > +				reg = <0x8010 0x20000 0x0 0x200000>;
>> > +			};
>> > 		};
>> > 
>> > 		uaa0: serial@87e0,24000000 {
>> 
>> is it possible to pull this for 4.2?
>
> The dts files go in via the arm-soc tree (cc'ing arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org).

Picked this up for v4.2-rc,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
