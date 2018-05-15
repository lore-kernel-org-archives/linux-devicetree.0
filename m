From: Erwan Le Ray <erwan.leray@st.com>
Subject: [PATCH 0/2] m_can support to stm32mp157c
Date: Tue, 15 May 2018 14:23:57 +0200
Message-ID: <1526387039-14813-1-git-send-email-erwan.leray@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, bich.hemon@st.com, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org, erwan.leray@st.com
List-Id: devicetree@vger.kernel.org

Add support for the Controller Area Network m_can to STM32MP157C SoC and
activation on stm32mp157c-ev1 board

Bich Hemon (2):
  ARM: dts: stm32: m_can support to stm32mp157c
  ARM: dts: stm32: m_can activation on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  6 ++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 26 ++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

-- 
1.9.1
