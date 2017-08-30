From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 0/3] Add support for STM32 vrefbuf regulator
Date: Wed, 30 Aug 2017 17:55:26 +0200
Message-ID: <1504108529-31727-1-git-send-email-fabrice.gasnier@st.com>
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
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some STM32 devices embed a voltage reference buffer which can be used as
voltage reference for ADCs, DACs and also as voltage reference
for external components through the dedicated VREF+ pin.

This patchset adds vrefbuf regulator driver, device tree bindings and
vrefbuf device tree node for STM32H7 SoC.

---
Changes in v2:
- Update regulator driver following Mark's remarks

Fabrice Gasnier (3):
  dt-bindings: regulator: Add STM32 Voltage Reference Buffer
  regulator: Add support for stm32-vrefbuf
  ARM: dts: stm32: add vrefbuf to stm32h743

 .../bindings/regulator/st,stm32-vrefbuf.txt        |  20 ++
 arch/arm/boot/dts/stm32h743.dtsi                   |   9 +
 drivers/regulator/Kconfig                          |  12 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-vrefbuf.c                  | 202 +++++++++++++++++++++
 5 files changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
 create mode 100644 drivers/regulator/stm32-vrefbuf.c

-- 
1.9.1
