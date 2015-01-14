From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH 0/2] ARM: imx6sx-sdb: add revb board
Date: Wed, 14 Jan 2015 15:36:36 +0800
Message-ID: <1421220998-3491-1-git-send-email-peter.chen@freescale.com>
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
To: shawn.guo@linaro.org, kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Peter Chen <peter.chen@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

The imx6sx-sdb board has two revisions, the current mainline is the
reva which is used by internal user mainly, and the revb is used widely
for internal and external users.

The main changes between reva and revb board:
- cpu operating point and related voltage
- pfuse
- qspi
- can transceiver (not mainlined)

Peter Chen (2):
  ARM: imx6sx-sdb: change default board as reva board
  ARM: imx6sx-sdb: add revb board

 arch/arm/boot/dts/imx6sx-sdb-reva.dts              | 158 +++++++++++++++++++++
 arch/arm/boot/dts/imx6sx-sdb-revb.dts              | 145 +++++++++++++++++++
 .../boot/dts/{imx6sx-sdb.dts => imx6sx-sdb.dtsi}   | 131 -----------------
 3 files changed, 303 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6sx-sdb-reva.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-sdb-revb.dts
 rename arch/arm/boot/dts/{imx6sx-sdb.dts => imx6sx-sdb.dtsi} (83%)

-- 
1.9.1
