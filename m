Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA99C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 13:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 415BD20740
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 13:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kV9PIvsT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfKYN7R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 08:59:17 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43554 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfKYN7Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 08:59:16 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so15946321ljh.10
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 05:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lG/dEFJRZZJTFXBXNbPzSOBTEcwuaUVy4vDeRn16uLE=;
        b=kV9PIvsTpDEeeeHqrU+NlQGF4XNrp1onAZwFq0GJ859YcuVZqo6KJEB4xsj48nIiez
         T9wnQsCNszYN9h/W2hciuikxEUGQt+Nq/3zEWDwlxIPXFm7D1pdguMsfNYsa4TLqRQTJ
         8loQxAFsJQwzhVRZGzBQLeYn+snDn8oGfzecVMzM8ZluF0oDUq2bbFQKQr2sx8++CuVp
         hEydHcpEsu1ruAZQiVu/zBDvn50rpeb7cHsfs2GYdv/9NezdQ1jfySrXD311n+6QpDvs
         Mmauq7PS4XYV5ud6cQw/N0wKpYI5QNHxCKSkJE5J/67OWxCwt/szeVRdEysRi3sHkq8s
         qqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lG/dEFJRZZJTFXBXNbPzSOBTEcwuaUVy4vDeRn16uLE=;
        b=HbCVCYG13ncASaLHB+48sH7o4zSlGIFlk40ZB0NfYM/RquS0TIGfKSCtxiYXFnkbrY
         M4n1j8TVhCinYjyG5eJTTDV3I2b+t0yDxbsn4iL+FQcMgWLBivHSl33J68n2brVzKuQq
         Oy3xdGHowgDmOY/LTUflrwF3L5UhDkdysDAvupCphb0Ud3Q3sWDG941UTbmmLYL+/ZOi
         8O5jZWcoVkvEJ3HhLQv5D12Z6trYMmtFksV//iAQmxN1CsNqJfURjtBK2+OplXjT0hqW
         23jY+cXX4lxrLPz3zM9y/qBH+dVYBGJwlanQ3RNmHLMAKG98gaIXd56JynW2YgSkLqwn
         f5qQ==
X-Gm-Message-State: APjAAAVO1uvJ1siq4ywl/FZSS8Lj4DYjyQiJ8vSzlPxyTCLTyURQ9HnY
        DV4tMA2yMvib+m4Mrh1ZGUmmrw==
X-Google-Smtp-Source: APXvYqxEMXtn++rv2T6XDXPQbZOMiGrgR/+Ja1deh3/9f2yuhrPDoGo4I5zMSZUtzpFDFbhsPetlZg==
X-Received: by 2002:a05:651c:238:: with SMTP id z24mr23019892ljn.36.1574690354127;
        Mon, 25 Nov 2019 05:59:14 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id w71sm4189705lff.0.2019.11.25.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:13 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: mailbox: qcom: Add clock-name optional property
Date:   Mon, 25 Nov 2019 14:59:03 +0100
Message-Id: <20191125135910.679310-2-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

When the APCS clock is registered (platform dependent), it retrieves
its parent names from hardcoded values in the driver.

The following commit allows the DT node to provide such clock names to
the platform data based clock driver therefore avoiding having to
explicitly embed those names in the clock driver source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v2:
-Swapped order of "pll" and "aux", in order to not break
DT backwards compatibility (in case no clock-names are given).

 .../mailbox/qcom,apcs-kpss-global.txt         | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 0278482af65c..beec612dbe6a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -21,10 +21,11 @@ platforms.
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: must specify the base address and size of the global block
+
 - clocks:
-	Usage: required if #clocks-cells property is present
-	Value type: <phandle>
-	Definition: phandle to the input PLL, which feeds the APCS mux/divider
+	Usage: required if #clock-names property is present
+	Value type: <phandle array>
+	Definition: phandles to the two parent clocks of the clock driver.
 
 - #mbox-cells:
 	Usage: required
@@ -36,6 +37,12 @@ platforms.
 	Value type: <u32>
 	Definition: as described in clock.txt, must be 0
 
+- clock-names:
+	Usage: required if the platform data based clock driver needs to
+	retrieve the parent clock names from device tree.
+	This will requires two mandatory clocks to be defined.
+	Value type: <string-array>
+	Definition: must be "pll" and "aux"
 
 = EXAMPLE
 The following example describes the APCS HMSS found in MSM8996 and part of the
@@ -68,3 +75,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
 		clocks = <&a53pll>;
 		#clock-cells = <0>;
 	};
+
+Below is another example of the APCS binding on QCS404 platforms:
+
+	apcs_glb: mailbox@b011000 {
+		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+		reg = <0x0b011000 0x1000>;
+		#mbox-cells = <1>;
+		clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
+		clock-names = "pll", "aux";
+		#clock-cells = <0>;
+	};
-- 
2.23.0

