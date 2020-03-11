Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5049C2BAEE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 17:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C98120746
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 17:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TfYJfPNX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbgCKRVW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 13:21:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35433 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730526AbgCKRVW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 13:21:22 -0400
Received: by mail-pl1-f193.google.com with SMTP id g6so1410781plt.2
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BvrsPeqWN8PtkcsNQt8nmKsbCOyaPIU6nwAu5WHHWq8=;
        b=TfYJfPNXDyg7iWT/Fd3jB7IH6WKr/zMsvJ/gTE5hEguO2A3zg+wjjQxZg/cPmIojfA
         cKBJKHCfLfAOqFDrSuM+KQ84YqXozsJ4LwtT2mAB+ZD/OV8kyP9AjFfazLce0v7E3izJ
         ahAYskc18sFP0iYb4bjjdG8tGkrP+TAGNuBEZgqnSoTjI0V2ne6LozkbFwwd0OkiBgnu
         X9bkB45h5OHWLGqTkTrjIrd5KxXIz/Yp7uxPgNG5fKiF/3BqXF18pKQjTptae8oVVDrl
         2HQF5kcQrEfjYyz8ZyG9TIkgKrAENB+1UgeqD5AanPNV3wtDt7B3CGTD6W/O+nwhgHCo
         W9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BvrsPeqWN8PtkcsNQt8nmKsbCOyaPIU6nwAu5WHHWq8=;
        b=Dc54JmILKuRb8c3xmNhegssgWcwcxBEv+QeLMBDgiKGq2lRhdlkdLTYlhyGK+gMNor
         R0iX54DGSbg9pYGTKMAtKPXQPwGnHzGVCkqoZJjCe+pdsR502kd2Kc56EicQDkKWVHju
         e+81h0M9WJVqcVgf/kuJ8kceOKq4GPHCl5FuNa2738Q6obGz9Gw9EgX/mZBB7zLAl015
         oj3oNwqJvJduk1fsdhdIRac27+cocR2bs4K9c0pSg1jXHXYhKm3OY0aeiSIeA8FTbogd
         m459uthxg/vKFFjFOuEIpkZ5jIs1Fd9BnBs7Ft5JP/4dE/FfMHoAeSpZeTu9DGYKDkNb
         K/2w==
X-Gm-Message-State: ANhLgQ2nvISBXj+5mGEblK1Y7dUdLcdsAXVdSudMhAG2BDy86dODRasW
        dp+vkzMyWYGko3Di17szeLdhMA==
X-Google-Smtp-Source: ADFU+vtC1b03FsBk1BpWenvotET0rYCstf8uvZMELbv4ZkHpP4tW/T/5xcVCLk7efl+kVQr7Studug==
X-Received: by 2002:a17:90a:b10d:: with SMTP id z13mr4563816pjq.132.1583947280382;
        Wed, 11 Mar 2020 10:21:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b24sm14914053pfi.52.2020.03.11.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 10:21:19 -0700 (PDT)
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
        Jack Pham <jackp@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND][PATCH v8 2/6] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Wed, 11 Mar 2020 17:21:05 +0000
Message-Id: <20200311172109.45134-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311172109.45134-1-john.stultz@linaro.org>
References: <20200311172109.45134-1-john.stultz@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add binding to configure the default role the controller
assumes is host mode when the usb role is USB_ROLE_NONE.

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
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v5: Switch to string rather then a bool
---
 Documentation/devicetree/bindings/usb/generic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index e6790d2a4da9..67c51759a642 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -35,6 +35,12 @@ Optional properties:
 			the USB data role (USB host or USB device) for a given
 			USB connector, such as Type-C, Type-B(micro).
 			see connector/usb-connector.txt.
+ - role-switch-default-mode: indicating if usb-role-switch is enabled, the
+			device default operation mode of controller while usb
+			role is USB_ROLE_NONE. Valid arguments are "host" and
+			"peripheral". Defaults to "peripheral" if not
+			specified.
+
 
 This is an attribute to a USB controller such as:
 
-- 
2.17.1

