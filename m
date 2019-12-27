Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46128C47409
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 04:43:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 155EB20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 04:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ZP/W5R9l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfL0EnI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Dec 2019 23:43:08 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59813 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727050AbfL0EnH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Dec 2019 23:43:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577421786; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=L2xCTFb1KKVVbyKUF8I+cQkkxG/XDSdOrf8N1/4TN3I=; b=ZP/W5R9lfvZ4nRGiSm7udFjdqE+vXhImlHAwfOavwSDm1Ut8kGugV22izwVCEV8Nb0AV/EPg
 JAv9KuK/WVedrZZCBUDyEHs96GIZOoDGgdeEufEBoj5M/00SXzRaRHnLMaA0ljPmglfS6JmZ
 FmIH4UCCcSWolC6w/0EaQC8yUCc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e058bd9.7f5e9864bd50-smtp-out-n01;
 Fri, 27 Dec 2019 04:43:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E77D2C433A2; Fri, 27 Dec 2019 04:43:04 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4097DC43383;
        Fri, 27 Dec 2019 04:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4097DC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
Date:   Fri, 27 Dec 2019 10:12:38 +0530
Message-Id: <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The MSS clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,mss.yaml        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
new file mode 100644
index 0000000..05efe2b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Modem Clock Controller Binding
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm modem clock control module which supports the clocks.
+
+properties:
+  compatible :
+    enum:
+       - qcom,sc7180-mss
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  additionalItems: false
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+examples:
+  # Example of MSS with clock nodes properties for SC7180:
+  - |
+    clock-controller@41aa000 {
+      compatible = "qcom,sc7180-mss";
+      reg = <0x041aa000 0x100>;
+      #clock-cells = <1>;
+    };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
