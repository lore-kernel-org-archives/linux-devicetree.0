From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 2/4] dt-bindings: soc: Document "brcm,bcm2836-vchiq"
Date: Fri, 14 Sep 2018 14:22:53 +0100
Message-ID: <1536931375-48769-3-git-send-email-phil@raspberrypi.org>
References: <1536931375-48769-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536931375-48769-1-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

"brcm,bcm2836-vchiq" should be used on BCM2836 and BCM2837 to ensure
correct operation.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
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
