From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v13 4/9] MAINTAINERS: update file entries for Coresight subsystem
Date: Thu, 25 May 2017 23:57:11 +0800
Message-ID: <1495727836-30094-5-git-send-email-leo.yan@linaro.org>
References: <1495727836-30094-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495727836-30094-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Mike Leach <mike.leach@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Update document file entries for Coresight debug module.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e98464..8623d95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1207,7 +1207,9 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
 F:	Documentation/trace/coresight.txt
+F:	Documentation/trace/coresight-cpu-debug.txt
 F:	Documentation/devicetree/bindings/arm/coresight.txt
+F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
 F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
 F:	tools/perf/arch/arm/util/pmu.c
 F:	tools/perf/arch/arm/util/auxtrace.c
-- 
2.7.4
