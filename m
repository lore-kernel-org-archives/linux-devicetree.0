From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH 10/11] Documentation: Rename gpio controller name from cygnus to iproc
Date: Mon, 19 Oct 2015 11:13:17 +0530
Message-ID: <1445233398-27129-11-git-send-email-pramodku@broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

Renamed gpio controller's driver name from cygnus to iproc to make it
more generic so that all iProc based SoCs having the same gpio controller
could use this.

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 .../bindings/pinctrl/{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
rename to Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
index 655a8d7..7fb4621 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
@@ -1,4 +1,4 @@
-Broadcom Cygnus GPIO/PINCONF Controller
+Broadcom iProc GPIO/PINCONF Controller
 
 Required properties:
 
@@ -7,7 +7,7 @@ Required properties:
 "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
 
 - reg:
-    Define the base and range of the I/O address space that contains the Cygnus
+    Define the base and range of the I/O address space that contains SoC
 GPIO/PINCONF controller registers
 
 - ngpios:
-- 
1.9.1
