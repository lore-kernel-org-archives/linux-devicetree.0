From: Kamal Mostafa <kamal@canonical.com>
Subject: [PATCH 3.13 134/212] arm: dts: Fix missing device_type="memory" for ste-ccu8540
Date: Tue, 17 Jun 2014 14:43:48 -0700
Message-ID: <1403041506-13646-135-git-send-email-kamal@canonical.com>
References: <1403041506-13646-1-git-send-email-kamal@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403041506-13646-1-git-send-email-kamal@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel-team@lists.ubuntu.com
Cc: Leif Lindholm <leif.lindholm@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Kamal Mostafa <kamal@canonical.com>
List-Id: devicetree@vger.kernel.org

3.13.11.4 -stable review patch.  If anyone has any objections, please let me know.

------------------

From: Leif Lindholm <leif.lindholm@linaro.org>

commit bfaed5abad998bfc88a66e6e71c7b08dcf82f04e upstream.

The current .dts for ste-ccu8540 lacks a 'device_type = "memory"' for
its memory node, relying on an old ppc quirk in order to discover its
memory. Fix the data so that all parsing code can handle it correctly.

Signed-off-by: Leif Lindholm <leif.lindholm@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 arch/arm/boot/dts/ste-ccu8540.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ste-ccu8540.dts b/arch/arm/boot/dts/ste-ccu8540.dts
index 7f3baf5..32dd55e 100644
--- a/arch/arm/boot/dts/ste-ccu8540.dts
+++ b/arch/arm/boot/dts/ste-ccu8540.dts
@@ -18,6 +18,7 @@
 	compatible = "st-ericsson,ccu8540", "st-ericsson,u8540";
 
 	memory@0 {
+		device_type = "memory";
 		reg = <0x20000000 0x1f000000>, <0xc0000000 0x3f000000>;
 	};
 
-- 
1.9.1
