From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH] ARM: dts: NSP: Correct RAM amount for BCM958625HR board
Date: Wed, 13 Jul 2016 14:18:49 -0400
Message-ID: <1468433929-12232-1-git-send-email-jon.mason@broadcom.com>
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
To: f.fainelli@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The BCM958625HR board has 2GB of RAM available.  Increase the amount
from 512MB to 2GB and add the device type to the memory entry.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm/boot/dts/bcm958625hr.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
index 4239e58..66c658a 100644
--- a/arch/arm/boot/dts/bcm958625hr.dts
+++ b/arch/arm/boot/dts/bcm958625hr.dts
@@ -47,7 +47,8 @@
 	};
 
 	memory {
-		reg = <0x60000000 0x20000000>;
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
 	};
 };
 
-- 
1.9.1
