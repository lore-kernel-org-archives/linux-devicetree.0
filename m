Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57796C3B188
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 21:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 288CA20733
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 21:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFdoLe7z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBJVkS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 16:40:18 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37171 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgBJVkS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 16:40:18 -0500
Received: by mail-wm1-f67.google.com with SMTP id a6so969007wme.2
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCiRbjJzZzwrllYyfm6P2Mav2in2VZ7vyAfMSm3q4rc=;
        b=gFdoLe7zW3MzhxuT/BRGf8IFSl2qk9HwrXAz4eHkASYgHa1YIVtZBeDmPtVMCtHeNv
         fKIWXhICFvM1YHmYoq0KJv4wI0rwtVNK3Us+gAGivIh3w1dvBt6jBYWC/1xLf+Y3q3Ws
         2kd2nVlYxkNbqDDYNMEZFDdt/id6ZeUBG35a2MDxwtwjL00cZoQrF1QhTHzIMpoJeZei
         WFwaOpiso6d9BCnytx05rJIoCarFATvyc6sEVm/QrAsQc5uxo2OLdwHd6iwJ7zbJn50x
         eMbggHJMDWvQkauMpLGUY/KFc89zr77k8PbN1CNzRbzfO/Q5AVEVTLK/OwxVFF2tXv0O
         EFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCiRbjJzZzwrllYyfm6P2Mav2in2VZ7vyAfMSm3q4rc=;
        b=FN+4nOhGT8r9cPHt5ErbIuj/6Usn+VbMX11nQexmEYpXgZZf4hry+yzZXK68A38u9l
         OgBv7WCrobdrsAf0GapQiBrsUMhPG1wlLCvcSBK7gOCDzP9ZYYkVKAGBJ6u2zTwDpZIs
         0VbNvMrdXEYTPH+mdXUl4wBFnIBnFVj+11qMt+c4ZSof98tj88O4/dyT5rmfoQXArSeF
         4uBUTYEWPXHRqKLTfPcMdKzyO2g3xiWG5HDSaPPCA6a/eN/8+1nRR7JWZneIEfuN+Emd
         1IrJ+3/hhGrS2mL+fXW3OGvE+j0u+6jcNBOIK1gYgowr3vBXmecI+Zz4a5Xz9Hp3quZx
         bXuA==
X-Gm-Message-State: APjAAAVRq7Q7Mi4QpjXssDtTlvESU83yTjt9xcdxHNNkKfr9tkdWNqtZ
        nMGpg8+/Mo4qGOtoa+QL+8bzjA==
X-Google-Smtp-Source: APXvYqwQ/YYU75x4QkwRfXeToVq56G39tKupvt9fLKoHnEygZ9u9x+PZB6YHn9wuXHgKPAYc4sSLUA==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr969416wmc.119.1581370815993;
        Mon, 10 Feb 2020 13:40:15 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id u14sm2118582wrm.51.2020.02.10.13.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 13:40:15 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v9 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 10 Feb 2020 21:39:24 +0000
Message-Id: <20200210213924.20037-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210213924.20037-1-mike.leach@linaro.org>
References: <20200210213924.20037-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20a6557f157b..dc9e9776c001 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,6 +1676,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

