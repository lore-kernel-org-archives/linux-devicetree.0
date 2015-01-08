From: Feng Kan <fkan@apm.com>
Subject: [PATCH V3 6/7] Documentation: arm: pmu: Add Potenza PMU binding
Date: Wed,  7 Jan 2015 17:33:37 -0700
Message-ID: <1420677218-30743-7-git-send-email-fkan@apm.com>
References: <1420677218-30743-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420677218-30743-1-git-send-email-fkan@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: patches@apm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>, Vinayak Kale <vkale@apm.com>
List-Id: devicetree@vger.kernel.org

This patch documents the compatible string for APM X-Gene Potenza CPU's PMU.

Signed-off-by: Vinayak Kale <vkale@apm.com>
Signed-off-by: Feng Kan <fkan@apm.com>
---
 Documentation/devicetree/bindings/arm/pmu.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
index 75ef91d..6d268b3 100644
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/pmu.txt
@@ -7,6 +7,7 @@ representation in the device tree should be done as under:-
 Required properties:
 
 - compatible : should be one of
+	"apm,potenza-pmu"
 	"arm,armv8-pmuv3"
 	"arm,cortex-a17-pmu"
 	"arm,cortex-a15-pmu"
-- 
1.7.1
