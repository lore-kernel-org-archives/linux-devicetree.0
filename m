From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/7] Add support for USB OTG on STM32F7xx
Date: Thu, 17 Aug 2017 11:32:59 +0200
Message-ID: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

The STM32F7xx MCU family embeds two DWC2 USB OTG cores. One core is USB
OTG FS and the other is USB OTG HS. The USB FS core only works with its
internal phy whilst the USB HS core can work in HS with external ULPI phy
or in FS/LS with the on-chip FS phy.

Amelie Delaunay (7):
  dt-bindings: usb: Document the STM32F7xx DWC2 USB OTG HS core binding
  usb: dwc2: add support for STM32F7xx USB OTG HS
  ARM: dts: stm32: Add USB HS support for STM32F746 MCU
  ARM: dts: stm32: Enable USB HS on stm32746g-eval
  ARM: dts: stm32: Enable USB HS on stm32f746-disco
  ARM: dts: stm32: Add USB FS support for STM32F746 MCU
  ARM: dts: stm32: Enable USB FS on stm32f746-disco

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 +
 arch/arm/boot/dts/stm32746g-eval.dts           | 16 ++++++
 arch/arm/boot/dts/stm32f746-disco.dts          | 30 ++++++++++
 arch/arm/boot/dts/stm32f746.dtsi               | 80 ++++++++++++++++++++++++++
 drivers/usb/dwc2/params.c                      | 11 ++++
 5 files changed, 139 insertions(+)

-- 
2.7.4
