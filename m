From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 0/4] Fix avoid_unnecessary_addr_size DTC warning with 'clocks'
 node
Date: Fri,  4 May 2018 08:57:22 +0800
Message-ID: <1525395446-1953-1-git-send-email-shawnguo@kernel.org>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

The series is to clean up avoid_unnecessary_addr_size DTC warning seen
with 'clocks' container node in i.MX dts files.

Shawn Guo (4):
  ARM: dts: imx: drop unnecessary #address-cells/#size-cells
  ARM: dts: imx1: move clk32 clock into soc dtsi
  ARM: dts: imx27: use lable to override osc26m clock setting
  ARM: dts: imx: drop 'clocks' container for board level clocks

 arch/arm/boot/dts/imx1-ads.dts               | 11 -----------
 arch/arm/boot/dts/imx1.dtsi                  |  8 ++++++++
 arch/arm/boot/dts/imx25.dtsi                 |  3 ---
 arch/arm/boot/dts/imx27-apf27.dts            | 13 +++----------
 arch/arm/boot/dts/imx27.dtsi                 |  5 +----
 arch/arm/boot/dts/imx28-tx28.dts             | 13 ++++---------
 arch/arm/boot/dts/imx50.dtsi                 |  3 ---
 arch/arm/boot/dts/imx51.dtsi                 |  3 ---
 arch/arm/boot/dts/imx53-tx53.dtsi            | 11 +++++------
 arch/arm/boot/dts/imx53.dtsi                 |  3 ---
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts | 15 ++++++---------
 arch/arm/boot/dts/imx6q-bx50v3.dtsi          | 11 ++++-------
 arch/arm/boot/dts/imx6qdl.dtsi               |  3 ---
 arch/arm/boot/dts/imx6sl.dtsi                |  3 ---
 14 files changed, 31 insertions(+), 74 deletions(-)

-- 
1.9.1
