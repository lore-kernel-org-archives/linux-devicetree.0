From: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] arm64: dts: hip05: Append all gicv3 ITS entries
Date: Fri, 29 Jan 2016 16:39:03 +0800
Message-ID: <1454056746-5048-4-git-send-email-wangkefeng.wang@huawei.com>
References: <1454056746-5048-1-git-send-email-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454056746-5048-1-git-send-email-wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are four subsystems in hip05 soc, peri/m3/pcie/dsa,
each subsystem has one its, append them under gicv3 node.

They will be used by hisilicon mbigen.

Signed-off-by: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip05.dtsi | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
index ed31f19..c1b1a32 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -246,11 +246,29 @@
 		      <0x0 0xfe020000 0 0x10000>;       /* GICV */
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
-		its_totems: interrupt-controller@8c000000 {
+		its_peri: interrupt-controller@8c000000 {
 			compatible = "arm,gic-v3-its";
 			msi-controller;
 			reg = <0x0 0x8c000000 0x0 0x40000>;
 		};
+
+		its_m3: interrupt-controller@a3000000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x0 0xa3000000 0x0 0x40000>;
+		};
+
+		its_pcie: interrupt-controller@b7000000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x0 0xb7000000 0x0 0x40000>;
+		};
+
+		its_dsa: interrupt-controller@c6000000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x0 0xc6000000 0x0 0x40000>;
+		};
 	};
 
 	timer {
-- 
2.6.0.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
