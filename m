From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/3] Add RTC support on STM32F746
Date: Thu, 19 Jan 2017 14:45:16 +0100
Message-ID: <1484833519-9298-1-git-send-email-amelie.delaunay@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset enables STM32 RTC on STM32F746 MCU.

Amelie Delaunay (3):
  ARM: dts: stm32: set HSE_RTC clock frequency to 1 MHz on stm32f746
  ARM: dts: stm32: Add RTC support for STM32F746 MCU
  ARM: dts: stm32: enable RTC on stm32746g-eval

 arch/arm/boot/dts/stm32746g-eval.dts |  4 ++++
 arch/arm/boot/dts/stm32f746.dtsi     | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

-- 
1.9.1
