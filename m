Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17DCC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D22720835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="AefmMVNZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgFLNEf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgFLNEf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:04:35 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDF6C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:04:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y18so3724284plr.4
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vxKjtaR9J5KXw5QvNfVo9XkT2kELkwD9L/tBPahe7I=;
        b=AefmMVNZ/R+ZqcrsoxXAe4nIIuONGTsrV7IQ1oz2RDMIshK+C621Y6I6MwPTR7UvBe
         HTqpxVp0yg3Sv4F8pKf5X4XHgrSGA/PlMqqKjvzcZ6+dLlOAnwv4rLV8cfKYTWalwLtm
         MeF9TU73seMmRuTndpqMJ9IoeFI6F7+aCVqxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vxKjtaR9J5KXw5QvNfVo9XkT2kELkwD9L/tBPahe7I=;
        b=ghHaybfYPIcmJUhYY2k/ECvNo5oeMEzpv5J7P/hK2IjJdJMioV9oCAowKaMmHZhpL5
         HoUiu+QuQ/fEiUUcnsOT5F2f2/CmIDmz2zPBRNMmUEiWZBEyqXUKtLCpMlBC/XLT0RYV
         WdWIziwsJ2+8/CaVeX0IeVhtU8vHzoK6lx267zJmQz5u3of6PkkJwfY0PblmvVuWZqFa
         kq9byQK57Ud30XADNvAM++i2EjJSX6IdbJLuo61/a6Nt6H7YgZRELW7TW8IDwksvUoXx
         gPK9Z3ZruTLWPA4TOeB/2Xb0g+ygNuurSar32ge50CIzvbZMhoUuZXXv6Ehmojyetdmj
         9VLA==
X-Gm-Message-State: AOAM531NeYODZM1UMNubWg+6U7fu8+Z6A9vWDeJI+bUO1mfo+bSj7g6T
        ZVVjEljvR6B+x5EqRdUcG6x9kQ==
X-Google-Smtp-Source: ABdhPJwg76Eyt9sWMuI/3fYjUtxebHMP7gP8S+d0oooT1BSuAMCR7x5yEpWVIIRXwQDocI8k8yXCYA==
X-Received: by 2002:a17:902:82ca:: with SMTP id u10mr11301620plz.294.1591967073370;
        Fri, 12 Jun 2020 06:04:33 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id k12sm5481939pgm.11.2020.06.12.06.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:04:32 -0700 (PDT)
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
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mike Rapoport <rppt@kernel.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Will Deacon <will@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 04/12] dt-bindings: vendor-prefixes: Add thingy.jp prefix
Date:   Fri, 12 Jun 2020 22:00:04 +0900
Message-Id: <20200612130032.3905240-5-daniel@0x0f.com>
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

Add prefix for thingy.jp

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7c45b4c6fe40..70a8f2696427 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1036,6 +1036,8 @@ patternProperties:
     description: Three Five Corp
   "^thine,.*":
     description: THine Electronics, Inc.
+  "^thingyjp,.*":
+    description: thingy.jp
   "^ti,.*":
     description: Texas Instruments
   "^tianma,.*":
-- 
2.27.0.rc0

