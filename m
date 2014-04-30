From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv3 0/2] add DT endianness binding support
Date: Wed, 30 Apr 2014 12:43:47 +0800
Message-ID: <1398833029-29546-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: mark.rutland@arm.com, broonie@kernel.org
Cc: gregkh@linuxfoundation.org, mpa@pengutronix.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

Changes in V3:
- Follow Mark Rutland's advice.
- Document common case of the endianess usage.

Changes in V2:
- Namespace the properties using the prefix sring.
- Add one binding ducomentation off regmap.

Xiubo Li (2):
  dt/bindings: Add the DT binding documentation for endianness
  regmap: add DT endianness binding support.

 .../devicetree/bindings/endianness/endianness.txt  |  47 +++++++
 drivers/base/regmap/regmap-i2c.c                   |   2 +
 drivers/base/regmap/regmap-spi.c                   |   2 +
 drivers/base/regmap/regmap.c                       | 147 +++++++++++++++++++--
 4 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/endianness/endianness.txt

-- 
1.8.4

