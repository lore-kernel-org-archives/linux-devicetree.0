From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 2/2] ARM: dts: BCM5301X: Fix memory start address
Date: Wed,  8 Feb 2017 15:37:12 -0500
Message-ID: <1486586232-6695-3-git-send-email-jon.mason@broadcom.com>
References: <1486586232-6695-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486586232-6695-1-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Memory starts at 0x80000000, not 0.  0 "works" due to mirrior of the
first 128M of RAM to that address.  Anything greater than 128M will
quickly find nothing there.  Correcting the starting address has
everything working again.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
Fixes: 7eb05f6d ("ARM: dts: bcm5301x: Add BCM SVK DT files")
---
 arch/arm/boot/dts/bcm953012k.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm953012k.dts b/arch/arm/boot/dts/bcm953012k.dts
index da5aa8f..ae31a58 100644
--- a/arch/arm/boot/dts/bcm953012k.dts
+++ b/arch/arm/boot/dts/bcm953012k.dts
@@ -48,7 +48,7 @@
 	};
 
 	memory {
-		reg = <0x00000000 0x10000000>;
+		reg = <0x80000000 0x10000000>;
 	};
 };
 
-- 
2.7.4
