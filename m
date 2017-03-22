From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 07/15] ARM: dts: spear13xx: fix PCI bus dtc warnings
Date: Tue, 21 Mar 2017 21:03:05 -0500
Message-ID: <20170322020313.24338-7-robh@kernel.org>
References: <20170322020313.24338-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170322020313.24338-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shiraz Hashim <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

dtc recently added PCI bus checks. Fix these warnings.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shiraz Hashim <shiraz.linux.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Sub-arch maintainers, please apply to your trees unless arm-soc wants 
to take the whole lot.

 arch/arm/boot/dts/spear1310.dtsi | 3 +++
 arch/arm/boot/dts/spear1340.dtsi | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
index 54bc6d3cf290..40f4ad3c34c6 100644
--- a/arch/arm/boot/dts/spear1310.dtsi
+++ b/arch/arm/boot/dts/spear1310.dtsi
@@ -98,6 +98,7 @@
 			device_type = "pci";
 			ranges = <0x81000000 0 0	 0x80020000 0 0x00010000   /* downstream I/O */
 				0x82000000 0 0x80030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
 			status = "disabled";
 		};
 
@@ -116,6 +117,7 @@
 			device_type = "pci";
 			ranges = <0x81000000 0 0  0x90020000 0 0x00010000   /* downstream I/O */
 				0x82000000 0 0x90030000 0x90030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
 			status = "disabled";
 		};
 
@@ -134,6 +136,7 @@
 			device_type = "pci";
 			ranges = <0x81000000 0 0	 0xc0020000 0 0x00010000   /* downstream I/O */
 				0x82000000 0 0xc0030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index df2232d767ed..5f347054527d 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -63,6 +63,7 @@
 			device_type = "pci";
 			ranges = <0x81000000 0 0	 0x80020000 0 0x00010000   /* downstream I/O */
 				0x82000000 0 0x80030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
 			status = "disabled";
 		};
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
