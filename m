From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 2/4] dt-bindings: soc: Document "brcm,bcm2836-vchiq"
Date: Mon, 17 Sep 2018 09:22:22 +0100
Message-ID: <1537172544-104852-3-git-send-email-phil@raspberrypi.org>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

"brcm,bcm2836-vchiq" should be used on BCM2836 and BCM2837 to ensure
correct operation.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
index 8dd7b3a..f331316 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
@@ -2,7 +2,8 @@ Broadcom VCHIQ firmware services
 
 Required properties:
 
-- compatible:	Should be "brcm,bcm2835-vchiq"
+- compatible:	Should be "brcm,bcm2835-vchiq" on BCM2835, otherwise
+		"brcm,bcm2836-vchiq".
 - reg:		Physical base address and length of the doorbell register pair
 - interrupts:	The interrupt number
 		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
-- 
2.7.4
