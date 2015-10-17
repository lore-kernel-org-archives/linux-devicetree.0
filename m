From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 5/8] arm: dts: ea3250/phy3250: specify phys memory offset for lpc32xx boards
Date: Sun, 18 Oct 2015 00:35:54 +0300
Message-ID: <1445117757-8073-6-git-send-email-vz@mleia.com>
References: <1445117757-8073-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445117757-8073-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In case if SDRAM memory region is not populated by a bootloader,
provide this value in device trees for EA3250 and PHY3250 boards.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
- none, new change

 arch/arm/boot/dts/ea3250.dts  | 2 +-
 arch/arm/boot/dts/phy3250.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ea3250.dts b/arch/arm/boot/dts/ea3250.dts
index 121d032..392430b 100644
--- a/arch/arm/boot/dts/ea3250.dts
+++ b/arch/arm/boot/dts/ea3250.dts
@@ -22,7 +22,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0 0x4000000>;
+		reg = <0x80000000 0x4000000>;
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
index 2a2d2cf..79a20f7 100644
--- a/arch/arm/boot/dts/phy3250.dts
+++ b/arch/arm/boot/dts/phy3250.dts
@@ -22,7 +22,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0 0x4000000>;
+		reg = <0x80000000 0x4000000>;
 	};
 
 	ahb {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
