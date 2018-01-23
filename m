From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: add basic DTS for i.MX8MQ
Date: Tue, 23 Jan 2018 14:23:19 +0100
Message-ID: <1516713799.25726.21.camel@pengutronix.de>
References: <20180117183244.28303-1-l.stach@pengutronix.de>
         <20180117183244.28303-2-l.stach@pengutronix.de>
         <20180123103609.GD27764@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123103609.GD27764@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 23.01.2018, 18:36 +0800 schrieb Shawn Guo:
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
> > 
> > One known limitation is that the driver for the GPC interrupt
> > controller is still missing, rendering the CPU sleep states unusable
> > as there is nothing waking them up anymore. This will be fixed in
> > due course.
> > 
> > > > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/Makefile             |   1 +
> >  arch/arm64/boot/dts/nxp/imx8mq-pinfunc.h | 632 +++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/nxp/imx8mq.dtsi      | 418 ++++++++++++++++++++
> >  3 files changed, 1051 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/nxp/imx8mq-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/nxp/imx8mq.dtsi
> 
> <snip>

> > +	timer {
> > > > +		compatible = "arm,armv8-timer";
> > > > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
> > > > +		             <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
> > > > +		             <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
> > > > +		             <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
> > > > +		clock-frequency = <8333333>;
> > > > +		interrupt-parent = <&gic>;
> > > > +		arm,no-tick-in-suspend;
> > > > +	};
> > +
> > +	peripherals@0 {
> 
> What's the reason of using 'peripherals' rather than 'soc' which is the
> case for most device trees?

Just personal preference. I find it a bit confusing to have a soc node,
that doesn't include a lot of stuff (e.g CPUs) that are found on the
SoC. I someone feels strongly about this I'll change it.

> > +		compatible = "simple-bus";
> > +
> 
> Drop the newline.
> 
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <1>;
> > > > +		ranges = <0x0 0x0 0x0 0x3e000000>;
> > +
> > +
> 
> One newline is enough.
> 
> > > > +		aips-bus@30000000 { /* AIPS1 */
> > > > +			compatible = "nxp,imx8mq-aips-bus", "simple-bus";
> > +
> 
> Drop the newline.
> 
> > > > +			#address-cells = <1>;
> > > > +			#size-cells = <1>;
> > > > +			ranges = <0x30000000 0x30000000 0x400000>;
> > +
> > > > > > +			gpio1: gpio@30200000 {
> > +				compatible = "nxp,imx8mq-gpio", "fsl,imx35-gpio";
> 
> It looks a bit odd to have different vendor prefix for the same device.
> But we can understand the reason.  Just curious if this is what vendor
> kernel does?

No, I did it mostly to be consistent with the location of the DT files
under "nxp". I'll change this to match the "freescale" location.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
