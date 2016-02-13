From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: porter: remove enable prop from HS-USB device node
Date: Sun, 14 Feb 2016 01:26:34 +0300
Message-ID: <2684686.0L09MeB6pA@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In  the final versions of the Porter board (called "PORTER_C") Renesas
decided to get rid  of the Maxim Integrated MAX3355 OTG chip and didn't
add any other provision to differ the host/gadget mode, so we'll have to
remove  no longer valid "renesas,enable-gpio" property from the HS-USB
device node.  Hopefully, the earlier revisions of the board were never
seen in the wild...

Fixes: c794f6a09a25 ("ARM: shmobile: porter: add HS-USB DT support")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'master' branch of Simon Horman's 'renesas.git' repo.

 arch/arm/boot/dts/r8a7791-porter.dts |    1 -
 1 file changed, 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7791-porter.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-porter.dts
+++ renesas/arch/arm/boot/dts/r8a7791-porter.dts
@@ -283,7 +283,6 @@
 	pinctrl-names = "default";
 
 	status = "okay";
-	renesas,enable-gpio = <&gpio5 31 GPIO_ACTIVE_HIGH>;
 };
 
 &usbphy {
