From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 0/3] USB OTG on STM32H743
Date: Mon, 19 Feb 2018 09:46:25 +0100
Message-ID: <1519029988-9261-1-git-send-email-amelie.delaunay@st.com>
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

This patchset adds support for USB OTG HS and FS on stm32h743 SoC.
It also enables USB OTG HS on stm32h743i-eval board in OTG (DRD) mode. It is
possible to use OTG HS in Peripheral or Host mode depending on the USB
connector.

---

Changes in v2:
- Fix compatible string (https://patchwork.kernel.org/patch/10222153/)

Amelie Delaunay (3):
  ARM: dts: stm32: add USB OTG HS support for STM32H743 SoC
  ARM: dts: stm32: add USB OTG FS support for STM32H743 SoC
  ARM: dts: stm32: enable USB OTG HS on stm32h743i-eval

 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 20 ++++++++++++++++++++
 arch/arm/boot/dts/stm32h743.dtsi         | 21 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743i-eval.dts    | 16 ++++++++++++++++
 3 files changed, 57 insertions(+)

-- 
2.7.4
