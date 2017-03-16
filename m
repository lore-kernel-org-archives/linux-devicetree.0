From: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v3] arm64: dts: ls1012a: add thermal monitor node
Date: Thu, 16 Mar 2017 03:13:58 +0000
Message-ID: <DB6PR0402MB2837D999F3B361EE2BA1D46CF3260@DB6PR0402MB2837.eurprd04.prod.outlook.com>
References: <1489561825-42670-1-git-send-email-andy.tang@nxp.com>
 <20170316031033.GY3618@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170316031033.GY3618@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Thursday, March 16, 2017 11:11 AM
> To: Andy Tang
> Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; catalin.marinas-5wv7dgnIgG8@public.gmane.org;
> will.deacon-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH v3] arm64: dts: ls1012a: add thermal monitor node
>=20
> On Wed, Mar 15, 2017 at 03:10:25PM +0800, Yuantian Tang wrote:
> > There is a thermal monitoring unit on ls1012a soc which can monitor
> > and record the temperature of cores so that appropriate actions can be
> > taken or alarm the user when the temperature exceeds a programmed
> > temperature threshold.
> >
> > Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> > ---
> > v3:
> > 	-- fix alignment and format issue
> > v2:
> > 	-- rebase to latest kernel
> >  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 76
> > ++++++++++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > index cffebb4..2cceefd 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > @@ -43,6 +43,7 @@
> >   */
> >
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >
> >  / {
> >  	compatible =3D "fsl,ls1012a";
> > @@ -127,6 +128,81 @@
> >  			clocks =3D <&sysclk>;
> >  		};
> >
> > +		tmu: tmu@1f00000 {
> > +			compatible =3D "fsl,qoriq-tmu";
> > +			reg =3D <0x0 0x1f00000 0x0 0x10000>;
> > +			interrupts =3D <0 33 0x4>;
> > +			fsl,tmu-range =3D <0xb0000 0x9002a 0x6004c 0x30062>;
> > +			fsl,tmu-calibration =3D <0x00000000 0x00000026
> > +					       0x00000001 0x0000002d
> > +					       0x00000002 0x00000032
> > +					       0x00000003 0x00000039
> > +					       0x00000004 0x0000003f
> > +					       0x00000005 0x00000046
> > +					       0x00000006 0x0000004d
> > +					       0x00000007 0x00000054
> > +					       0x00000008 0x0000005a
> > +					       0x00000009 0x00000061
> > +					       0x0000000a 0x0000006a
> > +					       0x0000000b 0x00000071
> > +
> > +					       0x00010000 0x00000025
> > +					       0x00010001 0x0000002c
> > +					       0x00010002 0x00000035
> > +					       0x00010003 0x0000003d
> > +					       0x00010004 0x00000045
> > +					       0x00010005 0x0000004e
> > +					       0x00010006 0x00000057
> > +					       0x00010007 0x00000061
> > +					       0x00010008 0x0000006b
> > +					       0x00010009 0x00000076
> > +
> > +					       0x00020000 0x00000029
> > +					       0x00020001 0x00000033
> > +					       0x00020002 0x0000003d
> > +					       0x00020003 0x00000049
> > +					       0x00020004 0x00000056
> > +					       0x00020005 0x00000061
> > +					       0x00020006 0x0000006d
> > +
> > +					       0x00030000 0x00000021
> > +					       0x00030001 0x0000002a
> > +					       0x00030002 0x0000003c
> > +					       0x00030003 0x0000004e>;
> > +			big-endian;
> > +			#thermal-sensor-cells =3D <1>;
> > +		};
> > +
> > +		thermal-zones {
> > +			cpu_thermal: cpu-thermal {
> > +				polling-delay-passive =3D <1000>;
> > +				polling-delay =3D <5000>;
> > +				thermal-sensors =3D <&tmu 0>;
>=20
> Please remember to have a newline between property list and child node.
> I fixed it up and applied the patch.
>=20
Thanks, Shawn. I will keep it in mind.

Regards,
Andy

> Shawn
>=20
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
> > +				};
> > +			};
> > +		};
> > +
> >  		i2c0: i2c@2180000 {
> >  			compatible =3D "fsl,vf610-i2c";
> >  			#address-cells =3D <1>;
> > --
> > 2.1.0.27.g96db324
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
