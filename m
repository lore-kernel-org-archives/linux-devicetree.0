From: Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH 0/4] ARM: dts: stm32: enable FMC2 NAND controller on
 stm32mp157c-ev1
Date: Fri, 21 Jun 2019 16:49:46 +0200
Message-ID: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset adds and enables FMC2 NAND controller used on
stm32mp157c-ev1.

Christophe Kerello (4):
  ARM: dts: stm32: add FMC2 NAND controller support on stm32mp157c
  ARM: dts: stm32: add FMC2 NAND controller pins muxing on
    stm32mp157c-ev1
  ARM: dts: stm32: enable FMC2 NAND controller on stm32mp157c-ev1
  ARM: multi_v7_defconfig: add FMC2 NAND  controller support

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 16 +++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 19 +++++++++++++
 arch/arm/configs/multi_v7_defconfig       |  1 +
 4 files changed, 80 insertions(+)

-- 
1.9.1
