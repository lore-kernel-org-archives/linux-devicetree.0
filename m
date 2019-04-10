From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/5] Add pin package management on STM32P157
Date: Wed, 10 Apr 2019 13:30:19 +0200
Message-ID: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

The series adds support of chip packages for STM32MP157 SOC.
Available packages are:

STM32MP_PKG_AA: LFBGA448 (18*18), 176 IOs
STM32MP_PKG_AB: LFBGA354 (16*16), 98 IOs
STM32MP_PKG_AC: TFBGA361 (12*12), 148 IOs
STM32MP_PKG_AD: TFBGA257 (10*10), 98 IOs

As ball-out is different between each package, this series covers those
differences by creating dedicated pinctrl dtsi files. Each dtsi pinctrl
package file describes the package ball-out through gpio-ranges. A new
dt property is also added ("st,package") to provide to stm32 pinctrl driver
the package to use and so the available pins.

stm32mp157a-dk1 / dk2 boards embed a STM32MP_PKG_AC (TFBGA361 (12*12))
package.
stm32mp157c-ed1 / ev1 boards embed a STM32MP_PKG_AA (LFBGA448 (18*18))
package.

Regards

Alex

Alexandre Torgue (5):
  dt-bindings: pinctrl: stm32: add new entry for package information
  pinctrl: stm32: introduce package support
  pinctrl: stm32: add package information for stm32mp157c
  pinctrl: stm32: align stm32mp157 pin names
  ARM: dts: stm32: use dedicated files to manage stm32mp157 packages

 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    2 +
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |   12 +
 arch/arm/boot/dts/stm32mp157a-dk1.dts              |    2 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |    2 +-
 arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi       |   90 ++
 arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi       |   62 ++
 arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi       |   78 ++
 arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi       |   62 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   68 +-
 drivers/pinctrl/stm32/pinctrl-stm32.h              |   14 +
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c         | 1089 +++++++++++---------
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |    6 +
 12 files changed, 1014 insertions(+), 473 deletions(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi

-- 
2.7.4
