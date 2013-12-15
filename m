From: dt.tangr@gmail.com
Subject: [PATCH 2/3] arm: nspire: modify device tree to use the lsi,zevio-usb driver
Date: Sun, 15 Dec 2013 14:35:08 +1100
Message-ID: <1387078509-14156-2-git-send-email-dt.tangr@gmail.com>
References: <1387078509-14156-1-git-send-email-dt.tangr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387078509-14156-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Daniel Tang <dt.tangr@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

From: Daniel Tang <dt.tangr@gmail.com>


Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
---
 arch/arm/boot/dts/nspire.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index a22ffe6..012c6d1 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -65,6 +65,7 @@
 		};
 
 		usb0: usb@B0000000 {
+			compatible = "lsi,zevio-usb";
 			reg = <0xB0000000 0x1000>;
 			interrupts = <8>;
 		};
-- 
1.7.10.4
