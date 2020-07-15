Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3988C433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81A872072E
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+Dn03KR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgGOHli (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 03:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbgGOHlh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 03:41:37 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC2AC061755
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:41:36 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k71so2675107pje.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PzeyV6YpwAf35s0/H0MKlw0rqFvNzgBGZ8Pmq2tguu0=;
        b=f+Dn03KRTXs+IMJt8Gx0i/3xnbsIzCkg5RLdKO8WyDVDYac/UXNtpUn07eJf2Gl10/
         RDD7XriEc4ZIK/XPyxxSFjD9fBNPcL38koB2iQHqP6PCcm+djwVgD3xm9qaEXjTUe5ln
         ke+fdcvJ6BGxAQqofUxlrFsUWNI3YLTlkFWPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PzeyV6YpwAf35s0/H0MKlw0rqFvNzgBGZ8Pmq2tguu0=;
        b=s7YhKTAgOEPcX8uCAy58ZxdrPo5GGpEyTcrt5xAZMvXtr1W5+vs39XDSNmQ/E+2vnw
         GzWjvr+Y6M1uYV9NlBbFeyliaxrQ/7YB8liJkS6BxPHOwz+O/k0e7Ft4UpL1Gl2aiQ88
         FDIXS4LzK343pHZtbYfZcb7iqxOfr4NsKmK8QC0xwzBJYjJU9Xo/Vy+d/mhUfB2a+lku
         bZmhtZ2Ik9/YOZDF03h1TcuE3xtgp3QoMYXlsQVKz8empsaq9DV47ZlZsY/TaE1gmWEG
         Imr07Hkvk3uzPB/B8dvBo3p3qh4zaUnktVw0QvGoVTLnsfSqDdQgc+/SiV7llbOCbOq/
         COAw==
X-Gm-Message-State: AOAM533Oq/hnVJ0tEmW4w/q/oXB4+Mmw6dN5bM3p0wATKC8JCxJzYzTJ
        EJwZ1cUTOklq8TUTg1WgoXSBVA==
X-Google-Smtp-Source: ABdhPJwdIyl+Cj2fnLiyn88Dkk4vqmjyO0G0lTs61W3SiY4aHSV6l3vq6T/EKaxcrMusAfm6fs6vtQ==
X-Received: by 2002:a17:90a:8904:: with SMTP id u4mr9296881pjn.87.1594798895760;
        Wed, 15 Jul 2020 00:41:35 -0700 (PDT)
Received: from bhanumaiya-glaptop.hsd1.ca.comcast.net ([2601:646:9500:590:250:b6ff:fe8e:b459])
        by smtp.gmail.com with ESMTPSA id r8sm1234261pfh.29.2020.07.15.00.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 00:41:34 -0700 (PDT)
From:   Bhanu Prakash Maiya <bhanumaiya@chromium.org>
X-Google-Original-From: Bhanu Prakash Maiya <bhanumaiya@google.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Eric Peers <epeers@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.Kernel.org
Subject: [PATCH 2/2] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
Date:   Wed, 15 Jul 2020 00:41:31 -0700
Message-Id: <20200715074131.1754203-1-bhanumaiya@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Add DT compatible string in
Documentation/devicetree/bindings/mfd/cros_ec.txt

Series-to: LKML <linux-kernel@vger.kernel.org>
Series-cc: Raul E Rangel <rrangel@chromium.org>, Furquan Shaikh <furquan@chromium.org>, Duncan Laurie <dlaurie@google.com>, Eric Peers <epeers@google.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Change-Id: Icfeab15fa04daaffc61280faf5a75cd9b23ee822
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 4860eabd0f729..ec8c5d7ecc266 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -3,7 +3,7 @@ ChromeOS Embedded Controller
 Google's ChromeOS EC is a Cortex-M device which talks to the AP and
 implements various function such as keyboard and battery charging.
 
-The EC can be connect through various means (I2C, SPI, LPC, RPMSG) and the
+The EC can be connect through various means (I2C, SPI, UART, LPC, RPMSG) and the
 compatible string used depends on the interface. Each connection method has
 its own driver which connects to the top level interface-agnostic EC driver.
 Other Linux driver (such as cros-ec-keyb for the matrix keyboard) connect to
@@ -17,6 +17,10 @@ Required properties (SPI):
 - compatible: "google,cros-ec-spi"
 - reg: SPI chip select
 
+Required properties (UART):
+- compatible: "google,cros-ec-uart"
+- reg: UART baudrate, flowcontrol
+
 Required properties (RPMSG):
 - compatible: "google,cros-ec-rpmsg"
 
@@ -72,5 +76,6 @@ spi@131b0000 {
 	};
 };
 
-
 Example for LPC is not supplied as it is not yet implemented.
+
+Example for UART is not supplied as it is not yet implemented.
-- 
2.26.2

