From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/5] R-Car D3 (r8a77995) I2C integration
Date: Mon, 29 Jan 2018 16:45:43 +0100
Message-ID: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@linux-m68k.org, kieran.bingham@ideasonboard.com
Cc: wsa@the-dreams.de, magnus.damm@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi!

This adds I2C controllers to the D3 device tree and enables I2C busses 0
and 1 on the Draak board. (I2C2 is not connected on that board.)

This revision addresses Geert's review comments and adds Reviewed-Bys.
See below for details.

CU
Uli


Changes since v1:
- pinctrl: patch dropped, has been picked up
- i2c-rcar: patch dropped, redundant
- dtsi: added dmac2 for i2c0-2
- dtsi: fixed internal SCL delays
- dts: fixed EEPROM compatible string
- bindings: added Rohm EEPROM
- bindings: fixed typo in i2c-rcar bindings


Ulrich Hecht (5):
  arm64: renesas: r8a77995: add I2C support
  arm64: renesas: draak: enable I2C controller 0 and EEPROM
  arm64: renesas: draak: enable I2C controller 1
  i2c: rcar: document R8A77995 bindings
  dt-bindings: at24: add bindings for Rohm BR24T01

 Documentation/devicetree/bindings/eeprom/at24.txt  |  2 +
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |  1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     | 28 +++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 67 ++++++++++++++++++++++
 4 files changed, 98 insertions(+)

-- 
2.7.4
