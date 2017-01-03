From: Troy Jia <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH V2] arm64:dts:ls1046a: Add TMU device tree support
Date: Tue, 3 Jan 2017 07:55:49 +0000
Message-ID: <AM4PR0401MB1843CEA41B976C48E97BC3C6EB6E0@AM4PR0401MB1843.eurprd04.prod.outlook.com>
References: <1483425739-15404-1-git-send-email-hongtao.jia@nxp.com>
 <20170103070607.GW20956@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103070607.GW20956@dragon>
Content-Language: zh-CN
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Y.T. Tang" <yuantian.tang-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Subject: Re: [PATCH V2] arm64:dts:ls1046a: Add TMU device tree support
>=20
> On Tue, Jan 03, 2017 at 02:42:19PM +0800, Jia Hongtao wrote:
> > Also add nodes and properties for thermal management support.
> >
> > Signed-off-by: Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
>=20
> The subject prefix is still not so right.  There should be a space after =
each colon.

Sorry. I will fix it.

>=20
> > ---
> > Changes for V2:
> > * Update the subject title according to Shawn Guo's comment.
> > * Add comments for calibration data groups.
> > * Update "thermal-zones" property in a unified style with platform dts.
> >
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 83
> > ++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > index 38806ca..df53a4a 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > @@ -45,6 +45,7 @@
> >   */
> >
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >
> >  / {
> >  	compatible =3D "fsl,ls1046a";
> > @@ -67,6 +68,7 @@
> >  			clocks =3D <&clockgen 1 0>;
> >  			next-level-cache =3D <&l2>;
> >  			cpu-idle-states =3D <&CPU_PH20>;
> > +			#cooling-cells =3D <2>;
> >  		};
> >
> >  		cpu1: cpu@1 {
> > @@ -279,6 +281,87 @@
> >  			clocks =3D <&sysclk>;
> >  		};
> >
> > +		tmu: tmu@1f00000 {
> > +			compatible =3D "fsl,qoriq-tmu";
> > +			reg =3D <0x0 0x1f00000 0x0 0x10000>;
> > +			interrupts =3D <0 33 0x4>;
> > +			fsl,tmu-range =3D <0xb0000 0x9002a 0x6004c 0x30062>;
> > +			fsl,tmu-calibration =3D
> > +				/* Calibration data group 1*/
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
> > +
> > +				/* Calibration data group 2*/
>=20
> The single line comment format is /* blabla */.  There are space at both =
beginning
> and end of the text.

Will fix.

>=20
> Also I am asking that we use the single line comment to replace the blank=
 line,
> which is still there.

I think keeping the newline makes it more clear in structure. But I also un=
derstand
your point - no newline inside one property, right? If so I will delete the=
 newline.

-Hongtao.

>=20
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
> > +
> > +				/* Calibration data group 3*/
> > +				0x00020000 0x00000029
> > +				0x00020001 0x00000033
> > +				0x00020002 0x0000003d
> > +				0x00020003 0x00000049
> > +				0x00020004 0x00000056
> > +				0x00020005 0x00000061
> > +				0x00020006 0x0000006d
> > +
> > +				/* Calibration data group 4*/
> > +				0x00030000 0x00000021
> > +				0x00030001 0x0000002a
> > +				0x00030002 0x0000003c
> > +				0x00030003 0x0000004e>;
>=20
> Here is the format on my mind:
>=20
> 			fsl,tmu-calibration =3D <
> 				/* Calibration data group 1 */
> 				0x00000000 0x00000026
> 				0x00000001 0x0000002d
> 				0x00000002 0x00000032
> 				0x00000003 0x00000039
> 				0x00000004 0x0000003f
> 				0x00000005 0x00000046
> 				0x00000006 0x0000004d
> 				0x00000007 0x00000054
> 				0x00000008 0x0000005a
> 				0x00000009 0x00000061
> 				0x0000000a 0x0000006a
> 				0x0000000b 0x00000071
> 				/* Calibration data group 2 */
> 				0x00010000 0x00000025
> 				0x00010001 0x0000002c
> 				0x00010002 0x00000035
> 				0x00010003 0x0000003d
> 				0x00010004 0x00000045
> 				0x00010005 0x0000004e
> 				0x00010006 0x00000057
> 				0x00010007 0x00000061
> 				0x00010008 0x0000006b
> 				0x00010009 0x00000076
> 				/* Calibration data group 3 */
> 				0x00020000 0x00000029
> 				0x00020001 0x00000033
> 				0x00020002 0x0000003d
> 				0x00020003 0x00000049
> 				0x00020004 0x00000056
> 				0x00020005 0x00000061
> 				0x00020006 0x0000006d
> 				/* Calibration data group 4 */
> 				0x00030000 0x00000021
> 				0x00030001 0x0000002a
> 				0x00030002 0x0000003c
> 				0x00030003 0x0000004e
> 			>;
>=20
> Shawn
>=20
> > +			big-endian;
> > +			#thermal-sensor-cells =3D <1>;
> > +		};
> > +
> > +		thermal-zones {
> > +			cpu_thermal: cpu-thermal {
> > +				polling-delay-passive =3D <1000>;
> > +				polling-delay =3D <5000>;
> > +				thermal-sensors =3D <&tmu 3>;
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
> > +							THERMAL_NO_LIMIT>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  		dspi: dspi@2100000 {
> >  			compatible =3D "fsl,ls1021a-v1.0-dspi";
> >  			#address-cells =3D <1>;
> > --
> > 2.1.0.27.g96db324
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
