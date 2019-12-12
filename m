Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE8AC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEF9C222C4
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 01:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZw/F1Ml"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfLLBmx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 20:42:53 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41651 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbfLLBmn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 20:42:43 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so318492plb.8
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 17:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lzv7sY1flH0+P+bTRde+D/HgFmOOUcTmct5WYnIY1iE=;
        b=UZw/F1MlTuPlHpKe4kDgjY8F/v9Xiz+1gFoJAVS8UHhspGP2Fpw30FdQGna543kbZg
         NbdJ1yCDvKj06pyzxBU0LtWEiCOyPP2nEnN5BQp2LQPpQQh1psGtyt854LkbViLnC/lZ
         zz5LUJ5yIGZ2v/n8y29ac7682PdEVLzC0fdyMrtdayTHw7t725nH9/M9yyMuNfvE9asz
         LvvbKS5ncKH2sjpaV1y6oNpbpM55xotDt0IKntm3jKD+mR2Cbrs0sG1O55wRIIcJcdVc
         haJ/fBVgZw5PBDj5189st+r/ZpQMkoJcgE/UEqyhv/NtKX4ai4J9wrizbLIRKyjvs6vz
         8YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lzv7sY1flH0+P+bTRde+D/HgFmOOUcTmct5WYnIY1iE=;
        b=t8rTLS18jq0OizMNIKspPsg8LOng0KYrNyG/vShzVR8c+i4IxuSRGRisoHGqIAbX8/
         pWHHXkWhDTa15+mvSw7mHHkyxaQdj7hKMDhDcj33dmGee377ZAtMqwm6j9NWZlW8IpMO
         1qNxDxOv7Lw8B6r6p/+sImhu9JofpOnjx7Znh8bokHtT3ND+YA8Q8gVf2BueTdz5mogw
         SH4kUJ6OaVuATfTt8R6PnP6YXrzNhKTvTTdhS8nGfta8lTC74nioYifzypOciCpvdmSq
         DZxnC/AYDnMR4XxtqjGDqBukaA0LuqrXwJVZpDX/4pXcnTi2XWA2u5rp7XqrqenlGf7a
         Iu8g==
X-Gm-Message-State: APjAAAUboU+V3rOBwmatTj/uO07B7xEoKYhqsF0GcVwCCuCz2/UbYx2p
        qwTayK9SZsX27P3f+9JdjrYw+A==
X-Google-Smtp-Source: APXvYqz1y2cw7lalEK+SC8etwGXhPJDXQAo5rWmg0AyCI1cAqs37h6s3jVRWoE17CI7K8C0/J8/9lQ==
X-Received: by 2002:a17:902:43:: with SMTP id 61mr6924104pla.88.1576114962763;
        Wed, 11 Dec 2019 17:42:42 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:42 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 6/8] usb: dwc3: Rework resets initialization to be more flexible
Date:   Thu, 12 Dec 2019 01:42:31 +0000
Message-Id: <20191212014233.32799-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The dwc3 core binding specifies one reset.

However some variants of the hardware may have more. Previously
this was handled by using the dwc3-of-simple glue driver, but
that resulted in a proliferation of bindings for for every
variant, when the only difference was the clocks and resets
lists.

So this patch reworks the reading of the resets to fetch all the
resets specified in the dts together.

This patch was recommended by Rob Herring <robh@kernel.org>
as an alternative to creating multiple bindings for each variant
of hardware.

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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Rework dwc3 core rather then adding another dwc-of-simple
    binding.
v6: Re-introduce this patch, on Rob's suggestion
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c6316d4b7593..19504b907476 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1462,7 +1462,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_properties(dwc);
 
-	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	dwc->reset = devm_reset_control_array_get(dev, true, true);
 	if (IS_ERR(dwc->reset))
 		return PTR_ERR(dwc->reset);
 
-- 
2.17.1

