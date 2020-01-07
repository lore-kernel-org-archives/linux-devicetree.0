Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FF5C33C9B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 853432080A
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BT+XiI7K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgAGJaA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:30:00 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36261 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgAGJ37 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 04:29:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so53098986wru.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 01:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=BT+XiI7KL8AbXEnRoUphi5RAur5dTOV2WYkSXxsNVg5uOoY16h3spUJNcw+WDN0eE8
         Q5Kuu9cKqxAScKglzuKOu9ImlN2vUCvsl7yUQkB/+PQewkGeMlrzdbeof2gkRE4kl5zh
         OZkGw2QPofaOfrL2yT/LE33DZCsOLM9J01mUix2D/Mb8FCxKGdcHOrzi8LpHxe8qAmSJ
         aRUJu/umX8XmfRMveLIccd9z17jBvwTdrkyBYwrT5bSu7B3aRoNZLNMOBdfkQMBlrZlU
         WEsMzFveyXDtc4CMtzTcDQoIqKI659lvX2nsG90szJDM8GoXJFs8Rgx/PqZf/++kn8wo
         nywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=S6fLIAqlPME/AZC6VKM0lqj90/ZIZdJ1P4HVlE0seT4E0lFBeNVA1PFyDd2SrSwJYd
         9oQxCY/D35bn46IIMlc+nQhg89l5/vpI2bwzNuP7KJzyI8RXIDxjVk8FK55Bl9GWUxcf
         r+019oq5diONonhuh4JlsbUatOsGSRrarmdeJE2B50TQ9cnlDaP1TV/JXXxelrPCISt2
         aLLT2CpfALTcJcgMeu+LQ6gv2OG1ZIXpcuLapED3UMZybqZxIM7bYW8RdY/CD58Fr5Tt
         X2X6AqMQrbx2xCY7ZOfCBolYDpaD1FXj3JGvMMnvCEOJ9FKS8+5ewhgHfZ8EiBSBgZE/
         fgWg==
X-Gm-Message-State: APjAAAUaajWdn8FQXE8HlGhL5rTXKKM1b8duuWVer4tkbRW3IRaQ6q6j
        QofdAML71eFrTKEL/ztmBJmuSg==
X-Google-Smtp-Source: APXvYqzy3e+NBXWEgKTFoS1SiHNnkRdl0I49RIxZsPjJ4sAcAAmVjJYUj/X9oh9KyDQxC6Yp84I43Q==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr106677513wrt.229.1578389397032;
        Tue, 07 Jan 2020 01:29:57 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id x14sm25959969wmj.42.2020.01.07.01.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:29:56 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
Date:   Tue,  7 Jan 2020 10:29:18 +0100
Message-Id: <20200107092922.18408-2-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107092922.18408-1-ktouil@baylibre.com>
References: <20200107092922.18408-1-ktouil@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Several memories have a write-protect pin, that when pulled high, it
blocks the write operation.

On some boards, this pin is connected to a GPIO and pulled high by
default, which forces the user to manually change its state before
writing.

Instead of modifying all the memory drivers to check this pin, make
the NVMEM subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

Add a new optional property to the device tree binding document, which
allows to specify the GPIO line to which the write-protect pin is
connected.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 1c75a059206c..b43c6c65294e 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -34,6 +34,14 @@ properties:
     description:
       Mark the provider as read only.
 
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+      The write-protect GPIO is asserted, when it's driven high
+      (logical '1') to block the write operation. It's deasserted,
+      when it's driven low (logical '0') to allow writing.
+    maxItems: 1
+
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
@@ -63,9 +71,12 @@ patternProperties:
 
 examples:
   - |
+      #include <dt-bindings/gpio/gpio.h>
+
       qfprom: eeprom@700000 {
           #address-cells = <1>;
           #size-cells = <1>;
+          wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 
           /* ... */
 
-- 
2.17.1

