From: Tai Nguyen <ttnguyen@apm.com>
Subject: [PATCH v10 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
Date: Fri, 15 Jul 2016 10:38:02 -0700
Message-ID: <1468604285-15090-2-git-send-email-ttnguyen@apm.com>
References: <1468604285-15090-1-git-send-email-ttnguyen@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468604285-15090-1-git-send-email-ttnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, will.deacon@arm.com, catalin.marinas@arm.com, joe@perches.com, paul.gortmaker@windriver.com
Cc: dhdang@apm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@apm.com, Tai Nguyen <ttnguyen@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds the MAINTAINERS entry for APM X-Gene SoC PMU driver.

Signed-off-by: Tai Nguyen <ttnguyen@apm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1209323..41938e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -841,6 +841,13 @@ S:	Supported
 F:	drivers/net/ethernet/apm/xgene/
 F:	Documentation/devicetree/bindings/net/apm-xgene-enet.txt
 
+APPLIED MICRO (APM) X-GENE SOC PMU
+M:	Tai Nguyen <ttnguyen@apm.com>
+S:	Supported
+F:	drivers/perf/xgene_pmu.c
+F:	Documentation/perf/xgene-pmu.txt
+F:	Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
+
 APTINA CAMERA SENSOR PLL
 M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-- 
1.9.1
