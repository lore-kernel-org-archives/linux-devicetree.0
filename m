From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 0/5] STM32 Independent watchdog
Date: Thu, 30 Mar 2017 17:15:21 +0200
Message-ID: <1490886926-20585-1-git-send-email-yannick.fertre@st.com>
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
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Version 4:
- Update bindings (iwdg > watchdog)
- Update typo
- Update commit header
- remove gerrit tags
- Update driver (remove unnecessary tests) a add watchdog_init_timeout

Version 3:
- Update typo into  bindings file
- Reorder node in devicetree (ordering by address)
- Remove unnecessary lines in commits

Version 2:
- Add commit messages

Version 1:
- Initial commit

The purpose of this set of patches is to add a new watchdog driver for
stm32f429.
This driver was developed and tested on evaluation board stm32429i.

Yannick Fertre (5):
  dt-bindings: watchdog: Document STM32 IWDG bindings
  drivers: watchdog: Add STM32 IWDG driver
  ARM: dts: stm32: Add watchdog support for STM32F429 SoC
  ARM: dts: stm32: Add watchdog support for STM32F429 eval board
  ARM: configs: stm32: Add watchdog support in STM32 defconfig

 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt |  15 ++
 arch/arm/boot/dts/stm32429i-eval.dts               |   4 +
 arch/arm/boot/dts/stm32f429.dtsi                   |   9 +-
 arch/arm/configs/stm32_defconfig                   |   1 +
 drivers/watchdog/Kconfig                           |  12 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/stm32_iwdg.c                      | 260 +++++++++++++++++++++
 7 files changed, 301 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
 create mode 100644 drivers/watchdog/stm32_iwdg.c

-- 
1.9.1
