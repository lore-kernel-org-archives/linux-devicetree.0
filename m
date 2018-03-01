From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 0/2] Introduce STM32 USB PHY Controller driver
Date: Thu, 1 Mar 2018 16:30:43 +0100
Message-ID: <1519918245-17333-1-git-send-email-amelie.delaunay@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for STMicroelectronics STM32 USB PHY Controller
(USBPHYC) which is embedded in STM32MP1 SoC.
The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
switch that selects either USB OTG controller or USB Host controller for the
second PHY port.

---
Changes in v2:
* Update diagram to better describe the context.
* Change boolean dt propery st,port2-switch-to-host into u32 st,utmi-switch.
* Silent phy creation failure in case of -EPROBE_DEFER.


Amelie Delaunay (2):
  dt-bindings: phy: add support for STM32 USB PHY Controller (USBPHYC)
  phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)

 .../devicetree/bindings/phy/phy-stm32-usbphyc.txt  |  46 +++
 drivers/phy/st/Kconfig                             |  14 +
 drivers/phy/st/Makefile                            |   1 +
 drivers/phy/st/phy-stm32-usbphyc.c                 | 382 +++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
 create mode 100644 drivers/phy/st/phy-stm32-usbphyc.c

-- 
2.7.4
