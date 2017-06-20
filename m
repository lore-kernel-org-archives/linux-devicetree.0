From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: [PATCH] nios2: add earlycon support to 3c120 devboard DTS
Date: Tue, 20 Jun 2017 09:43:18 +0200
Message-ID: <20170620074318.29069-1-tklauser@distanz.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allow earlycon to be used on the JTAG UART present in the 3c120 GHRD.

Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
---
 arch/nios2/boot/dts/3c120_devboard.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/nios2/boot/dts/3c120_devboard.dts b/arch/nios2/boot/dts/3c120_devboard.dts
index 31c51f9a2f09..36ccdf05837d 100644
--- a/arch/nios2/boot/dts/3c120_devboard.dts
+++ b/arch/nios2/boot/dts/3c120_devboard.dts
@@ -159,6 +159,7 @@
 	};
 
 	chosen {
-		bootargs = "debug console=ttyJ0,115200";
+		bootargs = "debug earlycon console=ttyJ0,115200";
+		stdout-path = &jtag_uart;
 	};
 };
-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
