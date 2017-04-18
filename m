From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 0/7] i.MX7 PCIe related device tree changes
Date: Tue, 18 Apr 2017 08:01:26 -0700
Message-ID: <20170418150133.31679-1-andrew.smirnov@gmail.com>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org, yurovsky@gmail.com
List-Id: devicetree@vger.kernel.org

Shawn, everyone:

This is second version of the series that includes changes made to
device-tree in order to support PCIe on i.MX7 platform.

Changes since [v1]:

	- All 'anatop-enable-bit' patches are squashed into one

	- Added patch to enable GPCv2 driver on i.MX7

	- Dropped accidentally introduced unsupported DT properties

	- A number of node renaming for readability/clarity purpose

[v1] http://lkml.kernel.org/r/20170413133242.5068-1-andrew.smirnov@gmail.com

Andrey Smirnov (7):
  ARM: dts: i.MX: Reintroduce 'anatop-enable-bit' where appropriate
  ARM: imx: Select GPCv2 for i.MX7
  ARM: dts: imx7s: Add node for GPC
  ARM: dts: imx7s: Mark 'gpr' compatible with i.MX6 variant
  ARM: dts: imx7d-sdb: Add GPIO expander node
  ARM: dts: imx7d: Add node for PCIe controller
  ARM: dts: imx7d-sdb: Enable PCIe peripheral

 arch/arm/boot/dts/imx6qdl.dtsi  |  3 +++
 arch/arm/boot/dts/imx6sl.dtsi   |  3 +++
 arch/arm/boot/dts/imx6sx.dtsi   |  3 +++
 arch/arm/boot/dts/imx6ul.dtsi   |  1 +
 arch/arm/boot/dts/imx7d-sdb.dts | 35 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7d.dtsi    | 37 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7s.dtsi    | 30 ++++++++++++++++++++++++++++--
 arch/arm/mach-imx/Kconfig       |  1 +
 8 files changed, 111 insertions(+), 2 deletions(-)

-- 
2.9.3
