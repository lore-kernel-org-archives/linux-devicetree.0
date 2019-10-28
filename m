Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C01CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3953420679
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD06jgfK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732624AbfJ1HUJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 03:20:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33629 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732565AbfJ1HUG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 03:20:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id u23so6312660pgo.0
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=zz90kEkSWWg/YORe6tmdX1Bf7ogm6HlTvGcmmgO38JE=;
        b=HD06jgfKdHaybBrjNDZRaOXNwrZc0W1LGLFB2+ngCxaUP4+gDqrtFqGtDyC7MrXPwX
         jR87YsTHT2M2QI4PXnUjNQcWD3GGTN5fXlPkFY4Om+Z18tEZqNR4xE6Rw/t6FpVu1QGu
         C4CwaqrEkr96aBTVgePTF44Rfo0I6mTdcpTHjAmyHzC+uMtjxHKemtjTh1trpesbg5ts
         PMStpjRNp3jlevLAvILguA+lR4rfm3Fyw0/1hyFx0sMmmFtWlqMbBkcoeIEBdOhPdPgF
         Oy55yKn1eGz9KjE7kgmfCZbWQ4yljK0mARwq08Hmry7c4eQAktXMsEdZHmNi7z72sPZZ
         7CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=zz90kEkSWWg/YORe6tmdX1Bf7ogm6HlTvGcmmgO38JE=;
        b=UN3+3KOoxBsSROY63TtB7bRPBoUUgBZdh3iwB5OygaOsrQ2988P+T4E7Z6uQxHlcSo
         0GGxgmWP88NKr/MjGzV7YY2DosQo+HWfgIHvhj9ea7q0pkfJDSlUL5ro2jIcHbYciyos
         Tayf+waFBOynG9Zw2mB1p1rE4vVq0eRST/U1/wx7WkkepMfOyaS4k4iTVIajxqwv+1sB
         BTm/2N6xaefO1oqlG9qLPgg4tDn3/mmIrP+GGmtlLSS3Y7ZZ3bG6Qbgy6rHeCuzhKnrv
         pxFkPusEdLMkBeHAgkGzC2huBWhzQwl4JcLeTc/IciTfF2Y6owF8cXWv/SwhYf4aQoGh
         p2Rg==
X-Gm-Message-State: APjAAAWWmkCOg1SNPEQ3XPrfYbE4b7QiQXcynT9W/aqGBbTPhCa27olu
        oCtMpwvDzklVrZlawMgPb1/wEQ==
X-Google-Smtp-Source: APXvYqxkl+KuBnoBixVybAo3mY0Ffb2a1+RZ9YZ8REJNwp1TVju36c8lfb8srFqfTSXP8H6DDZVNYQ==
X-Received: by 2002:a17:90a:26c1:: with SMTP id m59mr20848364pje.101.1572247206109;
        Mon, 28 Oct 2019 00:20:06 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 13sm11504703pgq.72.2019.10.28.00.20.02
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Oct 2019 00:20:05 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjiang.yu@unisoc.com,
        baolin.wang@linaro.org, baolin.wang7@gmail.com,
        zhang.lyra@gmail.com, orsonzhai@gmail.com
Subject: [PATCH 4/5] dt-bindings: power: sc27xx: Add a new property to describe the real resistance of coulomb counter chip
Date:   Mon, 28 Oct 2019 15:19:00 +0800
Message-Id: <00202f739348258555dcc40982c330542ac61863.1572245011.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1572245011.git.baolin.wang@linaro.org>
References: <cover.1572245011.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1572245011.git.baolin.wang@linaro.org>
References: <cover.1572245011.git.baolin.wang@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a new property to describe the real resistance of coulomb counter chip,
which is used to calibrate the accuracy of the coulomb counter chip.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 .../devicetree/bindings/power/supply/sc27xx-fg.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/sc27xx-fg.txt b/Documentation/devicetree/bindings/power/supply/sc27xx-fg.txt
index 0a5705b..fc042d0 100644
--- a/Documentation/devicetree/bindings/power/supply/sc27xx-fg.txt
+++ b/Documentation/devicetree/bindings/power/supply/sc27xx-fg.txt
@@ -13,6 +13,7 @@ Required properties:
 - io-channel-names: Should be "bat-temp" or "charge-vol".
 - nvmem-cells: A phandle to the calibration cells provided by eFuse device.
 - nvmem-cell-names: Should be "fgu_calib".
+- sprd,calib-resistance: Specify the real resistance of coulomb counter chip in micro Ohms.
 - monitored-battery: Phandle of battery characteristics devicetree node.
   See Documentation/devicetree/bindings/power/supply/battery.txt
 
@@ -52,5 +53,6 @@ Example:
 			nvmem-cells = <&fgu_calib>;
 			nvmem-cell-names = "fgu_calib";
 			monitored-battery = <&bat>;
+			sprd,calib-resistance = <21500>;
 		};
 	};
-- 
1.7.9.5

