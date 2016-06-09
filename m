From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 0/3] ARM: Keystone: Add pinmuxing support
Date: Thu,  9 Jun 2016 10:26:15 -0500
Message-ID: <1465485978-27910-1-git-send-email-fcooper@ti.com>
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
To: ssantosh@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Unlike most Keystone 2 devices, K2G supports pinmuxing of its pins. This
patch series enables pinmuxing for Keystone 2 devices.

Version 2 changes:
Rebased on top of linux-next which includes Keerthy patches.

Lokesh Vutla (2):
  ARM: dts: keystone: Header file for pinctrl constants
  ARM: dts: k2g-evm: Add pinmuxing for UART0

Vitaly Andrianov (1):
  ARM: dts: k2g: Add pinctrl support

 arch/arm/boot/dts/keystone-k2g-evm.dts | 11 ++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    |  8 +++++++
 include/dt-bindings/pinctrl/keystone.h | 39 ++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/keystone.h

-- 
2.7.0
