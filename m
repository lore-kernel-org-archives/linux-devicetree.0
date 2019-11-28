Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB2C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 05:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1738216F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 05:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/EdEpZq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfK1FKQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 00:10:16 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34678 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbfK1FKO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 00:10:14 -0500
Received: by mail-pl1-f193.google.com with SMTP id h13so11077067plr.1
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 21:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUmL4qLsieRvwPq6R62FHNU4t8q1oQ82Y1SNhYOmg5k=;
        b=D/EdEpZqCCtTGiwmEC6gq+PCA/Y+yTDJREnWu59+lBpHibMPIellRcG6NR3zwBZ/xx
         OLmVSLIv3eX7q3wLN9j+c2n0JjO5XplIw9WMd8uSDYe9OF95xpsuAd8rk29X/Hd+01Tj
         W77VEvKvNu60Xa6aMADiIWzQknKzchQvsD3dVqfzNqGHNe3VmiYARrwxWMJ4D1w0fl0K
         YRo62TEYKYB4WuHdY/Xeige/XvQ222CnRfEmh67QgYKqArYKhs+IjP/Xf4D9lvoyCumN
         HsH+6Y+XfFdBvJGolCgcSWJYxQkhAOebHTwJaN77THPerQMMc+RHJoa0BAYcxkRiZkBZ
         XZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUmL4qLsieRvwPq6R62FHNU4t8q1oQ82Y1SNhYOmg5k=;
        b=AJ10kPb904uz6VZz/UaEhmkRZQ6DglqiIbEGrvIf8c3jJn/aiNKnACusu9kth65RZG
         Okrler/ShzpTAl8uZRs1zFWu+medMYf82skcIzjJZO48jyiusPpGE97PR+raGwao5RF+
         wPtVRN7Ph0UYr4f7ey+PE1e+ZZ4z+odw8MvwOFCwZp+0kmSyGUS9pguXAgYu5Acty7nW
         GXTZYkhUTJwkmEOs/EsPYCwdjUkxwq2vBcByzZQMORugS0ytZpq5FWVWc/y4OuKY9zoo
         a5yRY8wG3p0jI0z9R8g/T+RLGU4I2t2gXmSU1cyYfyGpk5otPDXf2C9H80/nvYI60fsA
         JPqw==
X-Gm-Message-State: APjAAAVeS8cIF3jGnBem/1KH/s6r/8ZUNwIAYrNPQkVTK4efsT9wWwmZ
        wx7YHdeknApE1PzeWrP9KoV8zw==
X-Google-Smtp-Source: APXvYqw1Rx241aQ1QD+PueNp8aW3lcCk1ns7N57sTu49O5IMq1I9NZ4kt+Nn94dM2CeRSzBJKvW8ow==
X-Received: by 2002:a17:90a:65cb:: with SMTP id i11mr10354421pjs.23.1574917811857;
        Wed, 27 Nov 2019 21:10:11 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:11 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v6 7/8] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date:   Thu, 28 Nov 2019 05:10:00 +0000
Message-Id: <20191128051001.18995-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey960 Board.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I3f111b39b7a982b3489549076412a2f7c3c3d008
---
v3: Reworked as usb-role-switch intermediary
---
 .../bindings/misc/hisilicon-hikey-usb.txt     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
new file mode 100644
index 000000000000..1e131b38230d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
@@ -0,0 +1,40 @@
+Support usb hub and usb data role switch of Hisilicon HiKey960 Board.
+
+-----------------------------
+
+Required properties:
+- compatible: "hisilicon,gpio_hubv1"
+- typec-vbus-gpios: gpio to control the vbus of typeC port
+- otg-switch-gpios: gpio to switch DP & DM between the hub and typeC port
+- hub-vdd33-en-gpios: gpio to enable the power of hub
+- pinctrl-names: pin configuration state name ("default")
+- pinctrl-0: pinctrl config
+- usb-role-switch: flags the driver as a role switch provider
+- ports: two endpoints to connect the usb core role switch provider
+	 to the usb-c tcpm driver.
+
+Example
+-----
+	hisi_hikey_usb: hisi_hikey_usb {
+		compatible = "hisilicon,gpio_hubv1";
+		typec-vbus-gpios = <&gpio25 2 GPIO_ACTIVE_HIGH>;
+		otg-switch-gpios = <&gpio25 6 GPIO_ACTIVE_HIGH>;
+		hub-vdd33-en-gpios = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbhub5734_pmx_func>;
+		usb-role-switch;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hikey_usb_ep0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dwc3_role_switch>;
+			};
+			hikey_usb_ep1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rt1711h_ep>;
+			};
+		};
+	};
-- 
2.17.1

