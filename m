From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 06/24] ARM: dts: imx6-sabrelite: add OV5642 and OV5640 camera sensors
Date: Sun, 05 Feb 2017 17:17:43 +0200
Message-ID: <3727718.gJmzFHnJnC@avalon>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com> <1bb64209-7c58-fe10-3db9-c5b8103eda90@gmail.com> <1484571323.8415.98.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484571323.8415.98.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 16 Jan 2017 13:55:23 Philipp Zabel wrote:
> On Fri, 2017-01-13 at 15:04 -0800, Steve Longerbeam wrote:
> > On 01/13/2017 04:03 AM, Philipp Zabel wrote:
> > > Am Freitag, den 06.01.2017, 18:11 -0800 schrieb Steve Longerbeam:
> > >> Enables the OV5642 parallel-bus sensor, and the OV5640 MIPI CSI-2
> > >> sensor.
> > >> Both hang off the same i2c2 bus, so they require different (and non-
> > >> default) i2c slave addresses.
> > >> 
> > >> The OV5642 connects to the parallel-bus mux input port on
> > >> ipu1_csi0_mux.
> > >> 
> > >> The OV5640 connects to the input port on the MIPI CSI-2 receiver on
> > >> mipi_csi. It is set to transmit over MIPI virtual channel 1.
> > >> 
> > >> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > >> ---
> > >> 
> > >>   arch/arm/boot/dts/imx6dl-sabrelite.dts   |   5 ++
> > >>   arch/arm/boot/dts/imx6q-sabrelite.dts    |   6 ++
> > >>   arch/arm/boot/dts/imx6qdl-sabrelite.dtsi | 118 ++++++++++++++++++++++
> > >>   3 files changed, 129 insertions(+)
> > >> 
> > >> diff --git a/arch/arm/boot/dts/imx6dl-sabrelite.dts
> > >> b/arch/arm/boot/dts/imx6dl-sabrelite.dts index 0f06ca5..fec2524 100644
> > >> --- a/arch/arm/boot/dts/imx6dl-sabrelite.dts
> > >> +++ b/arch/arm/boot/dts/imx6dl-sabrelite.dts
> 
> [...]
> 
> > >> @@ -299,6 +326,52 @@
> > >> 
> > >>   	pinctrl-names = "default";
> > >>   	pinctrl-0 = <&pinctrl_i2c2>;
> > >>   	status = "okay";
> > >> 
> > >> +
> > >> +	ov5640: camera@40 {
> > >> +		compatible = "ovti,ov5640";
> > >> +		pinctrl-names = "default";
> > >> +		pinctrl-0 = <&pinctrl_ov5640>;
> > >> +		clocks = <&mipi_xclk>;
> > >> +		clock-names = "xclk";
> > >> +		reg = <0x40>;
> > >> +		xclk = <22000000>;
> > > 
> > > This is superfluous, you can use clk_get_rate on mipi_xclk.
> > 
> > This property is actually there to tell the driver what to set the
> > rate to, with clk_set_rate(). So you are saying it would be better
> > to set the rate in the device tree and the driver should only
> > retrieve the rate?
> 
> Yes. Given that this is a reference clock input that is constant on a
> given board and never changes during runtime, I think this is the
> correct way. The clock will be fixed rate on most boards, I assume.

I think it's a bit worse than that. The ov5640 and ov5642 drivers should 
retrieve the clock rate and compute register values accordingly (PLL 
configuration parameters for instance, but most probably other values as 
well). Unfortunately, as usual with Omnivision, the lack of public and even 
non-public information results in drivers hardcoding large lists of 
register/value pairs that have been computed for a specific clock frequency. 
The drivers will thus not operate correctly if the clock is running at a 
different rate. Until that can be fixed, the best option is probably to assign 
the rate in the device tree as Philipp proposed, and to use clk_get_rate() in 
the driver to reject any rate other than 22MHz.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
