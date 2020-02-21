Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E596C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 110AB24650
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgBUTfl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 14:35:41 -0500
Received: from foss.arm.com ([217.140.110.172]:46670 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbgBUTfl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 14:35:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E2EB106F;
        Fri, 21 Feb 2020 11:35:40 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B29E33F6CF;
        Fri, 21 Feb 2020 11:35:39 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] arm64: perf: Refactor PMU init callbacks
Date:   Fri, 21 Feb 2020 19:35:31 +0000
Message-Id: <acd2f12447f8ca2fdfe2b161fc41dc84fee90471.1582312530.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
In-Reply-To: <cover.1582312530.git.robin.murphy@arm.com>
References: <cover.1582312530.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The PMU init callbacks are already drowning in boilerplate, so before
doubling the number of supported PMU models, give it a sensible refactor
to significantly reduce the bloat, both in source and object code.
Although nobody uses non-default sysfs attributes today, there's minimal
impact to preserving the notion that maybe, some day, somebody might, so
we may as well keep up appearances.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: new

 arch/arm64/kernel/perf_event.c | 124 +++++++--------------------------
 1 file changed, 27 insertions(+), 97 deletions(-)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index e40b65645c86..1e0b04da2f3a 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -953,7 +953,10 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
 	return probe.present ? 0 : -ENODEV;
 }
 
-static int armv8_pmu_init(struct arm_pmu *cpu_pmu)
+static int armv8_pmu_init(struct arm_pmu *cpu_pmu, char *name,
+			  int (*map_event)(struct perf_event *event),
+			  const struct attribute_group *events,
+			  const struct attribute_group *format)
 {
 	int ret = armv8pmu_probe_pmu(cpu_pmu);
 	if (ret)
@@ -972,135 +975,62 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->set_event_filter	= armv8pmu_set_event_filter;
 	cpu_pmu->filter_match		= armv8pmu_filter_match;
 
+	cpu_pmu->name			= name;
+	cpu_pmu->map_event		= map_event;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = events ?
+			events : &armv8_pmuv3_events_attr_group;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = format ?
+			format : &armv8_pmuv3_format_attr_group;
+
 	return 0;
 }
 
 static int armv8_pmuv3_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_pmuv3";
-	cpu_pmu->map_event		= armv8_pmuv3_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_pmuv3",
+			      armv8_pmuv3_map_event, NULL, NULL);
 }
 
 static int armv8_a35_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cortex_a35";
-	cpu_pmu->map_event		= armv8_a53_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a35",
+			      armv8_a53_map_event, NULL, NULL);
 }
 
 static int armv8_a53_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cortex_a53";
-	cpu_pmu->map_event		= armv8_a53_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a53",
+			      armv8_a53_map_event, NULL, NULL);
 }
 
 static int armv8_a57_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cortex_a57";
-	cpu_pmu->map_event		= armv8_a57_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a57",
+			      armv8_a57_map_event, NULL, NULL);
 }
 
 static int armv8_a72_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cortex_a72";
-	cpu_pmu->map_event		= armv8_a57_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a72",
+			      armv8_a57_map_event, NULL, NULL);
 }
 
 static int armv8_a73_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cortex_a73";
-	cpu_pmu->map_event		= armv8_a73_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a73",
+			      armv8_a73_map_event, NULL, NULL);
 }
 
 static int armv8_thunder_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_cavium_thunder";
-	cpu_pmu->map_event		= armv8_thunder_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_cavium_thunder",
+			      armv8_thunder_map_event, NULL, NULL);
 }
 
 static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
 {
-	int ret = armv8_pmu_init(cpu_pmu);
-	if (ret)
-		return ret;
-
-	cpu_pmu->name			= "armv8_brcm_vulcan";
-	cpu_pmu->map_event		= armv8_vulcan_map_event;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] =
-		&armv8_pmuv3_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] =
-		&armv8_pmuv3_format_attr_group;
-
-	return 0;
+	return armv8_pmu_init(cpu_pmu, "armv8_brcm_vulcan",
+			      armv8_vulcan_map_event, NULL, NULL);
 }
 
 static const struct of_device_id armv8_pmu_of_device_ids[] = {
-- 
2.23.0.dirty

