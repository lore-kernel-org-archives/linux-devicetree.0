From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [PATCH RFC v2 0/4] SolidRun Hummingboard 2 support
Date: Fri, 13 Jan 2017 14:44:49 +0000
Message-ID: <20170113144449.GQ14217@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Jon Nettleton <jon@solid-run.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

These patches add support for SolidRun's Hummingboard 2 to mainline.
The first is the official SolidRun DTS file supplied by Jon, the
remainder are cleanups to it for mainline.

These can be found in my HB2 branch.

Version 2 updated by Jon from comments received on previous posting.

The series can be found at:

  git://git.armlinux.org.uk/~rmk/linux-arm.git hb2

 arch/arm/boot/dts/Makefile                   |   2 +
 arch/arm/boot/dts/imx6dl-hummingboard2.dts   |  52 +++
 arch/arm/boot/dts/imx6q-hummingboard2.dts    |  60 +++
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 555 +++++++++++++++++++++++++++
 4 files changed, 669 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-hummingboard2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-hummingboard2.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
