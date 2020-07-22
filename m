Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372EAC433EC
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 10:27:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BEE020729
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 10:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=antmicro.com header.i=@antmicro.com header.b="V0XYt9PE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732084AbgGVK1p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 06:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732076AbgGVK1o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 06:27:44 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADD4C0619DE
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 03:27:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 140so1023704lfi.5
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=antmicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RUcc5eU7gKD/3gCaEHln3Fn1jI+Zlv9W+faFtSeViaM=;
        b=V0XYt9PEAiL5V6MknhkVVbfYEBJLpTxY0F8yKjKk/BX6aXOf5L5nCS9kZtYqJgEE82
         Lg7XO9b1Asbp9KMTwRHanI/UUzohla0LmBrEQfogzzQZAZKgG+XUXj1pyc08KSkPKz6i
         sW64L3kmTxqCyyfE5826+7ewwuze/H0GgbGyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RUcc5eU7gKD/3gCaEHln3Fn1jI+Zlv9W+faFtSeViaM=;
        b=bGcf8sISeEJanOZng6n/UzoUwO7z2K8jNCz0/nuictv5Hbs9jsTbpRh1b0t/jH1/DS
         LcrgPiHF3tYp3P3WVR97Pgy2XOQYWqZf8dbUttYqm+nysz/fCi9DJirHhJG5UThkPOyu
         DsOP9W8Osz6thcN4D73swLLl+QFJqickp/voonmc8dYwhwkr1w7QO0TL30UpYbb0zJmk
         sMkDy0ulrjMlkfvMqvHgJs5n6wos9Zjoy+B1ffV1GCj+7/1H8mA9L2FOPBnXbRaxeUFr
         vXEcydIQKqYm+4xwk0jpFmytBrIEVTFF0lfjIcDO5zdasEMl2S4S3EVe2oDgBlRbhmhb
         4qAQ==
X-Gm-Message-State: AOAM532VsA6dfNd4UmZYUUoQOB+BuqjU9RJgG5qW1YsMefQOcsLyguRq
        h5prEpo4tEcLn/p/66aytOP6dQ==
X-Google-Smtp-Source: ABdhPJwnBmYCqGUPkan/pK36A1to8WFJ0mcCznoFBDC9TJY6fzfk+CFGYo8VTrVqkDRlXgK3ynUNfQ==
X-Received: by 2002:a05:6512:3249:: with SMTP id c9mr15859074lfr.216.1595413662784;
        Wed, 22 Jul 2020 03:27:42 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
        by smtp.gmail.com with ESMTPSA id b25sm3726534lff.75.2020.07.22.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:27:42 -0700 (PDT)
Date:   Wed, 22 Jul 2020 12:27:35 +0200
From:   Mateusz Holenko <mholenko@antmicro.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Stafford Horne <shorne@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Filip Kokosinski <fkokosinski@antmicro.com>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: [PATCH v9 1/5] dt-bindings: vendor: add vendor prefix for LiteX
Message-ID: <20200722122704.1153221-1-mholenko@antmicro.com>
References: <20200722122704.1153221-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722122704.1153221-0-mholenko@antmicro.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Filip Kokosinski <fkokosinski@antmicro.com>

Add vendor prefix for LiteX SoC builder.

Signed-off-by: Filip Kokosinski <fkokosinski@antmicro.com>
Signed-off-by: Mateusz Holenko <mholenko@antmicro.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    No changes in v9.

    No changes in v8.

    No changes in v7.

    No changes in v6.

    No changes in v5.

    No changes in v4.

    Changes in v3:
    - added Acked-by tag
    
    No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..9aae6c56d7a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -571,6 +571,8 @@ patternProperties:
     description: Linux-specific binding
   "^linx,.*":
     description: Linx Technologies
+  "^litex,.*":
+    description: LiteX SoC builder
   "^lltc,.*":
     description: Linear Technology Corporation
   "^logicpd,.*":
-- 
2.25.1

