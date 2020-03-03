Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14DDC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9841A208C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPul6xha"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgCCPIE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:08:04 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40279 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgCCPIE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 10:08:04 -0500
Received: by mail-lf1-f65.google.com with SMTP id p5so3040546lfc.7
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 07:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oH2DPw9yOnkNvy1Ktf77A4iViJfMOE/P09y2cJqfUP0=;
        b=mPul6xhaNAuxo8T2+NE+xGn8787mHR5kxItdLJQJgLjWA7RHBJv120FuQ0vlz6JeMi
         L86z/EMCuNHoLke+7BgdQPJLpMsDrJY4PNNIR4KHK/5id2D6YAD4T+9SbyZ/nEvaDU+3
         epDaF59obqiYBlfBmYhFIi5QVk/ZNTprB/WeyY83K/5ILFe5xaQ2Vj9aVWajv4R+iESZ
         JeO21O78P8bErOdDEp5lNIkLGaGrtMc/pQ4/tusG+B/6aOnA0XkiAi90SxaWaztVSOHj
         1sBD75JH05+mvHNLxdeTL1b7Th5uQowbmcuJJDknrkNnHyWmwp8THQeBzYamGO3C+TyE
         o/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oH2DPw9yOnkNvy1Ktf77A4iViJfMOE/P09y2cJqfUP0=;
        b=bzJQzVzJ7GMBPetao1X0pDPRw7s3cX9xroZhl3u87uqH+7HmLnZt1LRJjYQkxo9iCK
         t1xx7GOhWAVlTFH+utiGP61YWSV64HHINiJFCEFo+EB/6EPJ8NOc0mQQx370wMNHvJ4K
         Nbh41G6gxByEiRKYfcr24Q4DuHV8mNgy9k8zj67n5DDP0wD4/tEg+Cd7SjT0BVeL2i6A
         Zze6St2ATPEUSE+sEaGrT8V5kISIb9SSdDsbem2c5xlXYnkSzfTiuLrOczqxTE2YpD5m
         R/1aFcLQ6QyxkRzo4lyIvV1sI0JT5eHElntSm4E+WRs7FYrVSbkekRJ2lmBN6rEl0Ufw
         X5Og==
X-Gm-Message-State: ANhLgQ2OjRPb7Tykzloks5CGAsVrnzYyTlgDGjZS0Ds6RpcMICVYIwgS
        bXyCub+EalKq5ZU6/7WWu9hJSA==
X-Google-Smtp-Source: ADFU+vvodELrLn3K9Dksie5B3U4dnmjJWJrhxSD42Lo+ggn0ROi0yWlkIY+w/726ufnV7RZRHghSUw==
X-Received: by 2002:ac2:5ca5:: with SMTP id e5mr2984605lfq.122.1583248082142;
        Tue, 03 Mar 2020 07:08:02 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id n189sm12143135lfa.14.2020.03.03.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 07:08:01 -0800 (PST)
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
Subject: [PATCH 4/7] dt-bindings: power: Extend nodename pattern for power-domain providers
Date:   Tue,  3 Mar 2020 16:07:46 +0100
Message-Id: <20200303150749.30566-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303150749.30566-1-ulf.hansson@linaro.org>
References: <20200303150749.30566-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The existing binding requires the nodename to have a '@', which is a bit
limiting for the wider use case. Therefore, let's extend the pattern to
allow either '@' or '-'.

Additionally, let's update one of the examples to show how the updated
pattern could be used.

Fixes: a3f048b5424e ("dt: psci: Update DT bindings to support hierarchical PSCI states")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 Documentation/devicetree/bindings/power/power-domain.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
index 207e63ae10f9..dc232759013e 100644
--- a/Documentation/devicetree/bindings/power/power-domain.yaml
+++ b/Documentation/devicetree/bindings/power/power-domain.yaml
@@ -25,7 +25,7 @@ description: |+
 
 properties:
   $nodename:
-    pattern: "^(power-controller|power-domain)(@.*)?$"
+    pattern: "^(power-controller|power-domain)([@-].*)?$"
 
   domain-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -71,13 +71,13 @@ required:
 
 examples:
   - |
-    power: power-controller@12340000 {
-        compatible = "foo,power-controller";
+    power: power-domain-foo {
+        compatible = "foo,power-domain";
         reg = <0x12340000 0x1000>;
         #power-domain-cells = <1>;
     };
 
-    // The node above defines a power controller that is a PM domain provider and
+    // The node above defines a power domain that is a PM domain provider and
     // expects one cell as its phandle argument.
 
   - |
-- 
2.20.1

