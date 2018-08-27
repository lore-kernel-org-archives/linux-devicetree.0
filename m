From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 1/3] dt-bindings: bcm: Add Raspberry Pi CM3 and CM3L
Date: Mon, 27 Aug 2018 20:05:46 +0200
Message-ID: <1535393148-24163-2-git-send-email-stefan.wahren@i2se.com>
References: <1535393148-24163-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535393148-24163-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the root properties for Raspberry Pi Compute Module 3 and
Compute Module 3 Lite.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
index 1e3e29a..0dcc3ea 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
@@ -42,6 +42,14 @@ Raspberry Pi Compute Module
 Required root node properties:
 compatible = "raspberrypi,compute-module", "brcm,bcm2835";
 
+Raspberry Pi Compute Module 3
+Required root node properties:
+compatible = "raspberrypi,3-compute-module", "brcm,bcm2837";
+
+Raspberry Pi Compute Module 3 Lite
+Required root node properties:
+compatible = "raspberrypi,3-compute-module-lite", "brcm,bcm2837";
+
 Raspberry Pi Zero
 Required root node properties:
 compatible = "raspberrypi,model-zero", "brcm,bcm2835";
-- 
2.7.4
