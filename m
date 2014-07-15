From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv5 0/2] add DT endianness binding support for regmap
Date: Tue, 15 Jul 2014 12:18:22 +0800
Message-ID: <1405397904-31202-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, mark.rutland@arm.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

Changes in V5:
- remove the register's dt endianness support for it will always be BE
  for now.
- only support the register values buffers dt endianness support.



Xiubo Li (2):
  regmap: add DT endianness binding support.
  dt/bindings: Add the DT binding documentation for endianness

 .../devicetree/bindings/regmap/regmap.txt          |  48 +++++++++
 drivers/base/regmap/regmap-i2c.c                   |   2 +
 drivers/base/regmap/regmap-spi.c                   |   2 +
 drivers/base/regmap/regmap.c                       | 117 +++++++++++++++++++--
 4 files changed, 158 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt

-- 
1.8.5
