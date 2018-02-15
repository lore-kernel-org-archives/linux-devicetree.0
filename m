From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 0/3] USB OTG on STM32F7 boards
Date: Thu, 15 Feb 2018 16:54:37 +0100
Message-ID: <1518710080-18164-1-git-send-email-amelie.delaunay@st.com>
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

This patchset adds support for Peripheral mode on stm32f746 by adding
dwc2 gadget fifo sizes and enables USB OTG HS in OTG (DRD) mode on
stm32746g-eval and stm32f769-disco. It possible to use OTG HS in
Peripheral or Host mode, depending on the USB connector.

Amelie Delaunay (3):
  ARM: dts: stm32: add gadget fifo sizes to usbotg_hs on stm32f746
  ARM: dts: stm32: select otg mode for usbotg_hs on stm32746g_eval
  ARM: dts: stm32: enable USB HS on stm32f769-disco

 arch/arm/boot/dts/stm32746g-eval.dts  |  2 +-
 arch/arm/boot/dts/stm32f746.dtsi      |  3 +++
 arch/arm/boot/dts/stm32f769-disco.dts | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.7.4
