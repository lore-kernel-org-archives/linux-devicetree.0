From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/7] arm: dt: zynq: Add 'cpus' node
Date: Tue, 12 Nov 2013 10:06:05 -0800
Message-ID: <91c27955-2d9f-4e85-8d9e-b8a178b76cdb@CO9EHSMHS026.ehs.local>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
 <1383945677-29674-3-git-send-email-soren.brinkmann@xilinx.com>
 <528128A8.9060400@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <528128A8.9060400@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 06:57:44PM +0000, Sudeep KarkadaNagesha wrote:
> On 08/11/13 21:21, Soren Brinkmann wrote:
> > Add a 'cpus' node to describe the CPU cores of Zynq.
> >=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/z=
ynq-7000.dtsi
> > index 27ebc1ba9671..37fc04525142 100644
> > --- a/arch/arm/boot/dts/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> > @@ -15,6 +15,33 @@
> >  / {
> >  	compatible =3D "xlnx,zynq-7000";
> > =20
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		cpu@0 {
> > +			compatible =3D "arm,cortex-a9";
> > +			device_type =3D "cpu";
> > +			reg =3D <0>;
> > +			clocks =3D <&clkc 3>;
> > +			i-cache-size =3D <0x8000>;
> > +			i-cache-line-size =3D <0x20>;
> > +			d-cache-size =3D <0x8000>;
> > +			d-cache-line-size =3D <0x20>;
>=20
> These cache properties can be identified through CCSIDR(Cache Size ID=
 Registers)
> on ARMv7 Cortex implementations. It's better not to have these in DT =
if they can
> be identified runtime.
Sounds good to me. I'll go ahead an remove them.

	Thanks,
	S=C3=B6ren
