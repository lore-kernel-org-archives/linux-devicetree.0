From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/54] MAINTAINERS: Add file patterns for qcom device tree bindings
Date: Sun, 22 May 2016 11:05:41 +0200
Message-ID: <1463907991-7916-5-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-soc@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80d97eebcccec449..ea4e25a2f188aca1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1524,6 +1524,7 @@ M:	David Brown <david.brown@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-soc@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom-*.dts
 F:	arch/arm/boot/dts/qcom-*.dtsi
 F:	arch/arm/mach-qcom/
-- 
1.9.1
