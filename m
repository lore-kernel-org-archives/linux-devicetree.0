From: dt.tangr@gmail.com
Subject: [PATCH 2/2] arm: nspire: modify device tree to use the nspire-usb driver
Date: Wed,  4 Dec 2013 20:20:08 +1100
Message-ID: <1386148808-15065-2-git-send-email-dt.tangr@gmail.com>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Daniel Tang <dt.tangr@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

From: Daniel Tang <dt.tangr@gmail.com>

This patch adds the needed compatible key to the device tree for TI-Nspires.

Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
---
 arch/arm/boot/dts/nspire.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index a22ffe6..baf7153 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -65,6 +65,7 @@
 		};
 
 		usb0: usb@B0000000 {
+			compatible = "lsi,nspire-usb";
 			reg = <0xB0000000 0x1000>;
 			interrupts = <8>;
 		};
-- 
1.7.10.4

