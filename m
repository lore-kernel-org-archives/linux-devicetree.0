Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3D9C35660
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C9A7206EF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgBUTfk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 14:35:40 -0500
Received: from foss.arm.com ([217.140.110.172]:46660 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgBUTfj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 14:35:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F289101E;
        Fri, 21 Feb 2020 11:35:39 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B57D83F6CF;
        Fri, 21 Feb 2020 11:35:38 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] dt-bindings: ARM: Clean up PMU compatible list
Date:   Fri, 21 Feb 2020 19:35:30 +0000
Message-Id: <397df7accd295d2f743830591facbd2fb99208af.1582312530.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
In-Reply-To: <cover.1582312530.git.robin.murphy@arm.com>
References: <cover.1582312530.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The "alpha by vendor, reverse-alpha by model" sorting of compatibles
that we seem to have ended up with is decidedly odd. Make it less so.

Also copy the comment from the generic "arm,armv8" CPU binding to help
clarify that the "arm,armv8-pmuv3" binding is rather intended to be a
counterpart to that, for describing implementations without a specific
microarchitecture like the AEMv8 software model.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v3: new - can be squashed or reordered with #2/5 if desired

 .../devicetree/bindings/arm/pmu.yaml          | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index cc52195d0e9e..97df36d301c9 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -20,36 +20,36 @@ properties:
     items:
       - enum:
           - apm,potenza-pmu
-          - arm,armv8-pmuv3
-          - arm,neoverse-n1-pmu
-          - arm,neoverse-e1-pmu
-          - arm,cortex-a77-pmu
-          - arm,cortex-a76-pmu
-          - arm,cortex-a75-pmu
-          - arm,cortex-a73-pmu
-          - arm,cortex-a72-pmu
-          - arm,cortex-a65-pmu
-          - arm,cortex-a57-pmu
-          - arm,cortex-a55-pmu
-          - arm,cortex-a53-pmu
-          - arm,cortex-a35-pmu
-          - arm,cortex-a34-pmu
-          - arm,cortex-a32-pmu
-          - arm,cortex-a17-pmu
-          - arm,cortex-a15-pmu
-          - arm,cortex-a12-pmu
-          - arm,cortex-a9-pmu
-          - arm,cortex-a8-pmu
-          - arm,cortex-a7-pmu
-          - arm,cortex-a5-pmu
-          - arm,arm11mpcore-pmu
-          - arm,arm1176-pmu
+          - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
+          - arm,arm1176-pmu
+          - arm,arm11mpcore-pmu
+          - arm,cortex-a5-pmu
+          - arm,cortex-a7-pmu
+          - arm,cortex-a8-pmu
+          - arm,cortex-a9-pmu
+          - arm,cortex-a12-pmu
+          - arm,cortex-a15-pmu
+          - arm,cortex-a17-pmu
+          - arm,cortex-a32-pmu
+          - arm,cortex-a34-pmu
+          - arm,cortex-a35-pmu
+          - arm,cortex-a53-pmu
+          - arm,cortex-a55-pmu
+          - arm,cortex-a57-pmu
+          - arm,cortex-a65-pmu
+          - arm,cortex-a72-pmu
+          - arm,cortex-a73-pmu
+          - arm,cortex-a75-pmu
+          - arm,cortex-a76-pmu
+          - arm,cortex-a77-pmu
+          - arm,neoverse-e1-pmu
+          - arm,neoverse-n1-pmu
           - brcm,vulcan-pmu
           - cavium,thunder-pmu
+          - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
-          - qcom,krait-pmu
 
   interrupts:
     # Don't know how many CPUs, so no constraints to specify
-- 
2.23.0.dirty

