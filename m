Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CF8C33CB3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D9D92467C
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUvoHbu4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729890AbgAOONQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:13:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33371 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729795AbgAOONQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:13:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id d139so4865772wmd.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIsjmUswGvrRKxCdfebndQX7l7F0RNfqSxsw3e2vjmY=;
        b=eUvoHbu4Q+Fw95TSJOpyi7I3EFyO/IEac7uJmtcTjJ2Ckc7KiIoodCBzxBfTDNUkif
         jJfKGbiYzH5rw7EXesMekD2yTq0APHlTuOb3dSGHR2FzKOG9rAGwf13OVXS55xEoGH5c
         1GdET20TP4kDvH0eOc5fteIFGVC1K9FYx2Muwi5irkGQ/6yJmIDLe4wlC8GAjvF+qDkG
         oV73J916yNPKPemBh1mtELTVYVo8zIfsttSGsbeBn1CqBuzYbO14+CXDnzesAGNOzVMW
         npdB60/CMgUuNkQEgN13q1ro2RFU9t9YfGsg24zdw499liCLYr4doKbUct9n4NkAPwMO
         dU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIsjmUswGvrRKxCdfebndQX7l7F0RNfqSxsw3e2vjmY=;
        b=JK4qKgtoaHB4G2eYHWfYVdZDC30e5JGVG/ZNQ2+UiYZtcnSZ8HOQKa0hc+g83ngYhP
         HntwNou5/3hz2OJCCrrc5GiXdJ43SHJT6mL2tQsYoC8kti3luQYDfuabVzpV7A/5hog8
         0s6k+aFNTlForn24IOVuQA2M05m8IDtXvcNUor6AzjEDChAu76rP6I+FFX9XGJUIuU8V
         0n4ZsszuYeJNGLObp2PCi7tFMOfP/2+jlNVtV8f1lNv/ze6JjcGOzj6LZ3pYQR2dv8dK
         KiVwit/BLHVkYKsvE8jphVkToUL4tcDGQamjZ+C6RA2VZj2CzB2gnt6Ru8a2Dppb2L71
         SulQ==
X-Gm-Message-State: APjAAAVokBwrs3PMZ2Jyr2Atnw4M7C470pwz7IuxjdhH0HnXQmSeM17n
        kPddZqMFRXlNiWOlkaf+wIoKdQ==
X-Google-Smtp-Source: APXvYqzSzoI7ZzoyJ3yUHknZ5H6GNhKJ7SRZnV2SCM3yJ1cJyW8Ll+w4cA+3el5jiBAe1Q8RJ7itew==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr34458090wmm.57.1579097593348;
        Wed, 15 Jan 2020 06:13:13 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
Date:   Wed, 15 Jan 2020 14:13:20 +0000
Message-Id: <20200115141333.1222676-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds a property
"gpio_usb_connector" which declares a connector child device. Code in the
DWC3 driver will then

- Search for "gpio_usb_controller"
- Do an of_platform_populate() if found

This will have the effect of making the declared node a child of the USB
controller and will make sure that USB role-switch events detected with the
gpio_usb_controller driver propagate into the DWC3 controller code
appropriately.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..b019bd472f83 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -108,6 +108,9 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
+		       child node of the DWC3 block. Use when modelling a USB
+		       connector based on the gpio-usb-b-connector driver.
 
  - in addition all properties from usb-xhci.txt from the current directory are
    supported as well
@@ -121,4 +124,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb_con: gpio_usb_connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.24.0

