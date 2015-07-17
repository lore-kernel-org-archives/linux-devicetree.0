From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 6/6] ARM: STi: DT: STiH407: Enable Mailbox testing facility
Date: Fri, 17 Jul 2015 13:04:07 +0100
Message-ID: <1437134647-28298-7-git-send-email-lee.jones@linaro.org>
References: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, jassisinghbrar@gmail.com, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch supplies a Client node to enable the Mailbox testing
facility.  It will be used to send and receive messages from any
given co-processor in order to test the STi Mailbox Controller
driver.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index c061d11..df7fe80 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -567,6 +567,12 @@
 			};
 		};
 
+		mailbox_test {
+			compatible = "mailbox_test";
+			mboxes = <&mailbox2 1 31 MBOX_TX>, <&mailbox0 1 31 MBOX_RX>;
+			mbox-names = "tx", "rx";
+		};
+
 		mailbox0: mailbox@0  {
 			compatible	= "st,stih407-mailbox";
 			reg		= <0x8f00000 0x1000>;
-- 
1.9.1
