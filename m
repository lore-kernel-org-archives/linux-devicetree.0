From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add reset-gpio-active-high boolean
 property to DT
Date: Mon, 11 Apr 2016 08:38:10 -0500
Message-ID: <20160411133810.GA15094@rob-hp-laptop>
References: <1459936100.2256.30.camel@pengutronix.de>
 <1459946207-11923-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459946207-11923-1-git-send-email-ynezz@true.cz>
Sender: linux-pci-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Richard Zhu <Richard.Zhu@freescale.com>, Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Fabio Estevam <festevam@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

On Wed, Apr 06, 2016 at 02:36:47PM +0200, Petr =C5=A0tetiar wrote:
> Currently the reset-gpio DT property which controls the PCI bus devic=
e
> reset signal defaults to active-low reset sequence (L=3Dreset state,
> H=3Doperation state) plus the code in reset function isn't GPIO polar=
ity
> aware - it doesn't matter if the defined reset-gpio is active-low or
> active-high, it will always result into active-low reset sequence.
>=20
> I've tried to fix it properly and changed the reset-gpio reset sequen=
ce
> to be polarity aware, but this patch has been accepted and then rever=
ted
> as it has introduced few backward incompatible issues:
>=20
> 1. Some of the DTBs as for example imx6qdl-sabresd, doesn't define
> reset-gpio polarity correctly:
>=20
>   reset-gpio =3D <&gpio7 12 0>;
>=20
> which means, that it's defined as active-high, but in reality it's
> active-low, thus it wouldn't work without DTS fix.
>=20
> 2. The logic in reset function is inverted:
>=20
> 	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0)
> 	msleep(100);
> 	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 1);
>=20
> so even if some of the i.MX6 boards had reset-gpio polarity defined
> correctly in their DTSes, they would stop working.
>=20
> As we can't break old DTBs, we can't fix them and that's why we need =
to
> introduce this new DT reset-gpio-active-high boolean property, so we =
can
> support boards with active-high reset sequence.
>=20
> This active-high reset sequence is for example needed on Apalis SoMs,
> where GPIO1_IO28, used to PCIe reset is not connected directly to PER=
ST#
> PCIe signal, but it's ORed with RESETBMCU coming off the PMIC, and th=
us
> is inverted, active-high.
>=20
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>  Changes since v1:
>=20
>   * Added documentation of reset-gpio and reset-gpio-active-high DT p=
roperties
>   * Removed unnecessary double negation of GPIO value
>=20
>  Changes since v2:
>=20
>   * Changed commit message so it explains in more detail why we need =
new DT
>     property
>   * Changed PHY to 'bus device' in binding's documentation
>=20
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt |  6 ++++++
>  drivers/pci/host/pci-imx6.c                              | 14 ++++++=
+++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
