Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A91C10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B8B72076D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNF0650A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCRRmf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 13:42:35 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55815 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgCRRmf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 13:42:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id 6so4411502wmi.5
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXYvZUKw48+Ck5Wybv4+Su9NrVtZlX39A1lTy9a75F4=;
        b=vNF0650AC6FtDq0LXoHq3IdM/z961LETQCOwPFrilDlesnvTcHlUvUpgnuuABKIu89
         vcUt9IWuryOXKaIIf4sdK38VBEhbA84Uf1wM1Ank/fSw3I53Qb+9jY2DV8j1xFY8OGN/
         ObbNP2s+SXbeM67fY7tDS1vbb9HW1f29Vu4EZp73FIwYevcVn1UMmPbGEGuhrSrMwBqD
         5kS/3FeEtkU8QImMf92zP7edal013wOMP97NUr0R04F9fcw9ASn2N6uvZwPmslkj8hRh
         BIUsxBjCfXT2ROupoCbtUz+IKCqWcDKOrAjao+tQlzpiRBrzQTm/fdJo+b7RyqFglVV1
         R1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXYvZUKw48+Ck5Wybv4+Su9NrVtZlX39A1lTy9a75F4=;
        b=kZCCT3Czd1bPwtaBgEYqwu0jI2kSjgV9utLO7jtqs6kam9urZ14sQPBMF5RBMcg2Q7
         PVI7UjbyrnF4AnSGmu3RMULeaY4sVpZi+M03erPKY2lz5BcGIXuxEuIDqvkneqVmRuHJ
         Y71LpCCmk/fwctDKJVbLkIbRQ79x7xJ/a/SrINEwe8qUMUmpOBzqKe0hECUPsDoUCVt1
         VOCDHuMJp5Pb7Y2NupQ8PNPt2X7hdNHizneeNh1TIZ0fhTLI8lB1EsGSxUOOCDE8e/qW
         l9c0RGW7KHc4cFLfSSxpV3TPeCHcuOXRUcJiCDMBeJ70s3qZkRlk8/zHU5QHBah58vNk
         +Xvw==
X-Gm-Message-State: ANhLgQ1Fz+XuzsIbVTT6p+50tr+8FxxXsp/WhNBG9tEV7f/FYeYYEu81
        kTFD8/OsHmSJbTncWbQ+FpWdSQ==
X-Google-Smtp-Source: ADFU+vtKJ52lknJzAyioRURlbAqNI2fcsTUsrCdYnAxXI6ZEw5gSqT4pj0RiVYMMWskZDNC0qn/69A==
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr6650191wml.105.1584553352549;
        Wed, 18 Mar 2020 10:42:32 -0700 (PDT)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:5d64:ea6:49bd:69d7])
        by smtp.gmail.com with ESMTPSA id r3sm3787212wrm.35.2020.03.18.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:42:32 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH 08/21] dt-bindings: timer: Add X1000 bindings.
Date:   Wed, 18 Mar 2020 18:41:18 +0100
Message-Id: <20200318174131.20582-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318174131.20582-1-daniel.lezcano@linaro.org>
References: <e6cd8adf-60df-437a-003f-58e3403e4697@linaro.org>
 <20200318174131.20582-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Add the timer bindings for the X1000 Soc from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/1582100974-129559-3-git-send-email-zhouyanjie@wanyeetech.com
---
 Documentation/devicetree/bindings/timer/ingenic,tcu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
index 0b63cebc5f45..91f704951845 100644
--- a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
@@ -10,6 +10,7 @@ Required properties:
   * ingenic,jz4740-tcu
   * ingenic,jz4725b-tcu
   * ingenic,jz4770-tcu
+  * ingenic,x1000-tcu
   followed by "simple-mfd".
 - reg: Should be the offset/length value corresponding to the TCU registers
 - clocks: List of phandle & clock specifiers for clocks external to the TCU.
-- 
2.17.1

