Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CF6C33CAA
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:30:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9E0224125
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSsOUcv5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgATQa5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 11:30:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33299 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729378AbgATQa5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 11:30:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so139616wrq.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 08:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=QSsOUcv5sbMN/jNpK7aTdB6iNUIs9LcZCj7zAz2uDe9RPSmHi2pYBq4sxVKvBwayfn
         m0lEWRwvs6AS/gjytjve68ZbgBIA+jVzDm/sNKBb6OzyEtuY0Czesv2ZdMT09O0+KPf8
         BZ8BKjQNhKVIaY1QlwyT2SdPJzTSxT1Cjq4wLLTT1+WQLmiJBCnJv8zPylMm54byok2y
         rWUfz4IZtBlYd6NgVUfFP50YULIoFv4yeRsfQc4xGEtss1jJTK8kF+20W17dlZzlboZG
         M8qjYY4xJUMQXKZEJNTTjNc41zGPFz9WwExl8pW949UhgW++KCQJjYHVirF+hAjmfHCs
         PYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=Lw4qNgCkrSfm2dLhMTPfFdAqND7/xONQIUVkO2i7m83jXgQShgikHvMfrme4mGxc6h
         HKmPBhhkyvkrNtUwu+9MOzuMgHZlB15xOBd4FsOnCoccocrNq8DE0qB7tVrz2he+aIi/
         Nca3C2+A8TJomZsBg76zOsIrE8XM+yAacVxpfEWXEqhm7tGu9uMvRniIiWymEGjWtYCs
         wX0qC70GXyXVGuTEykzVRLCudSWLflAksyAXEN4GeWRx2xRCKHW8msSYHXUVD0w5+/F8
         qPSRS7gVfbJZLiPAMkQdzuI1XZy7f0NFCa/z5sd6XQW4DLNYK53RKj/fPlOAke3OZEaP
         5f2w==
X-Gm-Message-State: APjAAAX6EvlxVPCGjHRDdUvnlIoNOkdwqwmxX3uYnoEOhu/nXQU9LMdi
        dOUL9pkLxPZrGAgcWnxxOurnPA==
X-Google-Smtp-Source: APXvYqwl3wpIwjQgy1fvEQ3/mo0Hjarhfo+OgL53l2owZZAbLWFGTXpOMHj6b/X3PzgEGzPhnIPQmw==
X-Received: by 2002:adf:a746:: with SMTP id e6mr291993wrd.329.1579537854667;
        Mon, 20 Jan 2020 08:30:54 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
Date:   Mon, 20 Jan 2020 16:31:03 +0000
Message-Id: <20200120163116.1197682-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
2.25.0

