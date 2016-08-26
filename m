From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 0/3] Add SMP support for i.MX7D
Date: Fri, 26 Aug 2016 19:12:48 +0800
Message-ID: <1472209971-32469-1-git-send-email-Anson.Huang@nxp.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

i.MX7D has 2 Cortex-A7 ARM cores, and it has a different GPC design
than i.MX6, so this patch set adds a new GPCV2 driver for i.MX7D,
and also adds runtime check in SMP code to support both Cortex-A9
and Cortex-A7 ARM cores.

With this patch set, i.MX7D can boot up SMP kernel with 2 CPUs.

Anson Huang (3):
  ARM: dts: imx7: support SMP boot up
  ARM: imx: add gpcv2 support
  ARM: imx: add SMP support for i.MX7D

 arch/arm/boot/dts/imx7s.dtsi   |  8 +++++
 arch/arm/mach-imx/Kconfig      |  4 +++
 arch/arm/mach-imx/Makefile     |  1 +
 arch/arm/mach-imx/common.h     |  2 ++
 arch/arm/mach-imx/gpcv2.c      | 66 ++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-imx/headsmp.S    | 11 +++++++
 arch/arm/mach-imx/mach-imx7d.c |  2 ++
 arch/arm/mach-imx/platsmp.c    | 23 ++++++++++++++-
 arch/arm/mach-imx/src.c        | 38 +++++++++++++++++++-----
 9 files changed, 146 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/mach-imx/gpcv2.c

-- 
1.9.1
