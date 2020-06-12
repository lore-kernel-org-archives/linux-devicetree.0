Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6542C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:03:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DBC420801
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="UwmU1cla"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgFLNDk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgFLNDj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:03:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80545C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:03:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jz3so3633506pjb.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XChjBh6npquWu7Gds/Y31/zFut/MusA/6k8uIHJOBp4=;
        b=UwmU1clazf1waXMz2OfDw/fqAyqKGnXsGLQHKoJk5sAMUGUzsciCh2kAJ0iuEN6Lzb
         ReioL9yEqg1Ha+7Pr0XfBTJcEkT+oV9ipOE6zPLcBxf7823zdTx1UlbGY2cskpoJb+Kz
         3Z327x+cdQ1rDGNwnRwxu0/YY5vppwsSsNeq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XChjBh6npquWu7Gds/Y31/zFut/MusA/6k8uIHJOBp4=;
        b=QBHJhnCqZgXi6EXNcLJHO3hIdmRBA1mVJbE22ZY8ObNr4mToWWiRR4Wrna8P3D350T
         fbRgkmpX4AM9Xh6wJ1tmiigjDZ0cP7xfY14o5QBH9d8bqF2qWBRbp/6DGQPd2DDO0j0S
         lKkepg+I+9XORFzaQ/G0y2SYXwKfvg15SqJ6f1ERytOQZIBwjfbiGMrMsKp+3eJ9RxML
         9+qUvqacymOJG4dn9rYoRsdHz1p9LCt4k+4HqwuJLOoaD5R3BJW3Xmswj7m6QVLF8pNE
         lsw8cbtYPnvsUAibpcLrDmtqWwQTG6Gd3jS3Z3/oCJVWUm8lY3YsudRfksdS9Dsq218y
         rOCA==
X-Gm-Message-State: AOAM5333mwcOdwm6vXjKCpLxnhRu6do41Zy5ebkeIFj9A7EZm2TaoG4T
        6mok3l3Zk5lt0emaH6smRkoS0w==
X-Google-Smtp-Source: ABdhPJxW6okryb1H/Wb2uZlId7rrSe/g6oANSSlhoWqGcCYTWG7bqOaMgoczORRgsCUTAJlZ0SskRQ==
X-Received: by 2002:a17:902:d889:: with SMTP id b9mr10724178plz.206.1591967018698;
        Fri, 12 Jun 2020 06:03:38 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id k12sm5481939pgm.11.2020.06.12.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:03:37 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-kernel@vger.kernel.org
Cc:     daniel@0x0f.com, afaerber@suse.de, devicetree@vger.kernel.org,
        Daniel Palmer <daniel@thingy.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/12] dt-bindings: vendor-prefixes: Add sstar vendor prefix
Date:   Fri, 12 Jun 2020 22:00:02 +0900
Message-Id: <20200612130032.3905240-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200612130032.3905240-1-daniel@0x0f.com>
References: <20200610090421.3428945-1-daniel@0x0f.com>
 <20200612130032.3905240-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add prefix for Xiamen Xingchen Technology Co., Ltd

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86b569a0c008..314a2ddcb6a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -984,6 +984,8 @@ patternProperties:
     description: Spreadtrum Communications Inc.
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
+  "^sstar,.*":
+    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. (formerly part of MStar Semiconductor, Inc.)
   "^st,.*":
     description: STMicroelectronics
   "^starry,.*":
-- 
2.27.0.rc0

