From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 0/3] Improved perf support for imx53/ppd
Date: Thu, 18 Jan 2018 18:43:42 +0100
Message-ID: <20180118174345.26620-1-sebastian.reichel@collabora.co.uk>
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
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Ian Ray <ian.ray@ge.com>, Rob Herring <robh+dt@kernel.org>, Nandor Han <nandor.han@ge.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This improves perf on imx53 by adding support for enabling the Secure
Debug Enable Register (SDER) SUNIDEN bit. This unlocks new
functionality:

ppd before patchset# perf stat -e cycles,instructions sleep 1 2>&1 | grep instructions
                 0      instructions              #    0.00  insn per cycle

ppd  after patchset# perf stat -e cycles,instructions sleep 1 2>&1 | grep instructions
            177864      instructions              #    0.05  insn per cycle

-- Sebastian

Peter Senna Tschudin (2):
  ARM: imx53: add SoC specific PMU setup
  ARM: dts: imx53: PPD: Enable secure-reg-access

Sebastian Reichel (1):
  drivers/perf: arm_pmu: Add platform hardware setup hooks.

 arch/arm/boot/dts/imx53-ppd.dts |  6 ++++
 arch/arm/mach-imx/mach-imx53.c  | 68 +++++++++++++++++++++++++++++++++++++++++
 drivers/perf/arm_pmu.c          | 13 ++++++++
 include/linux/perf/arm_pmu.h    |  5 +++
 4 files changed, 92 insertions(+)

-- 
2.15.1
