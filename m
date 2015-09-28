From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/11] Hi Maxime / Patrice / Srini,
Date: Mon, 28 Sep 2015 16:47:01 +0100
Message-ID: <20150928154701.GT27197@x1>
References: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
 <20150928153938.GS27197@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150928153938.GS27197@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Sep 2015, Lee Jones wrote:

> On Mon, 28 Sep 2015, Peter Griffin wrote:
>=20
> > This series makes a series of updates to the stih407 pinctrl groups
> > and makes the upstream kernel more closely aligned in terms of pin
> > configuration to the vendor kernel.
> >=20
> > A number of new periphs are added such as spi fsm, nand, cec0, and
> > for others such as SPI the various alternate function pin muxings h=
ave
> > been added. Finally for SPI the controller nodes have been updated
> > to have the default pin assignment in the controller node.
> >=20
> > Changes since v1:
> >  - Rebase on v4.3-rc3
> >  - Remove some SoBs (Lee)
> >  - Collect up Acks
> >=20
> > kind regards,
> >=20
> > Peter.
> >=20
> > Peter Griffin (11):
> >   ARM: STi: DT: STiH407: Add a cec0 pin definition
> >   ARM: STi: DT: STiH407: Add i2c3 alternate pin configs
> >   ARM: DT: STiH407: Add SPI 3 wire and 4 wire pinctrl configs
> >   ARM: DT: STiH407: Add serial3 pinctrl configuration
> >   ARM: DT: STiH407: Add SPI FSM (NOR Flash) Controller pin config
> >   ARM: DT: STiH407: Add NAND flash controller pin configuration
> >   ARM: DT: STiH407: Add systrace pin configuration
> >   ARM: DT: STiH407: Add SD pinctrl config for mmc0 controller
> >   ARM: DT: STiH407: Add pinconfig for IRB UHF and IRB TX
> >   ARM: DT: STiH407: Add RMII pinctrl support
> >   ARM: STi: STiH407: Add spi default pinctrl groups.
> >=20
> >  arch/arm/boot/dts/stih407-family.dtsi  |  14 ++
> >  arch/arm/boot/dts/stih407-pinctrl.dtsi | 378 +++++++++++++++++++++=
+++++++++++-
> >  2 files changed, 387 insertions(+), 5 deletions(-)
>=20
> I'll do this privately, so as not to unnecessarily delay the
> acceptance of the set.

Whoops!  Fingers faster than brain.  Sorry folks.

Maxime,
  Please do not slow up the acceptance of this set due to my comments.

> I'm a big fan of keeping the *-by's in chronological order.  It does
> help to provide an insight to the history of the patch.


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
