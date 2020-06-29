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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DCBC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBFC52063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQZLMS2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730343AbgF2Vkz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgF2Vky (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 17:40:54 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C1CC061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 14:40:54 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id h23so14137248qtr.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 14:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NkH+JCwdnaHsFKwJd89KAw2KS1C6oe1Q6V5c/F8UrWw=;
        b=lQZLMS2w5+pWFl2sd5TIjZWJ4/XPOX0+L+PdyJuIDztOGrnigLMp/IcuPj6Cet/4fb
         /FYu50ppT7KRCg6vM6Yv2lZtZdo2kyoe7NQm1A2Ng2IKld5ptfaONg7R/OJgl53pOt5a
         tcQNJ0oCgTErqx+di2bwHFqGLytDHfhbrhmZdAqCdbU82JleEx0TGA5K6BDliUyagzCG
         Kqf8BnreJ7YsJvQ+HA1XW1hSRCwAVNNSYuwBPbrsjYjmmfoa2nyc+Z5yoqnIpTV+2YPc
         lls8nUuXIfZmZS6mBQIUCLcHP127wzaJ22J2U6GRtT6QQZdp/gJtIEPIlChBogRC9rrA
         OtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NkH+JCwdnaHsFKwJd89KAw2KS1C6oe1Q6V5c/F8UrWw=;
        b=Zuo0Hs0NotT7+tcAOLOzdrKrWSONGeLzij0AOAaZ3w0JWTt9ORZZnE4n50mPm0mO5M
         qaEGskDnbtnwCg2u/x6/yeuR5WD4bUjaAdXE3QJs5qoUkUgIfIUlx6NYb7zHZb9+24PY
         MLVbay3wkp/I93rv4RarBvGyGU86rvh3hZZy9rTPYpIIOjM9Q9tb8tZn/FMEfJQEH9gB
         IC5b+fqn5F1QhgNgCOcJ6sYBfoIJN5KH4cLoQWy5ifPZ+WNhhClFNQw0B4FghbYwOBgu
         1dqzrz69uOotxJjQ1pJGyganQr1pQ8D9RPO9PKK2KJw9xUN6zXa1s+kE9JY0ShAI2hLd
         wKFQ==
X-Gm-Message-State: AOAM5336jdHn8MC6X+JdMcYZVEtN0DajOtHDb2QM2vDJ8i9qs+fTcCJw
        vD/wRtxXNmvXKdZmtnLvT7Y=
X-Google-Smtp-Source: ABdhPJz/N7qIh2/IvRFZAOJ+uGWgpzoBu83WvX3ehjE1dgFnwo2fZ9TMdPoFIjUNS6dSdZWJe83wEQ==
X-Received: by 2002:ac8:c8:: with SMTP id d8mr17615166qtg.221.1593466853271;
        Mon, 29 Jun 2020 14:40:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
        by smtp.gmail.com with ESMTPSA id w1sm957319qto.0.2020.06.29.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:40:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     rentao.bupt@gmail.com, balbi@kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: usb: aspeed: Remove the leading zeroes
Date:   Mon, 29 Jun 2020 18:40:27 -0300
Message-Id: <20200629214027.16768-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove the leading zeroes to fix the following warning seen with
'make dt_binding_check':

Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dts:37.33-42.23: Warning (unit_address_format): /example-0/usb-vhub@1e6a0000/vhub-strings/string@0409: unit name should not have leading 0s

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index e4e83d3971ac..8b019ac05bbe 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -127,8 +127,8 @@ examples:
                 #address-cells = <1>;
                 #size-cells = <0>;
 
-                string@0409 {
-                        reg = <0x0409>;
+                string@409 {
+                        reg = <0x409>;
                         manufacturer = "ASPEED";
                         product = "USB Virtual Hub";
                         serial-number = "0000";
-- 
2.17.1

