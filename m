Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E0BC352A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E75C82082F
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="px+DpFJl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbgBJMIK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 07:08:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36746 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgBJMHl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 07:07:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so7363044wru.3
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 04:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=px+DpFJlrCF3XkAO7JeVfvOvn9wvoJh1AVMMbqRzO55pJqim3Zp1YpnLBTtCjSSOCT
         XhrNaz9fXXryRZ0wnlhMPodAzcRuRYE9oB0miRPR9EeUCRR61Ql+r16MVZ+WrhaPL7at
         3ROSBx+ciU3NrDkhNxLoaVNz7mhrH0FFk8vqq3+sppGKECSshe7ao4IgorzskSwzoccU
         bOr2gHwEK2aP/BWp/df5yG1WDkKyxV5ptuUEDGh5ZzgVr5gQ6YieN79gDggu3wajz7id
         CXxDkWJqKBGoQM+6UCaQ6j8xi2+nAs8X6eZk/TXoFsRB5yd04ndJxAzqikoWj5tiPaOy
         IBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=Y8tx1uclAz4UmPxdo921twXuInuDJwKN3PhYRiuaeOAQ8QKCXvdQm7lBoGGeepA96V
         Tkhvq19czlSVT1ixG9H+skM/CfTDaXp7FDQWlHycChNMqTDhvLcpeJgm5+6MSUJovll6
         jFdS75yBujRdjTgiJdxW5JjH5nZlhr2H2EcZYQPwWB+EooVxpE141ILwXwCpkmYnS82G
         FJyx7H5OQyyLmPwbsrbRoBKkA8l5n4eyWcI4UjrYO4AQjKhNZmFehQNMIqcy29NLH4is
         TM9ZANeMUariZnO+tQuUp1PlZkO4aOepWVZVlMb5DkvYbH91wH/sOiUMkv/rDgXqPFxv
         ADxw==
X-Gm-Message-State: APjAAAVb90PNPp2A5tEMiipcSuMMMh7AX9R1U3ffsqxqKGDNd7Gmz23s
        SgYeheRjGbcyIucx093IZ/i3DA==
X-Google-Smtp-Source: APXvYqz7hWldIQRJ5dcfzSP/g8ugSVgOzTalYGWKdCoryuvtGnH0/IDxQxOV8MnjiX4pI8Idy7KPew==
X-Received: by 2002:a05:6000:108e:: with SMTP id y14mr1715498wrw.338.1581336459167;
        Mon, 10 Feb 2020 04:07:39 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 15/18] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Mon, 10 Feb 2020 12:07:20 +0000
Message-Id: <20200210120723.91794-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The USB ID pin is used to tell if a system is a Host or a Device. For our
purposes we will bind this pin into gpio-usb-conn later.

For now define the pin with its pinmux.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index b6147b5ab5cb..abfb2a9a37e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -270,6 +270,20 @@ rclk {
 			bias-pull-down;
 		};
 	};
+
+	usb3_id_pin: usb3-id-pin {
+		pinmux {
+			pins = "gpio116";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio116";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
 };
 
 &pms405_gpios {
-- 
2.25.0

