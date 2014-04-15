From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: add GPIO nodes for the BG2Q
Date: Tue, 15 Apr 2014 11:35:49 +0200
Message-ID: <20140415093549.GD4584@kwain>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397549245-3338-3-git-send-email-antoine.tenart@free-electrons.com>
 <534CFA77.9030108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <534CFA77.9030108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sebastian,

On Tue, Apr 15, 2014 at 11:23:03AM +0200, Sebastian Hesselbarth wrote:
> On 04/15/2014 10:07 AM, Antoine T=C3=A9nart wrote:

[=E2=80=A6]

> >diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/ber=
lin2q.dtsi
> >index e6e556055dfc..b2625f896bc5 100644
> >--- a/arch/arm/boot/dts/berlin2q.dtsi
> >+++ b/arch/arm/boot/dts/berlin2q.dtsi
> >@@ -109,6 +109,78 @@
> >  			ranges =3D <0 0xe80000 0x10000>;
> >  			interrupt-parent =3D <&aic>;
> >
> >+			gpio0: gpio@0400 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0x0400 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				porta: gpio-controller@0 {
>=20
> ePAPR recommended name is even more generic, i.e. "gpio". If
> that clashed in any way with other numbered names, I suggest
> to rename to "gpio-port" as actually the controller is the
> parent node and this represents one port (in the nomenclature
> of DW-APB-GPIO).

I followed the dwapb GPIO binding documentation, but I think this is a =
good
idea. I'll update.

> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
>=20
> 32 gpio pins for each of the 6 GPIO controllers? Either BG2Q is a GPI=
O
> beast or it is a mistake :P
>=20
> Can you please double-check?

Maybe Jisheng can confirm this.

> I am fine with using nr-gpios property now, but I guess BG2Q also
> has that CONFIG[1,2] registers to actually read out the features
> synthesized in? If I find some time, I'll prepare a patch for
> dw-apb-gpio to exploit that (optional) information instead of
> using nr-gpios.

Maybe, that would be nice.


Antoine

> Otherwise,
>=20
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> >+					reg =3D <0>;
> >+					interrupt-controller;
> >+					#interrupt-cells =3D <2>;
> >+					interrupts =3D <0>;
> >+				};
> >+			};
> >+
> >+			gpio1: gpio@0800 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0x0800 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				portb: gpio-controller@1 {
> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
> >+					reg =3D <0>;
> >+					interrupt-controller;
> >+					#interrupt-cells =3D <2>;
> >+					interrupts =3D <1>;
> >+				};
> >+			};
> >+
> >+			gpio2: gpio@0c00 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0x0c00 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				portc: gpio-controller@2 {
> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
> >+					reg =3D <0>;
> >+					interrupt-controller;
> >+					#interrupt-cells =3D <2>;
> >+					interrupts =3D <2>;
> >+				};
> >+			};
> >+
> >+			gpio3: gpio@1000 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0x1000 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				portd: gpio-controller@3 {
> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
> >+					reg =3D <0>;
> >+					interrupt-controller;
> >+					#interrupt-cells =3D <2>;
> >+					interrupts =3D <3>;
> >+				};
> >+			};
> >+
> >  			timer0: timer@2c00 {
> >  				compatible =3D "snps,dw-apb-timer";
> >  				reg =3D <0x2c00 0x14>;
> >@@ -181,6 +253,36 @@
> >  				interrupt-parent =3D <&gic>;
> >  				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> >  			};
> >+
> >+			gpio4: gpio@5000 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0x5000 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				porte: gpio-controller@4 {
> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
> >+					reg =3D <0>;
> >+				};
> >+			};
> >+
> >+			gpio5: gpio@c000 {
> >+				compatible =3D "snps,dw-apb-gpio";
> >+				reg =3D <0xc000 0x400>;
> >+				#address-cells =3D <1>;
> >+				#size-cells =3D <0>;
> >+
> >+				portf: gpio-controller@5 {
> >+					compatible =3D "snps,dw-apb-gpio-port";
> >+					gpio-controller;
> >+					#gpio-cells =3D <2>;
> >+					snps,nr-gpios =3D <32>;
> >+					reg =3D <0>;
> >+				};
> >+			};
> >  		};
> >
> >  		pinctrl: pinctrl@0 {
> >
>=20

--=20
Antoine T=C3=A9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
