From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 2/3] usb: host: Allow to build ehci orion with mvebu SoCs
Date: Wed,  8 Mar 2017 17:24:22 +0100
Message-ID: <20170308162423.25553-3-gregory.clement@free-electrons.com>
References: <20170308162423.25553-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308162423.25553-1-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The mvebu ARM64 SoCs no more select PLAT_ORION but some of them as the
Armada 37xx use the EHCI orion controller. This patch allow to build
the driver when ARCH_MVEBU is selected.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 407d947b34ea..870c42d89298 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -188,7 +188,7 @@ config USB_EHCI_HCD_OMAP
 
 config USB_EHCI_HCD_ORION
 	tristate  "Support for Marvell EBU on-chip EHCI USB controller"
-	depends on USB_EHCI_HCD && PLAT_ORION
+	depends on USB_EHCI_HCD && PLAT_ORION || ARCH_MVEBU
 	default y
 	---help---
 	  Enables support for the on-chip EHCI controller on Marvell's
-- 
2.11.0
