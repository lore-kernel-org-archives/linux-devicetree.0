From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 15/15] arm64: dts: marvell: Convert 7k/8k usb-phy
 properties to phy-supply
Date: Tue, 2 Apr 2019 21:35:26 +0200
Message-ID: <CAFBinCDG5vpSpvq=1XUZzu7RA-pDEcEqgrPr65BZ5esuGyGPjA@mail.gmail.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
 <20190401165131.23370-16-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-16-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,

thank you for keeping me in the loop!

On Mon, Apr 1, 2019 at 6:52 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Update Aramda 7k/8k DTs to use the phy-supply property of the (recent)
> generic PHY framework instead of the (legacy) usb-phy preperty. Both
> enable the supply when the PHY is enabled.
>
> The COMPHY nodes only provide SERDES lanes configuration. The power
> supply that is represented by the phy-supply property is just a
> regulator wired to the USB connector, hence the creation of connector
> nodes as child of the COMPHY nodes and the supply attached to it.
shouldn't this also be reflected in the dt-bindings?

> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../arm64/boot/dts/marvell/armada-7040-db.dts | 26 ++++++++++---------
>  .../marvell/armada-8040-clearfog-gt-8k.dts    | 13 +++++-----
>  .../arm64/boot/dts/marvell/armada-8040-db.dts | 13 +++++-----
>  .../boot/dts/marvell/armada-8040-mcbin.dtsi   | 13 +++++-----
>  4 files changed, 35 insertions(+), 30 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> index 131ce4229db0..4b8df359b1cc 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -45,16 +45,6 @@
>                 enable-active-high;
>                 gpio = <&expander0 1 GPIO_ACTIVE_HIGH>;
>         };
> -
> -       cp0_usb3_0_phy: cp0-usb3-0-phy {
> -               compatible = "usb-nop-xceiv";
> -               vcc-supply = <&cp0_reg_usb3_0_vbus>;
> -       };
> -
> -       cp0_usb3_1_phy: cp0-usb3-1-phy {
> -               compatible = "usb-nop-xceiv";
> -               vcc-supply = <&cp0_reg_usb3_1_vbus>;
> -       };
>  };
>
>  &i2c0 {
> @@ -200,15 +190,27 @@
>         };
>  };
>
> +&cp0_comphy1 {
> +       cp0_usbh0_con: connector {
> +               compatible = "usb-a-connector";
> +               phy-supply = <&cp0_reg_usb3_0_vbus>;
> +       };
> +};
(disclaimer: I don't have any board with a marvell SoC, so I don't
understand how it works and I can't debug it)
I know about the "phy-supply" property inside the PHY node itself
(that would be cp0_comphy1 in this case).
The connector binding does not mention a phy-supply property:
Documentation/devicetree/bindings/connector/usb-connector.txt

I don't understand which driver enables the phy-supply when it's part
of a "connector" child-node.
do you have a hint where I should start looking?


Regards
Martin
