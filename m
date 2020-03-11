Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16172C4CECE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E32D020749
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTDyI5/K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbgCKTO5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:14:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38053 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731198AbgCKTO5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:14:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id n2so3398122wmc.3
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uJCk+HQYgUH7qWgjKQGPX8ag8V+DQkqOmcR60lBEBw=;
        b=DTDyI5/KA68gkxBsjUHDiz301KxXFfP/qTr0ceS5thjlAGXbEyqOanrRA+YnGSI5hv
         bDIQ2l44yQYfXt+dxgW+hmAl6350SbPvH+gNvQhOfblA84fbeVEGoTnaGSEzCMhwmlYF
         iDa4Xk9oOmei64zlufXXpz+UKf8O6SZ7+FRGVvgwX5+WT39VMu6zpYtMPxjbWmmeJM26
         eAM6qIAF32yIiiJG1MpfXFPFuceift9DquCEFlsWREJbPDQP/HIaMcz7IpV/1TMhox1e
         LNtcNfggHIs4Fx0NHBMIEQ1WkiywMUUVwdEZNckbS22sDwVdq1faXRc3k/4ZrCirXxxJ
         M87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uJCk+HQYgUH7qWgjKQGPX8ag8V+DQkqOmcR60lBEBw=;
        b=KmG/FlxNxzUx5uVMEweHoq+eaiaySpOO81wc6EC6flSapCDa+J66Qjc17E+BRJj//n
         el3EUkpG8JO1NDIX9IExdnxhqkdGtyR9Na8EDxurWP2xhq0QQAYnxNWAoy7rRCzQL2cd
         b+X51OdXBwaMwkWsW6r3uwIPttjNQ/2vRYo9mmEiqhziIVxXpYxhAIFM94MFlGW8KWkF
         cABmrQhDjq5630GLEYHoya4rD8+2W5RD5gzHTvCuHbVqqintiIi52hv+F2tCFMpFOKdT
         J02MPyDKDpjAUVhUuTc3hhFWbgJsW2erMnS4U3Djtf23MdqWHJF+5kF5dhc+/UqW3WMu
         skAg==
X-Gm-Message-State: ANhLgQ3oAVn49ulRuDXNQA7IE+pypf4lB0FJWnsdAUN4XTgCLHJLie+8
        dSnfxs4WK6DuItIS0Vc9EOhCPw==
X-Google-Smtp-Source: ADFU+vtBiBpemFTC15uMfOPHxzMFb1eqF6p+FRAbAGHExH6FcGWz6NITcSVHBIGYMbMjn3vDHo01bw==
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr218306wml.105.1583954094777;
        Wed, 11 Mar 2020 12:14:54 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 5/7] usb: dwc3: Add support for usb-conn-gpio connectors
Date:   Wed, 11 Mar 2020 19:14:59 +0000
Message-Id: <20200311191501.8165-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the ability to probe and enumerate a connector based on
usb-conn-gpio.

You would use usb-conn-gpio when a regulator in your system provides VBUS
directly to the connector instead of supplying via the USB PHY.

The parent device must have the "usb-role-switch" property, so that when
the usb-conn-gpio driver calls usb_role_switch_set_role() the notification
in dwc3 will run and the block registers will be updated to match the state
detected at the connector.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index ba0f6cdc4c71..2705871ec95e 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -539,9 +540,30 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 	return 0;
 }
+
+static int dwc3_register_gpio_usb_connector(struct dwc3 *dwc)
+{
+	struct device		*dev = dwc->dev;
+	struct device_node	*np = dev->of_node, *conn_np;
+	int			ret = 0;
+
+	conn_np = of_get_child_by_name(np, "connector");
+	if (!conn_np) {
+		dev_dbg(dev, "no connector child node specified\n");
+		goto done;
+	}
+
+	if (of_device_is_compatible(conn_np, "gpio-usb-b-connector"))
+		ret = of_platform_populate(np, NULL, NULL, dev);
+done:
+	of_node_put(conn_np);
+	return ret;
+}
+
 #else
 #define ROLE_SWITCH 0
 #define dwc3_setup_role_switch(x) 0
+#define dwc3_register_gpio_usb_connector(x) 0
 #endif
 
 int dwc3_drd_init(struct dwc3 *dwc)
@@ -557,6 +579,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		ret = dwc3_setup_role_switch(dwc);
 		if (ret < 0)
 			return ret;
+		ret = dwc3_register_gpio_usb_connector(dwc);
+		if (ret < 0)
+			return ret;
 	} else if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-- 
2.25.1

