From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-imx: add imx pinctrl core driver
Date: Mon, 16 Apr 2012 11:47:14 +0800
Message-ID: <20120416034713.GB17173@shlinux2.ap.freescale.net>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <20120414134814.GA3852@pengutronix.de>
 <CAA+hA=T0FAfuGKcW0vAKO+OWyFdM-6vQqVo53xKf8y28m7gPOQ@mail.gmail.com>
 <20120415141736.GG24997@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120415141736.GG24997@S2101-09.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Dong Aisheng <dongas86@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 15, 2012 at 10:17:43PM +0800, Shawn Guo wrote:
> On Sun, Apr 15, 2012 at 11:49:04AM +0800, Dong Aisheng wrote:
> ...
> > >> +iomuxc@020e0000 {
> > >> + =A0 =A0 compatible =3D "fsl,imx6q-iomuxc";
> > >> + =A0 =A0 reg =3D <0x020e0000 0x4000>;
> > >> +
> > >> + =A0 =A0 /* shared pinctrl settings */
> > >> + =A0 =A0 usdhc4 {
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 pinctrl_usdhc4_1: usdhc4grp-1 {
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,pins =3D =A0 =A0 =A0=
"MX6Q_PAD_SD4_CMD",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_CLK",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT0",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT1",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT2",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT3",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT4",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT5",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT6",
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "MX6Q_PAD_SD4_DAT7";
> > >
> > > Do we really want to have all combinations of all pins in the dev=
icetree
> > > as strings? This is going to be huge.
> > >
> > Correct.
> > My plan is:
> > 1) not all combinations, just define frequently used ones since
> > it's hard to define all combinations groups for per based IMX.
> > (maybe we can try to add a fix-up function which can do minor chang=
es
> > based on available ones, then user does not need to write a new gro=
up
> > caused by only a small change.
> > what do you think?)
> >=20
> > 2)  When dt supports macro, will try convert string to integer macr=
o.
> > Then it maybe:
> > fsl,pins =3D <MX6Q_PAD_SD4_CMD 0
> >                 MX6Q_PAD_SD4_CLK 0
> >                 MX6Q_PAD_SD4_DAT0 1
> >                 .................>,
> > Why i did not start pin id with a raw integer is because it's less
> > meaning to user and
> > not easy to read in dts file.
> >=20
> We may want to use integer from the beginning to reduce the churn on
> driver later.
>=20
> I'm thinking about documenting the definition we used to have in
> iomux-mx*.h in the binding document and assign id to each of them
> in order.
>=20
> pinmux						id
> ------						--
> MX6Q_PAD_SD2_DAT1__USDHC2_DAT1			0
> MX6Q_PAD_SD2_DAT1__ECSPI5_SS0			1
> MX6Q_PAD_SD2_DAT1__WEIM_WEIM_CS_2		2
> ...
>=20
> The ordering between the list and imx6q_pin_regs[] array need to matc=
h.
>=20
> By looking at the binding document, we can just put pinmux-id into
> property "fsl,pins" (maybe rename it to "fsl,pinmux-ids") to get the
> desired pinmux settings.  With doing so, we can gain the following.
>=20
> 1) The pinmux-id can be used as index to locate the entry in array
>    imx6q_pin_regs[], so that the slow string lookup can be avoid.
>=20
> 2) Property "fsl,mux" can be dropped, as it's been encoded in
>    imx6q_pin_regs[] entry.
>=20
> 3) Converting the existing board files to device tree will be much
>    easier.  We only need to find the pinmux-id of those existing
>    definitions and put them in "fsl, pinmux-ids".
>=20
> 4) When DTC support macro, we can simply move the pinmux-id list from
>    binding document into dts file.  No driver change is needed at all=
=2E
>=20
> Thoughts?
>=20
Good suggestion.
I can do it and it's easy to change.
But as i said above, before the dtc macro support is available, the pin=
ctrl
setting in dts file will be hard to read since it's all raw data.
It becomes
fsl,pins =3D <1 2 3 4 5 6 ....>;
People have to search the binding doc to see what the data means.

The question is how long the dtc macro support will be available?
I'm very willing to do like as you said if it's just a short time.
But if it's long time, do we still want to lose the readability right n=
ow?

Regards
Dong Aisheng
