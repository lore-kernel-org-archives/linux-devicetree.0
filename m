Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B9FC3F2D7
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CF552073D
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4WeVLCj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbgCCPIG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:08:06 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38820 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbgCCPIG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 10:08:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id x22so2000104lff.5
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 07:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/NDACQevUaDc6JLaPGhMJ8UIpdipROa3WbiIGkpAEKo=;
        b=T4WeVLCjzQGfNUrES9Hy941MNj53A0yQWbbAPWTiPENyy1q1vpfzLRYqgm7ZJZQABy
         n+t9IXXQ7k6vZ+zUAh62pucstlgWBz/uF9VNQM44sUO7whZqXxMo85IQZT81qliVMizQ
         EzNMzQgacBQyzjLqjyxeGcTKGbWRyVSM7ZLqcsXGXlBSyPiUROa/VZQjo/Z8dLIHLlCq
         WeRU8WycVDsUECgE480sgW58hWtWUSyIG4TRTLVzh1WYazOzYYyichLNmT2WsEdetIuF
         j6weAufoJjq/B4ZsvsvymH2zVRnn4ENR5tsItmkzrxFQe0CmrvtMRL4IdtqwsOvwbKPP
         B+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/NDACQevUaDc6JLaPGhMJ8UIpdipROa3WbiIGkpAEKo=;
        b=pJGUMV6kB0SX4fjbng86UORrU8Nojt5KlDKLnKCy7IiJrW7dbicQdChvKfIkZYm2DJ
         EEcQCbdXqpCBYVa7VxrVuZwKHu71JHh9GC0GTwPE/xH2Xs/RKlS1KyZRefMCO0zqHEe7
         cRIAdx59pem+P+vf/DE5hUEpIfkaqHEiH4N8/R8nNBv3rHaoOfwxxmpi++bo4zK0Epho
         MFFfEBnY7VMgeMy3KW7CZwzgNw9u8GG4+bUme1R9XJlyzg810LeZU21A2DX3yswROjdo
         xs0O32E3bvQuzlxBeCJEm0106BMYajqrg+w75l8YJWRNJXLHuMlshoYBlqHVyYIvF9VI
         8+7A==
X-Gm-Message-State: ANhLgQ3PXhlvr23jsWahdK7gFbT0Nyj9AIXFinOiw2ZiRryQ6T+Fv1P5
        guoz5M9sc4ob/YgW6Xe9hsrjSQ==
X-Google-Smtp-Source: ADFU+vuGkkQiguth40cp1bw44U/CLR3j6mkPP+xXUr5/Vlp3zdPzogFaLS0srx11FKpgV5fWvZTJhg==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr2953144lfn.148.1583248083583;
        Tue, 03 Mar 2020 07:08:03 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id n189sm12143135lfa.14.2020.03.03.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 07:08:02 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        devicetree@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: arm: Fixup the DT bindings for hierarchical PSCI states
Date:   Tue,  3 Mar 2020 16:07:47 +0100
Message-Id: <20200303150749.30566-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303150749.30566-1-ulf.hansson@linaro.org>
References: <20200303150749.30566-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The hierarchical topology with power-domain should be described through
child nodes, rather than as currently described in the PSCI root node. Fix
this by adding a patternProperties with a corresponding reference to the
power-domain DT binding.

Additionally, update the example to conform to the new pattern, but also to
the adjusted domain-idle-state DT binding.

Fixes: a3f048b5424e ("dt: psci: Update DT bindings to support hierarchical PSCI states")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 .../devicetree/bindings/arm/psci.yaml         | 33 +++++++++----------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0bc3c43a525a..cae668b61265 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -102,11 +102,15 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/arm/idle-states.yaml
 
-  "#power-domain-cells":
-    description:
-      The number of cells in a PM domain specifier as per binding in [3].
-      Must be 0 as to represent a single PM domain.
+required:
+  - compatible
+  - method
 
+patternProperties:
+  "^(power-controller|power-domain)([@-].*)?$":
+    $ref: "../power/power-domain.yaml#"
+    type: object
+    description: |
       ARM systems can have multiple cores, sometimes in an hierarchical
       arrangement. This often, but not always, maps directly to the processor
       power topology of the system. Individual nodes in a topology have their
@@ -122,19 +126,9 @@ properties:
       helps to implement support for OSI mode and OS implementations may choose
       to mandate it.
 
-      [3] Documentation/devicetree/bindings/power/power_domain.txt
+      [3] Documentation/devicetree/bindings/power/power-domain.yaml
       [4] Documentation/devicetree/bindings/power/domain-idle-state.yaml
 
-  power-domains:
-    $ref: '/schemas/types.yaml#/definitions/phandle-array'
-    description:
-      List of phandles and PM domain specifiers, as defined by bindings of the
-      PM domain provider.
-
-required:
-  - compatible
-  - method
-
 allOf:
   - if:
       properties:
@@ -224,6 +218,9 @@ examples:
           exit-latency-us = <10>;
           min-residency-us = <100>;
         };
+      };
+
+      domain-idle-states {
 
         CLUSTER_RET: cluster-retention {
           compatible = "domain-idle-state";
@@ -247,19 +244,19 @@ examples:
       compatible = "arm,psci-1.0";
       method = "smc";
 
-      CPU_PD0: cpu-pd0 {
+      CPU_PD0: power-domain-cpu0 {
         #power-domain-cells = <0>;
         domain-idle-states = <&CPU_PWRDN>;
         power-domains = <&CLUSTER_PD>;
       };
 
-      CPU_PD1: cpu-pd1 {
+      CPU_PD1: power-domain-cpu1 {
         #power-domain-cells = <0>;
         domain-idle-states =  <&CPU_PWRDN>;
         power-domains = <&CLUSTER_PD>;
       };
 
-      CLUSTER_PD: cluster-pd {
+      CLUSTER_PD: power-domain-cluster {
         #power-domain-cells = <0>;
         domain-idle-states = <&CLUSTER_RET>, <&CLUSTER_PWRDN>;
       };
-- 
2.20.1

