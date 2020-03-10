Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC70C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4157024681
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1jmB1G5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgCJGfP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 02:35:15 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54794 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgCJGfO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 02:35:14 -0400
Received: by mail-pj1-f66.google.com with SMTP id np16so2966pjb.4
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R9+Cz75X2xC9BKj2OQiTJ8bjAVhl/I7+7z1qVqyLDrM=;
        b=V1jmB1G5Zlkt0ryXphg23tulWUgLBoqk2rhFKHNbVsBmULNHNahNbtQvfwHnQ4k5Cg
         suhvai42EuD2RVxCidOf0goKxu5QLX3VPPpFjGY9IjXUQiOF3zEpiGj2lb2ZFopnXm4/
         mGQOrOHJVNNheEpS+uI5Ebb4fE1YLY2FFxXnBb9xHHG0N1k6U0HTsSPTxsNgbGAsaEly
         dd2KEAmWEaygTR71maEKvGLDo+ljqPWuVVq3Msqy2b5Z+yPRfcP4zJhm/irYg9oECXSA
         N+GZBgEJp+tBRBeHNoiA+wtuNkgFX4IJdxDMgoeSwi0vvX1vp6MGq73YhqzG7mcLj6iJ
         VM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R9+Cz75X2xC9BKj2OQiTJ8bjAVhl/I7+7z1qVqyLDrM=;
        b=h5zUWtbDjvLiD8T0B9pCvIEibDMYY8NF1h/mWbxMXwLWpczozeel684LhbJeOCC4Hc
         RCqhzgFoNNrp2jdgWDRx69S8Fj32VGm6+MFFvoPG2R98awsiWhG9l6xe9OGEc67sibeq
         uMBWXeZJRh22BbJNN7vw+oIytO5nkTwEsMr8b/71TcTxlmhCaCxmUocwO1vLKo17YZJK
         1ZClbZ5RxqD8qh5homUeVCK7v4JfY5TfCMm872mdFKTCDAcnZJZb5FHG3dTV0QxD9a1V
         AKw+YEo0+q0RYYVZsMd54jjHO3PtfOUT/bh+MgKvabxP+vGxDxzT9cMSLbJ76EmUir1s
         UKJA==
X-Gm-Message-State: ANhLgQ06V35IbyNmwm4iAdHK+Vf4CxK+3/YAk8Bn+fAkb60HQE7MWPVf
        h71tpil5zwu4XDdR6CB7Hh2Xlw==
X-Google-Smtp-Source: ADFU+vsrwfcreJGQ+JSaDzsnazWGtLpAqzN4oLxDhrwI8e8/gJeU2YtogiZdY8SY5DsYgbH7uyK/gQ==
X-Received: by 2002:a17:902:d70e:: with SMTP id w14mr18532590ply.181.1583822111887;
        Mon, 09 Mar 2020 23:35:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Mon,  9 Mar 2020 23:33:34 -0700
Message-Id: <20200310063338.3344582-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a devicetree binding for the Qualcomm peripheral image loader
relocation information region found in the IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
- Fixed spelling mistakes pointed out by Mathieu
- Fixed description as requested by Stephen
- Specify unit address in example
- Add missing ranges in example

 .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..44d87fd2a07e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -0,0 +1,44 @@
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
+  The Qualcomm peripheral image loader relocation memory region, in IMEM, is
+  used for communicating remoteproc relocation information to post mortem
+  debugging tools.
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
+      ranges = <0 0 0x146bf000 0x1000>;
+
+      pil-reloc@94c {
+        compatible = "qcom,pil-reloc-info";
+        reg = <0x94c 0xc8>;
+      };
+    };
+...
-- 
2.24.0

