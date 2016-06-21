From: andrej@inversepath.com
Subject: [PATCH 0/2] ARM: dts: imx53: add support for USB armory board
Date: Tue, 21 Jun 2016 16:50:51 +0200
Message-ID: <20160621145053.7742-1-andrej@inversepath.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Vagrant Cascadian <vagrant@debian.org>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrej Rosano <andrej@inversepath.com>

This two patches add support for the USB armory board.

The USB armory from Inverse Path is an open source hardware design,
implementing a flash drive sized computer:
https://inversepath.com/usbarmory

Andrej Rosano (2):
  devicetree: Add vendor prefix for Inverse Path
  ARM: dts: imx53: add support for USB armory board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx53-usbarmory.dts              | 239 +++++++++++++++++++++
 3 files changed, 241 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dts

-- 
2.9.0
