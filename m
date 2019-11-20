Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD20C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4F0C2230F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lOLy+t1U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731532AbfKTOVT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 09:21:19 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34444 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730882AbfKTOVT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 09:21:19 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so35504wrr.1
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LS7jj1HIKvxgyHyZgfXU7kIDSCI29CxRcup6bkz0xxs=;
        b=lOLy+t1UEdjZqFD3P7QqzpnA1t+QUe3z2C2PhubGVM1WveK1FYtTl8qbaE5mNeLVJB
         6s6aDKzzbuZ5JOglZZIPE9rpWvEZmKeQ+ZJO/Twa1wjg5DIRQO7oF/sDcY0krKSkUwdg
         0oDU19XvCeCb0byrTrDyCfh4NYiAfRAJQGBz92+RQo8IKUrPAQdfn9cSqsCLAEi05Er/
         loijRwqaYkMGFUefPrD+qIsDTG1YvTH99ho8JcUv+2c8vaNxdIuwTYmOSQnvjifa39qa
         ZzuoPk1yxNCn01iBehSAPJLt9YGx2HeYznIW/BbdRgOezls7KFtXOjHAJKMTUV1lUD2D
         ZtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LS7jj1HIKvxgyHyZgfXU7kIDSCI29CxRcup6bkz0xxs=;
        b=VKdJzZJ3Tu5Ntix0vz2GEm29kJ82DrJBrgJMAACrzyy8Qqti3jaCfNEf8krAwn6Ct5
         nD4CTqXSh/Z6/etxjiGWStfYA8FSeIZf9z1K5aBOxxvFGth/keKslfu6v6G3YJEfNIbX
         VruWq4p7qtpeJJOB6LivArr1M4jNa8RAZ37of5FG4YeZpriecLwKQffDfLgceDiFQMXK
         /Vbv0dufRpwVI2hg3xra6PLOg3V+ooQlOu/UFSQZUt7PwiwX1f7fuBLZARr/ptqOff4T
         xT9DwHL0MUCBmPJA6F+MTnvUw+VxwylfL8YxCgpyU2uMo/4joNXbsYpgl/EBHBNos4rT
         IVtQ==
X-Gm-Message-State: APjAAAV+wEmAGC3hDnT3IdZP6i8a+Gm5+yzZn84SjL3h9uyyd+ZvfnHN
        FvnqEAiwVwqxoihE1zDgZgkO/A==
X-Google-Smtp-Source: APXvYqwz7SRyInT03KHZU5F1rb/YeUVzScLvge46nTa5iYaaaFChHhxw2MKL6FUI383HHm+OIXN7hA==
X-Received: by 2002:a05:6000:101:: with SMTP id o1mr3721410wrx.394.1574259677371;
        Wed, 20 Nov 2019 06:21:17 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a6sm34544352wrh.69.2019.11.20.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:21:16 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH 3/4] dt-bindings: at24: remove the optional property write-protect-gpios
Date:   Wed, 20 Nov 2019 15:20:37 +0100
Message-Id: <20191120142038.30746-4-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120142038.30746-1-ktouil@baylibre.com>
References: <20191120142038.30746-1-ktouil@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

NVMEM framework is an interface for the at24 EEPROMs as well as for
other drivers, instead of passing the wp-gpios over the different
drivers each time, it would be better to pass it over the NVMEM
subsystem once and for all.

Removing the optional property form the device tree binding document.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e8778560d966..9894237ac432 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -145,11 +145,6 @@ properties:
       over reads to the next slave address. Please consult the manual of
       your device.
 
-  wp-gpios:
-    description:
-      GPIO to which the write-protect pin of the chip is connected.
-    maxItems: 1
-
   address-width:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/uint32
@@ -181,7 +176,6 @@ examples:
           compatible = "microchip,24c32", "atmel,24c32";
           reg = <0x52>;
           pagesize = <32>;
-          wp-gpios = <&gpio1 3 0>;
           num-addresses = <8>;
       };
     };
-- 
2.17.1

