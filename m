From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
Date: Tue, 18 Jun 2019 09:54:55 +1200
Message-ID: <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The 98DX1135 is similar to the 98DX4122 except the MPP options differ.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../pinctrl/marvell,kirkwood-pinctrl.txt      | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-p=
inctrl.txt
index 6c0ea155b708..2932f171ee85 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.=
txt
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,kirkwood-pinctrl.=
txt
@@ -6,8 +6,8 @@ part and usage.
 Required properties:
 - compatible: "marvell,88f6180-pinctrl",
               "marvell,88f6190-pinctrl", "marvell,88f6192-pinctrl",
-              "marvell,88f6281-pinctrl", "marvell,88f6282-pinctrl"
-              "marvell,98dx4122-pinctrl"
+              "marvell,88f6281-pinctrl", "marvell,88f6282-pinctrl",
+              "marvell,98dx4122-pinctrl", "marvell,98dx1135-pinctrl"
 - reg: register specifier of MPP registers
=20
 This driver supports all kirkwood variants, i.e. 88f6180, 88f619x, and 8=
8f628x.
@@ -317,3 +317,43 @@ mpp44         44       gpio
 mpp45         45       gpio
 mpp49         49       gpio
=20
+* Marvell Poncat2 98dx1135
+
+name          pins     functions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+mpp0          0        gpio, nand(io2), spi(cs)
+mpp1          1        gpo, nand(io3), spi(mosi)
+mpp2          2        gpo, nand(io4), spi(sck)
+mpp3          3        gpo, nand(io5), spi(miso)
+mpp4          4        gpio, nand(io6), uart0(rxd)
+mpp5          5        gpo, nand(io7), uart0(txd)
+mpp6          6        sysrst(out)
+mpp7          7        gpo, spi(cs)
+mpp8          8        gpio, twsi0(sda), uart1(rts)
+mpp9          9        gpio, twsi(sck), uart1(cts)
+mpp10         10       gpo, uart0(txd)
+mpp11         11       gpio, uart0(rxd)
+mpp13         13       gpio, uart1(txd)
+mpp14         14       gpio, uart1(rxd)
+mpp15         15       gpio, uart0(rts)
+mpp16         16       gpio, uart0(cts)
+mpp17         17       gpio, nand(cle)
+mpp18         18       gpo, nand(io0)
+mpp19         19       gpo, nand(io1)
+mpp20         20       gpio
+mpp21         21       gpio
+mpp22         22       gpio
+mpp23         23       gpio
+mpp24         24       gpio
+mpp25         25       gpio
+mpp26         26       gpio
+mpp27         27       gpio
+mpp28         28       gpio, nand(ren)
+mpp29         29       gpio, nand(wen)
+mpp30         30       gpio
+mpp31         31       gpio
+mpp32         32       gpio
+mpp33         33       gpio
+mpp34         34       gpio, nand(ale)
+mpp35         35       gpio, nand(cen)
--=20
2.21.0
