From: Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/2] ARM: dts: imx: Add Engicam 1.5 MX6 support
Date: Fri, 20 Jul 2018 12:16:03 +0200
Message-ID: <1532081765-29910-1-git-send-email-jacopo@jmondi.org>
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
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, jagan@amarulasolutions.com
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,
   the 'EDIMM Starter Kit 1.5 MIPI Evaluation" board, whose support has been
introduced by commit:
commit 3fe08835773121870b1de7d0cac9a4ade796661e ("ARM: dts: imx6q: Add Engicam
i.CoreM6 1.5 Quad/Dual MIPI starter kit support")

is actually based on 1.5 version of the "i.Core 1.5 MX6" CPU module which
differs from the original "i.Core MX6" for a few details, including the one that
has sparkled this activity: the ethernet PHY interface clock provider.

Instead of fixing the PHY clock provider in the imx6q-icore-mipi.dts file, I
preferred adding a new .dtsi for the 1.5 version of the module, to gather
differences between version in a single place. Then I've referenced the new one
in the dts file.

As a result, the ethernet interface is now working on the EDIMM 1.5 MIPI
evaluation kit.

Thanks
   j

Jacopo Mondi (2):
  ARM: dts: imx6qdl: Add Engicam i.Core 1.5 MX6
  ARM: dts: imx6q-icore-mipi: Use 1.5 version of i.Core MX6

 arch/arm/boot/dts/imx6q-icore-mipi.dts   |  4 ++--
 arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi | 34 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi

--
2.7.4
