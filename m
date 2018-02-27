From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 0/2] drivers: soc: xilinx: Add support for ZynqMP power domain
 driver
Date: Tue, 27 Feb 2018 15:55:48 -0800
Message-ID: <1519775750-21297-1-git-send-email-jollys@xilinx.com>
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
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, rajanv@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

The zynqmp power domain driver communicates the usage requirements
for logical power domains / devices to the platform FW.
FW is responsible for choosing appropriate power states,
taking Linux' usage information into account.

This patchset has dependency on below drivers:
Firmware Driver:     https://patchwork.kernel.org/patch/10230773/

Jolly Shah (2):
  dt-bindings: power: Add ZynqMP power domain bindings
  drivers: soc: xilinx: Add ZynqMP power domain driver

 .../devicetree/bindings/power/zynqmp-genpd.txt     |  46 +++
 drivers/soc/xilinx/Kconfig                         |   2 +
 drivers/soc/xilinx/Makefile                        |   2 +
 drivers/soc/xilinx/zynqmp/Kconfig                  |  16 +
 drivers/soc/xilinx/zynqmp/Makefile                 |   4 +
 drivers/soc/xilinx/zynqmp/pm_domains.c             | 339 +++++++++++++++++++++
 6 files changed, 409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/zynqmp-genpd.txt
 create mode 100644 drivers/soc/xilinx/zynqmp/Kconfig
 create mode 100644 drivers/soc/xilinx/zynqmp/Makefile
 create mode 100644 drivers/soc/xilinx/zynqmp/pm_domains.c

-- 
2.7.4
