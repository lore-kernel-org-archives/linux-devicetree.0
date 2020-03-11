Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E4C0044D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:14:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5691420575
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5JY+QA/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730807AbgCKTOx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:14:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43433 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731174AbgCKTOx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:14:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id v9so4104680wrf.10
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vudtvgrawzh2cqBvZiaEVAxNMRavt8ab+X8qR17ohY0=;
        b=m5JY+QA/QUJA9VTYBe+0CbDg4XmYWs7WE/pYH56q5M0sVsOx8WSbjtjw6nEzvTDKPq
         H9GZyyKugZofXpVnusJymMXlS2mo+tVqc8AgeCmZi0edjd8NG/BXU+yrMPls8R0kTw9G
         gs1joCi63VOl6EfNNZXIugNXG7RkCXoxwa9LsPVWWEuu3f915knt0UEVUIndHkw2YXmr
         /2bci8jq+Bad5Iysp43W6297elcHRaucbhUPRF/kn/sfF/N0NmX0Dx5ZSNYvsBXvZJ4F
         7HSRbdhWoBKahanX72G3WsBeGEWrRtVXufLXBm0BXGjrTgTw+92asGOzu+TuRy77EjGX
         ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vudtvgrawzh2cqBvZiaEVAxNMRavt8ab+X8qR17ohY0=;
        b=bV4QzcmYvlmFsSwdoBfrGB5Qkru+yJWekP7h+KKGbyZopUGNLvArSWdQ1c1zSYeQ6I
         fVz7x8ui9BSz7RX/z1iMa13l6Au0eiX480ZjcSOB+BQzBYkeV+mMw40GJEZ2Iykd3Vtc
         y0K0dUTQg2vAsTdx3Y5I8l1lNAN6Vue1f+4HZFTQ2OelQW0oWPx6V/6iZ0hckCrABjbK
         OmW0kjamkBSwhRR53tnCduanuRTV8RAvtJXcP2VSuuKTpK76rgnpuDbiufa6sL7UOZWk
         LAadPDmGdalE4mQMPIcp0Ib3t9l4z0+ZqI9bpB3Yb255DjEnAV3pkzPy2n9Nj2vKqJ/5
         Jvxg==
X-Gm-Message-State: ANhLgQ0x1uVkJszILYiWX4a72rWRllIpZJUlFFCQoy2Tiro6h0uHiuEJ
        XF+wMVDEy6VFMPXR2vR7bDlHhw==
X-Google-Smtp-Source: ADFU+vu3rbsfGj5lv53zHTIxxCknP10LPZkBsCQj1xgQ/tIOnVushQXhnqSggkti1tXNRngLDmpjiQ==
X-Received: by 2002:adf:d081:: with SMTP id y1mr5604944wrh.50.1583954090994;
        Wed, 11 Mar 2020 12:14:50 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
Date:   Wed, 11 Mar 2020 19:14:56 +0000
Message-Id: <20200311191501.8165-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds an example of how to do this
to the dwc3 binding descriptions.

It is necessary to declare a connector as a child-node of a USB controller
for role-switching to work, so this example should be helpful to others
implementing that.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..4e1e4afccee6 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,4 +121,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+
+	usb_con: connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.25.1

