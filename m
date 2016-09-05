From: andrej@inversepath.com
Subject: [PATCH v3 0/2] imx53: add support for USB armory board
Date: Mon,  5 Sep 2016 12:11:15 +0200
Message-ID: <20160905101117.27473-1-andrej@inversepath.com>
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
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Vagrant Cascadian <vagrant@debian.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrej Rosano <andrej@inversepath.com>

This patchset add the support for USB armory board:
https://inversepath.com/usbarmory

v3: Changes proposed by Shawn Guo <shawnguo@kernel.org>
- various fixes in dts file

v2: Changes proposed by Shawn Guo <shawnguo@kernel.org>
- re-licensing dts to dual GPL/X11 license
- various fixes in dts file

Andrej Rosano (2):
  devicetree: Add vendor prefix for Inverse Path
  ARM: dts: imx53: add support for USB armory board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx53-usbarmory.dts              | 224 +++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dts

-- 
2.9.3
