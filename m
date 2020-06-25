Return-Path: <SRS0=bF7C=AG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBD4C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 21:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06EBB20789
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 21:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ba9e1OEf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407234AbgFYVeO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 25 Jun 2020 17:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407233AbgFYVeK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 25 Jun 2020 17:34:10 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB7BC08C5DB
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 14:34:10 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so493903pje.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 14:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQiwKhrspW+Ux+XDva4IeowK1f21GzmRdKw3zd5GzAw=;
        b=ba9e1OEfbD0rbFOzKrl8oFxsCSmfFk0POlzXr8MadFEOOiGd3iPLmZawoaZMWAZ3xO
         ZsfUJoOMv+1q49KTSKWtEFsTPxfucLRWOiAExjugwrdL1gkGmBOwRjvTeEd3py0SCGwJ
         VxQ6XIE39180xlW0zfe0rSj8E2BXXYF28OGqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQiwKhrspW+Ux+XDva4IeowK1f21GzmRdKw3zd5GzAw=;
        b=eAVjKuZrl9hEqX0WTs43YJLO6OhLJmsaHZd3Vyl3KLgQhH3Q3D41sTP/7L3LtJuQGJ
         0YMSE3n/e26irrE0v6FlyjIrIHLv4/I/fhdk+OkUni1R8KfF+VtLrKewBU6PNHD2ios5
         kFcCnRQBJ0wZOiTGATL0jgmKzCjDuyvi/arl7G/nNUbNKZwQ/ZH+f2rtAEqFI9VBGpON
         zuyRmlsRInzN39ksm8ygWMZXy+X/JkpLqblCQoq6fM0GCxu16q0OmoqP4WpKjVck6P0a
         4J3VVfio0f7zCLl5E1EiKbmMzSfMZtWexKdzG8yZQUnt9FPwrkYzm1ethKVGZ2vTE3pH
         TecA==
X-Gm-Message-State: AOAM530jTZg28hxQiKglqm/jgVSqR3Gq5KgY+8RzsNLfticakBFq7xgv
        M1b+G9Kt9lKLAc+f7uXP0/D7+w==
X-Google-Smtp-Source: ABdhPJywQrZzxvwKBSS4y4n/VAY56tmZjwm+0Lm7F3sGKp2WXLBhTh65IyUl4RamSElbp0FbYNn+kw==
X-Received: by 2002:a17:902:a982:: with SMTP id bh2mr34861515plb.2.1593120850338;
        Thu, 25 Jun 2020 14:34:10 -0700 (PDT)
Received: from bhanumaiya-glaptop.hsd1.ca.comcast.net ([2601:646:9500:590:4bb2:fb06:d31f:eb48])
        by smtp.gmail.com with ESMTPSA id w1sm4107424pfq.53.2020.06.25.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 14:34:09 -0700 (PDT)
From:   Bhanu Prakash Maiya <bhanumaiya@chromium.org>
X-Google-Original-From: Bhanu Prakash Maiya <bhanumaiya@google.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org, "Lee Jones )" <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Duncan Laurie <dlaurie@google.com>,
        Eric Peers <epeers@google.com>, devicetree@vger.kernel.org,
        Bhanu Prakash Maiya <bhanumaiya@google.com>
Subject: [PATCH 2/2] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
Date:   Thu, 25 Jun 2020 14:34:02 -0700
Message-Id: <20200625131432.2.Icfeab15fa04daaffc61280faf5a75cd9b23ee822@changeid>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
In-Reply-To: <20200625131432.1.Icb23b633700f1ef4d123e3f21fd26fad21a3f207@changeid>
References: <20200625131432.1.Icb23b633700f1ef4d123e3f21fd26fad21a3f207@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT compatible string in
Documentation/devicetree/bindings/mfd/cros_ec.txt

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@google.com>
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

