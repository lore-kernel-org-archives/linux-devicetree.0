From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH V3 09/12] dtb: amd: Add KCS device tree node
Date: Wed, 10 Feb 2016 21:51:08 -0600
Message-ID: <1455162671-16044-10-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>

Add KCS device node to support IPMI solution on Overdrive
system.

Signed-off-by: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 70f407d..bd3adea 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -236,5 +236,15 @@
 			reg = <0x0 0xe8000000 0 0x1000000>;
 			interrupts = <0 380 4>;
 		};
+
+		ipmi_kcs: kcs@e0010000 {
+			status = "disabled";
+			compatible = "ipmi-kcs";
+			device_type = "ipmi";
+			reg = <0x0 0xe0010000 0 0x8>;
+			interrupts = <0 389 4>;
+			reg-size = <1>;
+			reg-spacing = <4>;
+		};
 	};
 };
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
