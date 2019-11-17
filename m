Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A8FC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 624C62084D
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BENXFluH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfKQR4V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 12:56:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50586 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbfKQR4V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 Nov 2019 12:56:21 -0500
Received: by mail-wm1-f66.google.com with SMTP id l17so14951666wmh.0
        for <devicetree@vger.kernel.org>; Sun, 17 Nov 2019 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nseA18IfcAAU7Wg54lQWKhf8XC1WsrkfqWoQlZMmhgU=;
        b=BENXFluH5ZnDQ21Na2hvqzKKV8rt0bnoDfw1TXo3C/iM/vk23ASOP2vCl7+XLVxLff
         a8aHPKvA0zX2uCLUxQqgkAC7vH7Sei/9cJd6gxb0xTrlqv1UFj9EuQWTuLbL2YMipduN
         ES70HZ3EBfOQ5TwXps59dO/xDtlHVZ6koDlbepZeTj68QO00eXuomY5T3XwEZ5jEV2Y+
         rV1OZQMkw62mlUGAScbijugPTzBPrp9k0Y/AkGzvE2yTiOwD3M7v717s3GDQb5q48QUQ
         bx4V7vfJNguIWpMxyLKqy+cOyuEeZYtRZzsPzxZWDX6zJlZEawxMTQXf+0lpWvNBRFPJ
         /dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nseA18IfcAAU7Wg54lQWKhf8XC1WsrkfqWoQlZMmhgU=;
        b=sYslw/fo/KJ2we/qU7DOFp0HXMJyzcVSVqF/Q/BNvYIYg4OVjJQD6+ZI7nG2RQVyRJ
         hAe4rLK0kSL92WU+0htAy9UzFgReoUg9iuYR+7q8ZEIsgzlVMOP9SU8AYv1GgWpVPr0W
         GPJfFQ56/IfARhyENgGEPxMwu8yCprP6HMgU7WP/9ZbSFH8iEXFQolE3t/zufegbQ6pb
         6PQIjz3Ee4CBWLb9MKriOH2B54KSczX/dsHodHfOz3gzXetOUvAVKJ1ehvDIzqcWCH8X
         Uh3Zn0KGjSN4M+lqfasD70koVlBan8C9DXS2cgsD8HZaqrduwXL2gZixvgUF83OnNpt8
         DMww==
X-Gm-Message-State: APjAAAX1rD0n9+qi9k8JIevDiAfcjQTgVRQ/CZJU54viGv67bLfFfEer
        JqtzN9WsZD3NaCT6uMwmxN1HRYp3it5HUg==
X-Google-Smtp-Source: APXvYqyMkYz2BF5C7yBfSHQSBs8iGPy57rl80hGbc2Y/uQTUE/ShpmskE7SK9UzlgPW2+ThZqExnKg==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr25458586wme.53.1574013379709;
        Sun, 17 Nov 2019 09:56:19 -0800 (PST)
Received: from localhost ([37.238.189.25])
        by smtp.gmail.com with ESMTPSA id n1sm20397490wrr.24.2019.11.17.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 09:56:19 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH 2/4] dt-bindings: net: Add compatible for BCM4335A0 bluetooth module
Date:   Sun, 17 Nov 2019 20:56:04 +0300
Message-Id: <20191117175606.5050-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Available in the Ampak AP6335 WiFi/Bluetooth combo

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index 4fa00e2eafcf..0717399191a2 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -14,6 +14,7 @@ Required properties:
    * "brcm,bcm4330-bt"
    * "brcm,bcm43438-bt"
    * "brcm,bcm4345c5"
+   * "brcm,bcm4335a0"
 
 Optional properties:
 
-- 
2.23.0

