From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH] dtb: amd: Fix-up for ccn504 and kcs nodes
Date: Fri, 12 Feb 2016 07:20:43 +0700
Message-ID: <1455236443-23949-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>

This is a fix-up patch based on the review comment from
Arnd regarding:
    * fix ccn504 address in the node name
    * remove kcs interrupt-name

Signed-off-by: Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---

Hi Olof,

Here are the changes from the V3 that I sent earlier. Sorry for confusion.
Would you please pull this into the next tree?

Thank you,
Suravee

 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index a7fc059..bd3adea 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -231,7 +231,7 @@
 		};
 
 		/* Perf CCN504 PMU */
-		ccn: ccn@0xe8000000 {
+		ccn: ccn@e8000000 {
 			compatible = "arm,ccn-504";
 			reg = <0x0 0xe8000000 0 0x1000000>;
 			interrupts = <0 380 4>;
@@ -243,7 +243,6 @@
 			device_type = "ipmi";
 			reg = <0x0 0xe0010000 0 0x8>;
 			interrupts = <0 389 4>;
-			interrupt-names = "ipmi_kcs";
 			reg-size = <1>;
 			reg-spacing = <4>;
 		};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
