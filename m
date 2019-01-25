From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 12:55:10 +0000
Message-ID: <20190125125513.23656-1-ccaione@baylibre.com>
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
To: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, aisheng.dong@nxp.com, abailon@baylibre.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

SmartEEE, compatible with IEEE802.3az standard, is designed to include
legacy MAC without EEE capability into the power saving system. SmartEEE 
is enabled by default configuration on AR8031 after power-on or hardware 
reset.

Unfortunately this is proved causing issues for certain hw 
configurations.  We add a quirk to optionally disable SmartEEE.

PATCH 3/3 depends on https://patchwork.kernel.org/patch/10781297/


Carlo Caione (3):
  net: phy: at803x: Introduce quirk to disable SmartEEE
  dt-bindings: net: at803x: Document at803x,smarteee-disabled property
  arm64: dts: imx8mq-evk: Disable SmartEEE

 .../devicetree/bindings/net/at803x.txt        | 18 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  1 +
 drivers/net/phy/at803x.c                      | 22 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/at803x.txt

-- 
2.19.1
