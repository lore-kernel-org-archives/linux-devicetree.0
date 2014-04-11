From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RESEND 5/5] ARM: dts: berlin: add the pinctrl node and
 muxing setup for uarts
Date: Fri, 11 Apr 2014 11:09:36 +0200
Message-ID: <20140411090936.GC20147@kwain>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397135274-10764-6-git-send-email-antoine.tenart@free-electrons.com>
 <20140411081859.GL10240@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140411081859.GL10240-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Fri, Apr 11, 2014 at 10:18:59AM +0200, Andrew Lunn wrote:
> On Thu, Apr 10, 2014 at 03:07:54PM +0200, Antoine T=E9nart wrote:
> > The uart0 pinmux configuration is in the dtsi because uart0 will al=
ways
> > use uart0-pmux to work, no other possibility. Same thing for uart1.
> >=20
> > Signed-off-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/berlin2.dtsi   | 20 ++++++++++++++++++++
> >  arch/arm/boot/dts/berlin2cd.dtsi | 13 +++++++++++++
> >  arch/arm/boot/dts/berlin2q.dtsi  | 20 ++++++++++++++++++++
> >  3 files changed, 53 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/ber=
lin2.dtsi
> > index 56a1af2f1052..43eb90c36050 100644
> > --- a/arch/arm/boot/dts/berlin2.dtsi
> > +++ b/arch/arm/boot/dts/berlin2.dtsi
> > @@ -176,6 +176,22 @@
> >  			};
> >  		};
> > =20
> > +		pinctrl: pinctrl@0 {
> > +			compatible =3D "marvell,berlin2-pinctrl";
> > +			reg =3D <0xea0000 0x08>, <0xfc0000 0x44>;
> > +			reg-names =3D "global_base", "apb_base";
> > +
> > +			uart0_pmux: uart0-pmux {
> > +				berlin,group =3D "GSM4";
> > +				berlin,function =3D <0>;
> > +			};
> > +
> > +			uart1_pmux: uart1-pmux {
> > +				berlin,group =3D "GSM5";
> > +				berlin,function =3D <1>;
>=20
> Hi Antoine
>=20
> This very much looks like black magic.
>=20
> I assume the data sheet is not available? So i think you need to
> document all possible combinations of values of group and function.
> Maybe you can add a file in
>=20
> arch/arm/boot/dts/include/dt-bindings/pinctrl/
>=20
> with something like
>=20
> #define GSM4_UART0	0
> #define GSM5_UART1	1
> #define GSM12_UART0	1
> #define GSM12_IrDA0	1
> #define GSM12_GPIO	2

Groups' functions are not the same between BG2/BG2CD and BG2Q so multip=
le
headers would be needed which may not be a good thing. Some platforms u=
se black
magic, and we can find a pinmux configuration for OMAP looking like:

0x128 (PIN_INPUT_PULLUP | MUX_MODE0)

Weel, we could explicitly define the functions in the driver itself and=
 use in
the dt something like:

berlin,group =3D "GSM4";
berlin,function =3D "uart0";

This is what's done on the sunxi's pinctrl.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
