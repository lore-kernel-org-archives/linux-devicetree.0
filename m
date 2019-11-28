Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625DFC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 05:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 390B621775
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 05:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRoVK5do"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfK1FKi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 00:10:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34087 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbfK1FKJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 00:10:09 -0500
Received: by mail-pg1-f195.google.com with SMTP id z188so12288722pgb.1
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 21:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ouUtqJi8LGrm8rrsEkCm6pqbpQoOVXeEx8u8OcmIa0k=;
        b=lRoVK5doRSRDbRTAAJnPpfGG0jqnYt4E9nzW5oAevteuhSV0bqeuKhhCkEEhImCFaj
         iwr9QF0pGo8EWPpe8QBpLIhwIZXaOiK0nZsY+KB8MVcuXVYhlkqNqbIDt3ZBsI5KNVUt
         UtEADqokuYMdxi0rGQ5jhmt+znDOCaTls1MbNSlLRhn8FIbeTwTwafDs9W6OCCvfwczx
         slgKI+hQCG1Y/fYUBue5N8LhwXugyZD2KXj75N/7pfpvLc54zw0yPbiYLeHOIJTqVy2k
         kSqvElS17wUi4JCtzv5IG4E3Ecmw18ALYxd6n7VlK35wVwv3LsaGA/emiZca/U72O6p1
         pmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ouUtqJi8LGrm8rrsEkCm6pqbpQoOVXeEx8u8OcmIa0k=;
        b=CLlOD+wFT/jYnLUETwsVAoscJrn+IQSv60KADFxej011WLRqg6ExTZeKdg7XsYMXkR
         ScjwJ0keJWFaBx3wKzS5CSEO/WyEPjYY/Bkhd0c9M3/BlZrOwsSW/E4Mf6LfJ+fRg0a7
         cBZCj2wva0BR382Fd/M0mlqU73aeqTYkN1IcXkaWt8UuUV85KuXtbaPNoasVr0S5e7u6
         i1wIBWAeJVBSbmV4bZZ+JQS9yRbk91TROmdFqu0e8H5PwFJ4Z2/9IQR9uUb+YnR0ko7C
         UxXPhFK2UhbpBACNWm5JarCP26RydjL/Jm8qL2dIfJW8fIlGArUfyKbtJ9cBuLikZUA2
         Dh/g==
X-Gm-Message-State: APjAAAVCWfITiVwd6OhCXOs1tDa0VhztImeAhoxG1wbimhS212t28nhH
        Y0kdIkhSmbfUWgcpVLIcAOaQGA==
X-Google-Smtp-Source: APXvYqw3ZxeK1KWVoQYkQZwW5gUw6ZrpY3pVlZhbG3RaFiSUJyRNEgOJwBNo/d4aRPX19W30JLm64g==
X-Received: by 2002:aa7:8b1a:: with SMTP id f26mr29781944pfd.81.1574917808709;
        Wed, 27 Nov 2019 21:10:08 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:08 -0800 (PST)
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
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 4/8] dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
Date:   Thu, 28 Nov 2019 05:09:57 +0000
Message-Id: <20191128051001.18995-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rather then adding another device specific binding to support
hikey960, Rob Herring suggested we expand the current dwc3
binding to allow for variable numbers of clocks and resets.

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
Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I0176989314d7b7e6ea586f5036f072442f7e34e1
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..29768b0ca923 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -7,7 +7,8 @@ Required properties:
  - compatible: must be "snps,dwc3"
  - reg : Address and length of the register set for the device
  - interrupts: Interrupts used by the dwc3 controller.
- - clock-names: should contain "ref", "bus_early", "suspend"
+ - clock-names: list of clock names. Ideally should be "ref",
+                "bus_early", "suspend" but may be less or more.
  - clocks: list of phandle and clock specifier pairs corresponding to
            entries in the clock-names property.
 
@@ -36,7 +37,7 @@ Optional properties:
  - phys: from the *Generic PHY* bindings
  - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
 	or "usb3-phy".
- - resets: a single pair of phandle and reset specifier
+ - resets: set of phandle and reset specifier pairs
  - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
  - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
-- 
2.17.1

