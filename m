From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 00/10] Add further support for PHYTEC phyBOARD-Segin
Date: Tue, 9 Jul 2019 09:19:17 +0200
Message-ID: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
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
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchstack adjusts the already existing naming for the PHYTEC
phyBOARD-Segin to the PHYTEC naming scheme that is already used with the
phyCORE-i.MX 6 and the phyBOARD-Mira.

Furthermore it introduces some small fixes and adds support for the PHYTEC
phyCORE-i.MX 6ULL which also comes with the phyBORAD-Segin. It comes in a
full featured option with either NAND flash or eMMC and a low cost option
only with NAND flash.

Stefan Riedmueller (10):
  ARM: dts: imx6ul: phyboard-segin: Rename dts to PHYTEC name scheme
  ARM: dts: imx6ul: segin: Add boot media to dts filename
  ARM: dts: imx6ul: segin: Reduce eth drive strength
  ARM: dts: imx6ul: segin: Fix LED naming for phyCORE and PEB-EVAL-01
  ARM: dts: imx6ul: segin: Make FEC and ethphy configurable in dts
  ARM: dts: imx6ul: segin: Only enable NAND if it is populated
  ARM: dts: imx6ul: phycore: Add eMMC at usdhc2
  ARM: dts: imx6ul: segin: Move ECSPI interface to board include file
  ARM: dts: imx6ul: segin: Move machine include to dts files
  ARM: dts: imx6ull: Add support for PHYTEC phyBOARD-Segin with i.MX
    6ULL

 arch/arm/boot/dts/Makefile                         |  5 +-
 ...-pcl063.dtsi => imx6ul-phytec-phycore-som.dtsi} | 51 ++++++++----
 ...ull.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} | 42 +++++-----
 ...1.dtsi => imx6ul-phytec-segin-peb-eval-01.dtsi} | 16 ++--
 ...hyboard-segin.dtsi => imx6ul-phytec-segin.dtsi} | 31 ++++++--
 arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi  | 24 ++++++
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts  | 93 ++++++++++++++++++++++
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  | 93 ++++++++++++++++++++++
 .../boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts  | 45 +++++++++++
 .../boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi | 19 +++++
 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi        | 38 +++++++++
 11 files changed, 409 insertions(+), 48 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-phytec-pcl063.dtsi => imx6ul-phytec-phycore-som.dtsi} (72%)
 rename arch/arm/boot/dts/{imx6ul-phytec-phyboard-segin-full.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} (51%)
 rename arch/arm/boot/dts/{imx6ul-phytec-peb-eval-01.dtsi => imx6ul-phytec-segin-peb-eval-01.dtsi} (84%)
 rename arch/arm/boot/dts/{imx6ul-phytec-phyboard-segin.dtsi => imx6ul-phytec-segin.dtsi} (91%)
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi

-- 
2.7.4
