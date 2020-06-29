Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96687C433E5
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F46C206A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePlik7Ay"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgF2Vz7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391537AbgF2VzO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 17:55:14 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB56C061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 14:55:14 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x62so14119797qtd.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pxT9s3EqTCXsQUMXPgZ+Qokg9lpeo3j26jsBumMOCzU=;
        b=ePlik7Ay+GtphgAve5CAj2xfrx1QbFpyLuV9Kb/NolXB4GJ6mN4x6SRxTM05MGUGZY
         L4JZ2AaAOqXVSjnHzBhFG+eeT3JCYJC523zT6LjjUgSNeraRgXk9GqCqY/YXUxqy+m8B
         SvUnn6W46acMHTKbrVac5HEJsCyseTx8/oV4zMHcpF8MN3Si9Whw0hHem8MPQCmc+ZvM
         5bvmjwAMijkPprReMHxkI4EW3ylkqa2qHtGA+k9oxE65VsKYB05gqamw99Z6lY2FX+OT
         YfaZ7oV+3hYgj4pOtKqkmrWq9RxH7URle7h/3iPWsuTwL77xzRMq8i4a73VET+ZHF4dd
         O3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pxT9s3EqTCXsQUMXPgZ+Qokg9lpeo3j26jsBumMOCzU=;
        b=GluAPx/L6TJiwUpCcx78xOcAAVEp8dZKbU7rLjQUg136VlhBWRGQY/tZfLQRwztnvP
         h9REwKZfazg2t+Yuw0d0P41Onj6NCC4QgYbSMlWRFE7pCS4eP+Rn7IACSBDI65gGZfhE
         W8ssbP1+c2JHGVfkx5XDeUavWfHnv7t52ogFy3uSV27YwLwFJ7TVBTQGCLn83I+jrR5O
         GH2C6mBOOwCr9kVLkkEvou4Pvozzxlg7kjart+/3eGNFnhV+e9/RbSiOtsiKdec1WMxD
         hesNf6sM9Fb77jp8NN3dS2dHvjoNYcwVw22Zjif3lgADahviw1yh5v+tFi92d9YRVNnJ
         1obA==
X-Gm-Message-State: AOAM532IKIXebp5Fdevej8JJbQTSRSEWkeDvH9k8K295uWO+aiGRLe00
        nIYWSITSThdT1Z1cTfR57qs=
X-Google-Smtp-Source: ABdhPJxIHZpJNY5deu/0qCP2zBVuz+QM1abOEiGajD0jG0PAcaTa16luYlmNk9g12tIeL52RqwDZHg==
X-Received: by 2002:aed:2c23:: with SMTP id f32mr18080683qtd.164.1593467713391;
        Mon, 29 Jun 2020 14:55:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
        by smtp.gmail.com with ESMTPSA id d19sm1185983qko.114.2020.06.29.14.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:55:12 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sam@ravnborg.org
Cc:     robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: display: arm: versatile: Pass the sysreg unit name
Date:   Mon, 29 Jun 2020 18:55:00 -0300
Message-Id: <20200629215500.18037-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Pass the sysreg unit name to fix the following warning seen with
'make dt_binding_check':

Warning (unit_address_vs_reg): /example-0/sysreg: node has a reg or ranges property, but no unit name

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../bindings/display/panel/arm,versatile-tft-panel.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
index 41fd5713c156..be69e0cc50fc 100644
--- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -33,7 +33,7 @@ additionalProperties: false
 
 examples:
   - |
-    sysreg {
+    sysreg@0 {
         compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
         reg = <0x00000 0x1000>;
 
-- 
2.17.1

