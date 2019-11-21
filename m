Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D77C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 05:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 591E22089D
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 05:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FcyT/9IS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbfKUFRd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 00:17:33 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42484 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfKUFRa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 00:17:30 -0500
Received: by mail-pl1-f194.google.com with SMTP id j12so998661plt.9
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qt9koM1LHBmgQkeJkd8cthdiqJNvUQyFhHQ//lqCfgM=;
        b=FcyT/9IS6MHjiwahzYdVH3N1GQ+MK4ukLef367ioMGyT/L0WQwOVxnWOPm1Ail6UDh
         px6AugZ3oUk6fyzZ0pvnQz1CgIZ2kEZH7Kz7rA1VGPeiF7gGXOnCV0dKvi/Ozrnxryxy
         L16oVlJOG8SLqM80q61Ls2ehFebbAgyGuEVMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qt9koM1LHBmgQkeJkd8cthdiqJNvUQyFhHQ//lqCfgM=;
        b=tx5Ncqw9lBtdPxgqAdsOo3szdpYv5aFXgD2KZ6zbrl/rtuz48M9GM8qq/vTS0V/U7H
         dL0Y2El6eOS6UOEaUQ+/GYJy73qm644Z2meNPcKl1yLBFJaAz6XNnu4eN+9zQDjS7ydP
         bwVmQH+Akv964JkvDDC7+vpH5FCIikobyxekQsqD97I87FnpW5UeQ6hA+dvbcNwjFRHL
         gWEqsIK6rnfOpZLYtbF82Y1zFXT6n+//itc91j0h1pxeh2g0EV3CMf4GG6ZAib0BxvUQ
         BF0CXuWUxwfRPoy/a/UxADN6wA4cjlIlWYpmhKKcSCbSue3rFNwkJtW8Od++gmwYZf75
         mFjA==
X-Gm-Message-State: APjAAAVe4rQZksIZX5pVanJ80l4W2BcGpWRCl3EbuIrBoi0aOVclG7oS
        IUZn+a+NbDOlkdmS/VpJdcziVWS+dWEvWg==
X-Google-Smtp-Source: APXvYqxBWKwQVCFM/1gTdB6N93iKAMbhnEC3bfcQuaQYIbCr0a6dqG6+2QNRVxc1UuMuydZ7odftNQ==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr6956371plp.18.1574313449223;
        Wed, 20 Nov 2019 21:17:29 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id d11sm1367463pfq.72.2019.11.20.21.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 21:17:28 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v2 1/2] dt-bindings: usb: add "hub,interval" property
Date:   Thu, 21 Nov 2019 13:17:24 +0800
Message-Id: <20191121051724.110576-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "hub,interval" property to usb-device, so a hard wired hub device
can have different bInterval from its endpoint.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 036be172b1ae..44bef2ff2704 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -66,6 +66,9 @@ Required properties for host-controller nodes with device nodes:
 - #size-cells: shall be 0
 
 
+Optional properties for hub nodes
+- hub,interval: bInterval of status change endpoint. The range is 1-255.
+
 Example:
 
 &usb1 {	/* host controller */
@@ -75,6 +78,7 @@ Example:
 	hub@1 {		/* hub connected to port 1 */
 		compatible = "usb5e3,608";
 		reg = <1>;
+		hub,interval = <8>;
 	};
 
 	device@2 {	/* device connected to port 2 */
-- 
2.24.0.432.g9d3f5f5b63-goog

