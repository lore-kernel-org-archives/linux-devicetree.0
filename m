From: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: ls1088a: Add TMU device tree support
Date: Fri, 12 May 2017 03:39:41 +0000
Message-ID: <HE1PR0402MB282834AD67FD94F694CFF64CF3E20@HE1PR0402MB2828.eurprd04.prod.outlook.com>
References: <1494489680-9544-1-git-send-email-andy.tang@nxp.com>
 <1494489680-9544-2-git-send-email-andy.tang@nxp.com>
 <20170512032931.GF8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170512032931.GF8471@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

OK, I thought it is in alphabet order. Will resend it.

Regards,
Andy

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Friday, May 12, 2017 11:30 AM
> To: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
> Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> catalin.marinas-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH] arm64: dts: ls1088a: Add TMU device tree support
>=20
> On Thu, May 11, 2017 at 04:01:20PM +0800, Yuantian Tang wrote:
> > Add nodes and properties for thermal management support.
> >
> > Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 89
> > ++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > index caecd14..53dc1c1 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > @@ -44,6 +44,7 @@
> >   *     OTHER DEALINGS IN THE SOFTWARE.
> >   */
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >
> >  / {
> >  	compatible =3D "fsl,ls1088a";
> > @@ -61,6 +62,7 @@
> >  			compatible =3D "arm,cortex-a53";
> >  			reg =3D <0x0>;
> >  			clocks =3D <&clockgen 1 0>;
> > +			#cooling-cells =3D <2>;
> >  		};
> >
> >  		cpu1: cpu@1 {
> > @@ -89,6 +91,7 @@
> >  			compatible =3D "arm,cortex-a53";
> >  			reg =3D <0x100>;
> >  			clocks =3D <&clockgen 1 1>;
> > +			#cooling-cells =3D <2>;
> >  		};
> >
> >  		cpu5: cpu@101 {
> > @@ -273,6 +276,92 @@
> >  			dma-coherent;
> >  			status =3D "disabled";
> >  		};
> > +
> > +		tmu: tmu@1f80000 {
>=20
> We sort the devices under simple-bus in order of unit-address.  Please
> respect the order when adding new devices.
>=20
> Shawn
>=20
> > +			compatible =3D "fsl,qoriq-tmu";
> > +			reg =3D <0x0 0x1f80000 0x0 0x10000>;
> > +			interrupts =3D <0 23 0x4>;
> > +			fsl,tmu-range =3D <0xb0000 0x9002a 0x6004c 0x30062>;
> > +			fsl,tmu-calibration =3D
> > +				/* Calibration data group 1 */
> > +				<0x00000000 0x00000026
> > +				0x00000001 0x0000002d
> > +				0x00000002 0x00000032
> > +				0x00000003 0x00000039
> > +				0x00000004 0x0000003f
> > +				0x00000005 0x00000046
> > +				0x00000006 0x0000004d
> > +				0x00000007 0x00000054
> > +				0x00000008 0x0000005a
> > +				0x00000009 0x00000061
> > +				0x0000000a 0x0000006a
> > +				0x0000000b 0x00000071
> > +				/* Calibration data group 2 */
> > +				0x00010000 0x00000025
> > +				0x00010001 0x0000002c
> > +				0x00010002 0x00000035
> > +				0x00010003 0x0000003d
> > +				0x00010004 0x00000045
> > +				0x00010005 0x0000004e
> > +				0x00010006 0x00000057
> > +				0x00010007 0x00000061
> > +				0x00010008 0x0000006b
> > +				0x00010009 0x00000076
> > +				/* Calibration data group 3 */
> > +				0x00020000 0x00000029
> > +				0x00020001 0x00000033
> > +				0x00020002 0x0000003d
> > +				0x00020003 0x00000049
> > +				0x00020004 0x00000056
> > +				0x00020005 0x00000061
> > +				0x00020006 0x0000006d
> > +				/* Calibration data group 4 */
> > +				0x00030000 0x00000021
> > +				0x00030001 0x0000002a
> > +				0x00030002 0x0000003c
> > +				0x00030003 0x0000004e>;
> > +			little-endian;
> > +			#thermal-sensor-cells =3D <1>;
> > +		};
> > +
> > +		thermal-zones {
> > +			cpu_thermal: cpu-thermal {
> > +				polling-delay-passive =3D <1000>;
> > +				polling-delay =3D <5000>;
> > +				thermal-sensors =3D <&tmu 0>;
> > +
> > +				trips {
> > +					cpu_alert: cpu-alert {
> > +						temperature =3D <85000>;
> > +						hysteresis =3D <2000>;
> > +						type =3D "passive";
> > +					};
> > +
> > +					cpu_crit: cpu-crit {
> > +						temperature =3D <95000>;
> > +						hysteresis =3D <2000>;
> > +						type =3D "critical";
> > +					};
> > +				};
> > +
> > +				cooling-maps {
> > +					map0 {
> > +						trip =3D <&cpu_alert>;
> > +						cooling-device =3D
> > +							<&cpu0
> THERMAL_NO_LIMIT
> > +
> 	THERMAL_NO_LIMIT>;
> > +					};
> > +
> > +					map1 {
> > +						trip =3D <&cpu_alert>;
> > +						cooling-device =3D
> > +							<&cpu4
> THERMAL_NO_LIMIT
> > +
> 	THERMAL_NO_LIMIT>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  	};
> >
> >  };
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
