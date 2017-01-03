From: Troy Jia <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2] arm64:dt:ls1046a: Add TMU device tree support for
 LS1046A
Date: Tue, 3 Jan 2017 06:44:18 +0000
Message-ID: <AM4PR0401MB1843A7A90B448EC9EC72C320EB6E0@AM4PR0401MB1843.eurprd04.prod.outlook.com>
References: <1481167706-44234-1-git-send-email-hongtao.jia@nxp.com>
 <20170102062433.GA20956@dragon>
 <AM4PR0401MB1843C415E2CF7D58BD5A1064EB6E0@AM4PR0401MB1843.eurprd04.prod.outlook.com>
 <20170103062633.GR20956@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103062633.GR20956@dragon>
Content-Language: zh-CN
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>, "edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Y.T. Tang" <yuantian.tang-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>=20
> On Tue, Jan 03, 2017 at 03:49:33AM +0000, Troy Jia wrote:
> > > > @@ -279,6 +282,82 @@
> > > >  			clocks =3D <&sysclk>;
> > > >  		};
> > > >
> > > > +		tmu: tmu@1f00000 {
> > > > +			compatible =3D "fsl,qoriq-tmu";
> > > > +			reg =3D <0x0 0x1f00000 0x0 0x10000>;
> > > > +			interrupts =3D <0 33 0x4>;
> > > > +			fsl,tmu-range =3D <0xb0000 0x9002a 0x6004c 0x30062>;
> > > > +			fsl,tmu-calibration =3D <0x00000000 0x00000026
> > > > +					       0x00000001 0x0000002d
> > > > +					       0x00000002 0x00000032
> > > > +					       0x00000003 0x00000039
> > > > +					       0x00000004 0x0000003f
> > > > +					       0x00000005 0x00000046
> > > > +					       0x00000006 0x0000004d
> > > > +					       0x00000007 0x00000054
> > > > +					       0x00000008 0x0000005a
> > > > +					       0x00000009 0x00000061
> > > > +					       0x0000000a 0x0000006a
> > > > +					       0x0000000b 0x00000071
> > > > +
> > >
> > > Instead of a newline, can we have a single line comment here to tell
> > > how these calibration data is grouped?
> >
> > Each group represent one temperature range. It's a good idea to add com=
ment
> here.
> > Could I just add one comment like below to clarify all four groups?
> > /* Each calibration data group represent one temperature range. There
> > are four ranges in total */
>=20
> Probably the following form?
>=20
> 	/* Calibration data group 1 */
> 	...
> 	/* Calibration data group 2 */
> 	...
> 	/* Calibration data group 3 */
> 	...
> 	/* Calibration data group 4 */
> 	...
>=20

It's good for me.

>=20
> >
> > >
> > > > +					       0x00010000 0x00000025
> > > > +					       0x00010001 0x0000002c
> > > > +					       0x00010002 0x00000035
> > > > +					       0x00010003 0x0000003d
> > > > +					       0x00010004 0x00000045
> > > > +					       0x00010005 0x0000004e
> > > > +					       0x00010006 0x00000057
> > > > +					       0x00010007 0x00000061
> > > > +					       0x00010008 0x0000006b
> > > > +					       0x00010009 0x00000076
> > > > +
> > > > +					       0x00020000 0x00000029
> > > > +					       0x00020001 0x00000033
> > > > +					       0x00020002 0x0000003d
> > > > +					       0x00020003 0x00000049
> > > > +					       0x00020004 0x00000056
> > > > +					       0x00020005 0x00000061
> > > > +					       0x00020006 0x0000006d
> > > > +
> > > > +					       0x00030000 0x00000021
> > > > +					       0x00030001 0x0000002a
> > > > +					       0x00030002 0x0000003c
> > > > +					       0x00030003 0x0000004e>;
> > > > +			big-endian;
> > > > +			#thermal-sensor-cells =3D <1>;
> > > > +		};
> > > > +
> > > > +		thermal-zones {
> > > > +			cpu_thermal: cpu-thermal {
> > > > +				polling-delay-passive =3D <1000>;
> > > > +				polling-delay =3D <5000>;
> > > > +
> > >
> > > We usually do not have newline between properties but nodes, or
> > > between property list and child node.
> >
> > I just follow the style of thermal binding of
> > Documentation/devicetree/bindings/thermal/thermal.txt.
>=20
> Different subsystem or binding examples use different style, but when we =
put
> things together in the platform dts, we would like to have them in a unif=
ied style.

Good point here.
I will fix it and send the new version.

Thanks.
-Hongtao.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
