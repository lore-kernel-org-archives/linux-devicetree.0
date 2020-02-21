Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5849C35640
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 08:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B4EA24670
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 08:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="b4d7Jc45"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731388AbgBUIuf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 03:50:35 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:35937 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730280AbgBUIuf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 03:50:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582275034; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7b7itL5l6V/rBjzQ5OBUu9QenXsui5Azh6HozFoAP/E=; b=b4d7Jc457ir6HY/qADIPqP0uGvCRw60VUBg2JbD32Xs9TvoUgyoP0eG3quiq/ZrExdb4weDj
 2OrzluRIhJiILTSx24EX9Xcxq/jNSx9miKPpJfNJpS+of24ATgwQ7kEjdxcvgh9Ikha9rl9R
 FhldqUwZzPVfGy/46zdikrANgpU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4f99d3.7f386704b570-smtp-out-n02;
 Fri, 21 Feb 2020 08:50:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 673DBC447A2; Fri, 21 Feb 2020 08:50:27 +0000 (UTC)
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE64C433A2;
        Fri, 21 Feb 2020 08:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DE64C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 1/4] dt-bindings: Introduce soc sleep stats bindings for Qualcomm SoCs
Date:   Fri, 21 Feb 2020 14:19:43 +0530
Message-Id: <1582274986-17490-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Add device binding documentation for Qualcomm Technology Inc's (QTI)
SoC sleep stats driver. The driver is used for displaying SoC sleep
statistic maintained by Always On Processor or Resource Power Manager.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 .../bindings/soc/qcom/soc-sleep-stats.yaml         | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
new file mode 100644
index 00000000..50352a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/soc/qcom/soc-sleep-stats.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
+
+maintainers:
+  - Maulik Shah <mkshah@codeaurora.org>
+  - Lina Iyer <ilina@codeaurora.org>
+
+description: |
+  Always On Processor/Resource Power Manager maintains statistics of the SoC
+  sleep modes involving powering down of the rails and oscillator clock.
+
+  Statistics includes SoC sleep mode type, number of times low power mode were
+  entered, time of last entry, time of last exit and accumulated sleep duration.
+  SoC sleep stats driver provides debugfs interface to show this information.
+
+properties:
+  compatible:
+    enum:
+      - qcom,rpmh-sleep-stats
+      - qcom,rpm-sleep-stats
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  # Example of rpmh sleep stats
+  - |
+    rpmh_sleep_stats: soc-sleep-stats@c3f0000 {
+      compatible = "qcom,rpmh-sleep-stats";
+      reg = <0 0xc3f0000 0 0x400>;
+    };
+  # Example of rpm sleep stats
+  - |
+    rpm_sleep_stats: soc-sleep-stats@4690000 {
+      compatible = "qcom,rpm-sleep-stats";
+      reg = <0 0x04690000 0 0x400>;
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
