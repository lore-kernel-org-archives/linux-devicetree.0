Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B8CC352A4
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AA0220848
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mhpZK9Re"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgBKAwL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 19:52:11 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33305 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbgBKAwL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 19:52:11 -0500
Received: by mail-pl1-f195.google.com with SMTP id ay11so3540348plb.0
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 16:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IhizcQrNZHXbgWrj4mKBKUeank5/j0aTe0/Ly1U0jwc=;
        b=mhpZK9ReyC64uuztvB4v7YaBTqMJAe6TRYWjAodSBc/5XTN1Ilado6v2YZPycAQxl3
         0GbVg6arqhwfH/YL/u4kwISo5kJyu3cp4ent7GxbNQxq1HTOX/VV2W3ItRp9h+MGPRgH
         aLobregRui7wcZ3+jwYzs6uw+Ow5mmtvX8ndSodWujw7dgCq4IPnz+iTF+sX+gM/Z+ty
         NuIdZCXW114xgLNbZQMAUSap6aB4yxHDrURLAFiERE2ITS49TauTO13dzFtasIJlKvpi
         DcN5N0larLZ5O4NASnuCamLOShDDwEGKGhTh7TPB1YkF1G1dYWjhw3uVJ5IEaIQ96xsH
         04pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IhizcQrNZHXbgWrj4mKBKUeank5/j0aTe0/Ly1U0jwc=;
        b=nssxAlF6ODutX2VgHuMj1xUNZWA1ds69nemam3+oIfM/9Hjr6Sjk9hcTS/XL7odg2m
         99GwgOk/gXR6HSAHaQIQkRF34K3ghhScnXOQcmyqqMAaoZbWsa/arWEirbQGi/NgZrkx
         GvM/O010yuiivcb22CRx5POWVhChyUOWkkCalF+CNBmqOfcCttv2CMFthtMPH/s99L/e
         rzBt4go5Uv6qKHKK4CW5l4KA4vMYx98edv4UpHpUamSmwLnFxOHvE9pY6RPnLYcDM5Q6
         FFfiEd5KSk8GRXQRhQvw9y2b9Efoft/CTBZ48C9+ndIY3pbgFcb90yfsph5jpNHUGknU
         uPiw==
X-Gm-Message-State: APjAAAXo39Q5x0ow88gPY687yffPfGKoT/VPyBV1FeConRbZGvwTohbI
        nAWNEeoZxQbq9e6s8Vvrnat+Ig==
X-Google-Smtp-Source: APXvYqxcoMxw31IIUUXxZP96/pN8wPjnmV1c/wvB8rNFxyk6baM5maVAEa1ii5AJl89QxhN29phprQ==
X-Received: by 2002:a17:902:9a8c:: with SMTP id w12mr615147plp.149.1581382330138;
        Mon, 10 Feb 2020 16:52:10 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Mon, 10 Feb 2020 16:50:52 -0800
Message-Id: <20200211005059.1377279-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a devicetree binding for the Qualcomm periperal image loader
relocation info region found in the IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replaced offset with reg to describe the region of IMEM used for the entries

 .../bindings/remoteproc/qcom,pil-info.yaml    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..8386a4da6030
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm peripheral image loader relocation info binding
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This document defines the binding for describing the Qualcomm peripheral
+  image loader relocation memory region, in IMEM, which is used for post mortem
+  debugging of remoteprocs.
+
+properties:
+  compatible:
+    const: qcom,pil-reloc-info
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    imem@146bf000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0 0x146bf000 0 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pil-reloc {
+        compatible ="qcom,pil-reloc-info";
+        reg = <0x94c 200>;
+      };
+    };
+...
-- 
2.24.0

