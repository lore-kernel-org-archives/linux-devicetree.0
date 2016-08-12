From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH RESEND v2 3/3] ehci-platform: add the max clock number to 4
Date: Fri, 12 Aug 2016 11:06:22 +0800
Message-ID: <20160812030622.4492-3-icenowy@aosc.xyz>
References: <20160812030622.4492-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160812030622.4492-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allwinner A64 EHCI requires 4 clocks to be enabled.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 drivers/usb/host/ehci-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 6816b8c..876dca4 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -38,7 +38,7 @@
 #include "ehci.h"
 
 #define DRIVER_DESC "EHCI generic platform driver"
-#define EHCI_MAX_CLKS 3
+#define EHCI_MAX_CLKS 4
 #define EHCI_MAX_RSTS 3
 #define hcd_to_ehci_priv(h) ((struct ehci_platform_priv *)hcd_to_ehci(h)->priv)
 
-- 
2.9.2
