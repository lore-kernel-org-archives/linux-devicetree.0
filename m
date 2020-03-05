Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75D3C3F2D7
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB36B2072A
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0ZdDzYj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCEWA2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 17:00:28 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44822 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCEWA1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 17:00:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id d9so3207183plo.11
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CfFvioNntMrggtGCDI5jrpVPJ8PPT4+rx+j7q+/B5nM=;
        b=x0ZdDzYjiWorSa3v8XihJmzIhijF8nuLNJ6tbV7nSMhKDJAgnZJb/clz3L4YK2Y/a6
         utsFpaD5XHJ1u5I7XWD5QjA157binNgSDG4UTFh0wAZMZaUGDTH5vhGuH+LVZrzUFGVt
         dfo4w1yAbynOVLBlVNp87UThulMycfrKOZh8nuAuEN75KMqMeLOAhFYo+bjtFRUJVQ8w
         gCRGz+vN/WAbvllaIIZWiURp5HpcQw0IwGO5F5goFX8fhWERWtR3kLUsJSGxCnYSqQok
         +KQ7e25Gmezc7aCZtwtBBvbdZ+CMGhmz4U5czuvr+uFaWda8u1vKDCX7Rj//324XwyH3
         dZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfFvioNntMrggtGCDI5jrpVPJ8PPT4+rx+j7q+/B5nM=;
        b=TbFA6lGmr2v53e1Rk+WBWKDk6WRyLokRy6lT/d8peaLq/cACQ99n811SBI5WuH1wAU
         1JtCbQciN3/lGKy5II+W9jSrCVF+xVhyxNf89CGNLMTFMkOrT4hO6pp9+wGKutzzI33G
         mZu/uDtjb6GYg9b4rtXefeSZ2qodfzZ+53vH+We3W+h2hc1ngKMxesCMK9sxSwowPtfY
         eu4EBUw1CkA5SguK45GXbwdHatCCSDHlY8mVLSo8+yJTOEG+5CwWLuBK4ZZ23c126PsC
         AJmwgW+1f1U8d7Ph06dAzwXtFxQgFBZeNt05l6aDdZqaNMKNfQ1y7vDyVZ2/QvvDw4/J
         eYZg==
X-Gm-Message-State: ANhLgQ1HC1QY4Wvwmh26S2wwofSxlMob71jyM4YkLN+paICeQ+dX6I9m
        u7yDO8UXMpiNgJhPtr9i5BZxpg==
X-Google-Smtp-Source: ADFU+vu9/Ip0YNT9DSKqIM6+MMuTT5h+i0+G0AQRipi+p1ZXgS+BvFJC8M5TPSzO5AMHovunA3hhYQ==
X-Received: by 2002:a17:90a:254d:: with SMTP id j71mr173901pje.169.1583445625135;
        Thu, 05 Mar 2020 14:00:25 -0800 (PST)
Received: from localhost ([103.195.202.232])
        by smtp.gmail.com with ESMTPSA id a3sm9858648pfi.161.2020.03.05.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:00:24 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v1 1/4] dt: psci: Fix cpu compatible property in psci binding example
Date:   Fri,  6 Mar 2020 03:30:12 +0530
Message-Id: <d962c0a5328e72b3dd4a74e138b0f3bd233de373.1583445235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583445235.git.amit.kucheria@linaro.org>
References: <cover.1583445235.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

make -k ARCH=arm64 dt_binding_check shows the following error. Fix it.

/home/amit/work/builds/build-aarch64/Documentation/devicetree/bindings/arm/psci.example.dt.yaml:
cpu@0: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-aarch64/Documentation/devicetree/bindings/arm/psci.example.dt.yaml:
cpu@0: compatible: ['arm,cortex-a53', 'arm,armv8'] is too long CHECK
Documentation/devicetree/bindings/arm/moxart.example.dt.yaml
/home/amit/work/builds/build-aarch64/Documentation/devicetree/bindings/arm/psci.example.dt.yaml:
cpu@1: compatible: Additional items are not allowed ('arm,armv8' was
unexpected)
/home/amit/work/builds/build-aarch64/Documentation/devicetree/bindings/arm/psci.example.dt.yaml:
cpu@1: compatible: ['arm,cortex-a57', 'arm,armv8'] is too long

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 8ef85420b2ab1..de71bbfb185b8 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -199,7 +199,7 @@ examples:
 
       CPU0: cpu@0 {
         device_type = "cpu";
-        compatible = "arm,cortex-a53", "arm,armv8";
+        compatible = "arm,cortex-a53";
         reg = <0x0>;
         enable-method = "psci";
         power-domains = <&CPU_PD0>;
@@ -208,7 +208,7 @@ examples:
 
       CPU1: cpu@1 {
         device_type = "cpu";
-        compatible = "arm,cortex-a57", "arm,armv8";
+        compatible = "arm,cortex-a57";
         reg = <0x100>;
         enable-method = "psci";
         power-domains = <&CPU_PD1>;
-- 
2.20.1

