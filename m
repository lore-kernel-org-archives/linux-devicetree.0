From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 1/2] ARM: dts: BCM5301X: Fix UARTs on bcm953012k
Date: Wed,  8 Feb 2017 15:37:11 -0500
Message-ID: <1486586232-6695-2-git-send-email-jon.mason@broadcom.com>
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

The UARTs are outputting garbage on the console.  This is due to a speed
issue.  We can simply use the clock speed (which is now defined in the
DTSI file) and everything works fine.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
Fixes: cdc36b22 ("ARM: dts: enable clock support for BCM5301X")
---
 arch/arm/boot/dts/bcm953012k.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm953012k.dts b/arch/arm/boot/dts/bcm953012k.dts
index bfd9230..da5aa8f 100644
--- a/arch/arm/boot/dts/bcm953012k.dts
+++ b/arch/arm/boot/dts/bcm953012k.dts
@@ -53,10 +53,9 @@
 };
 
 &uart0 {
-	clock-frequency = <62499840>;
+	status = "okay";
 };
 
 &uart1 {
-	clock-frequency = <62499840>;
 	status = "okay";
 };
-- 
2.7.4
