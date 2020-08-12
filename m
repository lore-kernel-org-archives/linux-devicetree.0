Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7DEC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 108422053B
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sA2/JxzA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgHLHGr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 03:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLHGr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 03:06:47 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A7AC06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 00:06:44 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id m22so1066320ljj.5
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1K3oBY2TmVMmKmOQPQU9rGoPDuwC0BKmISYgxAAqZh0=;
        b=sA2/JxzA87QKxFrPbrsRcibJjyOop9YGxHZfHVpWBOhpNgNBqF2M99mhzFO5usLltA
         yCCieRwGJQ/Yz1qJniQBW62M4N/xu4mtFydfjbsroic7Qefl1yGqesIC/YTD0aN0RLb7
         ctNAU3Ky8WocEYoPfnwd9+KZvgo6jYRwv8PfRH6l0riaFQsbqMqlPv2aOLlDTN0wfct0
         l//OWg5HMlmaT0EWOoaKeUgagXCqZuIviho+rfl31HGYSMpuXsHQwBaUKok7bhrXlefp
         AgXIcIMTFWzihEfQoEjqVaGgtbIgIxmp47OqxXypL9Lgs3lF6rQ13ZKlFv6n33XY16n7
         iVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1K3oBY2TmVMmKmOQPQU9rGoPDuwC0BKmISYgxAAqZh0=;
        b=IdYbwPMrwvUqOrGvuOeiXJpEaWQX5WmIutgqiGe1HQlQSlSEgFoT5Ol9lv71WnzEQm
         cCY5x6EnA6vTI2KlvIvC0r6A5xJ2hc7JiqPf+KO2eCDxzlM0kWvp1q5hL//LlTh7h+EA
         z+c+fA7WP0pkCa9N/6g7ES9c5x72rIshLlwv4pcr8m73QgZM8s175AR1clbZSc/IdDmG
         J8rrxN4NorClaa1ygcr0RHIGhVgzV/gSTHES318Bkq+2/KJrxmdIXk99ULGf0PNgMHla
         88qWx6crU5QA7n9j2Wv1bf+qlWdT+DmASP2YDQQhDnwzuLEXM4QhLtwBapz7uiYMLdmw
         Y6xw==
X-Gm-Message-State: AOAM533ZGg4QRLWDmS9hCL6ETYHQse5rnes6HeFMtyN9LzsqyOwJjCL8
        F6BSvJpQeMbxgw4FSijQwiMd1mFX8ko=
X-Google-Smtp-Source: ABdhPJzH6F+S+xoXqrRl1v1JHzHUOLZcg1CROsMwfaQqhrUi6WDHKFvTmk4NPXCT/bYpEAFBywq+LA==
X-Received: by 2002:a2e:b00f:: with SMTP id y15mr4886274ljk.223.1597216003082;
        Wed, 12 Aug 2020 00:06:43 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id s2sm263317lfs.4.2020.08.12.00.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:06:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] dt-bindings: pip command elaboration
Date:   Wed, 12 Aug 2020 09:06:40 +0200
Message-Id: <20200812070640.2543557-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

pip is now for most practical set-ups implied to be pip3, so
just use "pip" rather than "pip3" in the instructions.
Pass --user explicitly in the example so it is clear that this
gets installed in the user home directory.

Add an additional instruction on how to upgrade the project,
not everyone is aware of how pip works.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/writing-schema.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/writing-schema.rst b/Documentation/devicetree/writing-schema.rst
index 8c74a99f95e2..a9cebfca8d31 100644
--- a/Documentation/devicetree/writing-schema.rst
+++ b/Documentation/devicetree/writing-schema.rst
@@ -115,11 +115,16 @@ The DT schema project must be installed in order to validate the DT schema
 binding documents and validate DTS files using the DT schema. The DT schema
 project can be installed with pip::
 
-    pip3 install git+https://github.com/devicetree-org/dt-schema.git@master
+    pip install --user git+https://github.com/devicetree-org/dt-schema.git@master
 
 Several executables (dt-doc-validate, dt-mk-schema, dt-validate) will be
 installed. Ensure they are in your PATH (~/.local/bin by default).
 
+We sometimes update th DT schema project, and then you can simply add the
+"--upgrade" option to the above command to get to the latest version:
+
+    pip install --user --upgrade git+https://github.com/devicetree-org/dt-schema.git@master
+
 dtc must also be built with YAML output support enabled. This requires that
 libyaml and its headers be installed on the host system. For some distributions
 that involves installing the development package, such as:
-- 
2.26.2

