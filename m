From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Thu, 10 Oct 2019 07:31:29 +0200
Message-ID: <20191010073129.607f7b6f@kemnade.info>
References: <20190930194332.12246-1-andreas@kemnade.info>
        <20190930194332.12246-3-andreas@kemnade.info>
        <20191006223848.GE19803@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006223848.GE19803@latitude>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Marco Felsch <m.felsch@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Mon, 7 Oct 2019 00:38:48 +0200
Jonathan Neusch=E4fer <j.neuschaefer@gmx.net> wrote:

> Thanks for CCing me on this patchset. Nice to see more e-book reader
> related work!
>=20
btw. seems that we have a common target, since our ebook readers both
have a tps65185. It seems to be a good idea to comment things on the
i2c busses without proper bindings. That might help to find allies.

I will send a v3 with correct memory, better name for GLED
and the above-mentioned comments.

Regards,
Andreas

> A few comments and questions below.
>=20
> On Mon, Sep 30, 2019 at 09:43:31PM +0200, Andreas Kemnade wrote:
> > The Netronix board E60K02 can be found some several Ebook-Readers,
> > at least the Kobo Clara HD and the Tolino Shine 3. The board
> > is equipped with different SoCs requiring different pinmuxes. =20
>=20
> Do I understand it correctly that i.MX6SL and i.MX6SLL are pin-
> compatible so we can use the same pin numbers and GPIO handles in the
> DT?
>=20
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_led>;
> > +
> > +		GLED { =20
>=20
> What does "GLED" mean? It's not obvious to me.
> What user-visible purpose does this LED have, or where is it on the
> board?
>=20
> > +			gpios =3D <&gpio5 7 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger =3D "timer";
> > +		};
> > +	};
> > +
> > +	memory {
> > +		reg =3D <0x80000000 0x80000000>; =20
>=20
> 2 GiB of memory?
>=20
> > +			/* Core3_3V3 */ =20
>=20
> What are these labels (Core3_3V3, Core4_1V2, etc.)?
>=20
> > +			dcdc2_reg: DCDC2 {
> > +				regulator-name =3D "DCDC2";
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-max-microvolt =3D <3300000>;
> > +					regulator-suspend-min-microvolt =3D <3300000>;
> > +				};
> > +			}; =20
>=20
>=20
> Thanks,
> Jonathan Neusch=E4fer
