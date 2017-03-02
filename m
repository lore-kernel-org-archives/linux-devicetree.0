From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: Renesas RZ/A1 pin and gpio controller
Date: Thu, 2 Mar 2017 20:16:51 +0000
Message-ID: <SG2PR06MB1165E84107B921961C4C0C2E8A280@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Monday, February 20, 2017, Jacopo Mondi wrote:
> Hello,
>    this is the first submission of combined GPIO and pin controller drive=
r
> for Renesas RZ/A1 SoC.
>=20
> Compared to my RFC series on the same subject, this new implementation
> supports a single SoC. If more devices with a similar pin controller will
> arrive later, we will consider supporting them through this driver.
>=20
> The series adds the driver itself and register the pincontroller in dtsi.
> The pin controller hardware supports 12 ports, each of them is also a gpi=
o
> controller.
>=20
> The series makes use of pinctrl and pinmux generic function currently
> available in Linus Walleij's linux-pinctrl.git tree.
>=20
> Testing done veryfing functionalities of hardware modules enabled in
> device tree (SCIF2 for serial output, RIIC for accessing an internal
> eeprom chip and user visible leds).
> Gpio have been also verified using a i2c-gpio device in place of the
> native RIIC one to access the same eeprom device.


Functionally, I tested these patches on an RZ/A1H RSK board (after modifyin=
g the DT for the RSK vs the GENMAI board).

The following worked fine:
 * SCIF
 * I2C
 * SDHI
 * Ethernet

  (The trick is you have to know what pins need to be set as bi-directional=
)


I will look over the code and provide feedback separately.

Cheers

Chris
