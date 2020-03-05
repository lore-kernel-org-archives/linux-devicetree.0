Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3C5C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 705DC20848
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 22:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVUPTJyz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCEWAa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 17:00:30 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35099 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCEWAa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 17:00:30 -0500
Received: by mail-pf1-f195.google.com with SMTP id i19so45688pfa.2
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wTaa/QRdsqczZDX6h1D+px3bH8d+/g2hygy90Zi4drI=;
        b=dVUPTJyzW5LcfErzU7hNxmQBgfIl4e6jxriBrWlurh/eYfqwDimN/p0cAWn+JJG93F
         DuZ0DVP/YN8R5qjEN++1ox+gSLccFBuxPvvNs6GpMLIOpYy6k6Vsg5/rRgDKCqmigS+5
         s3AmkgNu4GzNifT6N8WZtg+1uwSlW2JWRhw8xsvS1s+aTRymdq6DEo8o37ayjFKD3cNh
         kMLCcs0KSp9LVVuu4UDzpqKHWYmfT5SeMN0tcRP5H8C7+iNi6iQ+ACBjqDGRw020VzSu
         e3ORc9IIbOKF21hAAhVHDg4yeUXQ/MCz/uAva432MbdCeRSXRYrwQis5olQ2S1ixY1mP
         YzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTaa/QRdsqczZDX6h1D+px3bH8d+/g2hygy90Zi4drI=;
        b=hsg8Gq97UdkASI28iIZmiLXGBEQ1tVkl6ed1jBRUuxzHUWjs43Z1//qm3MBEGA64fi
         TRjoalshKUbhcv31N/XuZDscVkH9VSvAxa8fm+j41OY2kwUXG5u8rYIoJwEIKa05++R/
         LDkRJLKEoBXGJVe7gFkC58h1OI7arD1ovskD/r7UZ/S8xNc6PebzeTkRAwu2FLo/bsA5
         PpwdjCTjoihFfSLpoz2xTY7o6eSY6lxk7RhQHhvAzrsMUNVo7Nu4VJoZkF0XyDhaqUDT
         yBBoVY//Wd6ldwZFWBCKpeDfv9/HhipqJ34wcz25Keqbn0SFhoRLgmRXLkXBWxBtvfhv
         vxow==
X-Gm-Message-State: ANhLgQ1UVApyxN1uj5UULuqll8tsJdo1OFseYlk+sOXxv+mxnZh46/5z
        IjvIMo0a0g26QnbDJeqgyA6tVQ==
X-Google-Smtp-Source: ADFU+vuGwqyqiL486t3Ou1O20c7qv5ScBds1tQy25aEpYUtBS236dtb17qhDsi2yYb2FueoMz6Mx0A==
X-Received: by 2002:a62:f20c:: with SMTP id m12mr476692pfh.64.1583445629226;
        Thu, 05 Mar 2020 14:00:29 -0800 (PST)
Received: from localhost ([103.195.202.232])
        by smtp.gmail.com with ESMTPSA id c73sm7038684pje.44.2020.03.05.14.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:00:28 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: arm: cpus: Add kryo280 compatible
Date:   Fri,  6 Mar 2020 03:30:13 +0530
Message-Id: <6db6e3412e82fdbaf81a2554f176402a8a718bf6.1583445235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583445235.git.amit.kucheria@linaro.org>
References: <cover.1583445235.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Kryo280 is found in msm8998, so add it to the list of cpu compatibles.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 7a9c3ce2dbef9..8e01d7acd4278 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -155,6 +155,7 @@ properties:
       - nvidia,tegra194-carmel
       - qcom,krait
       - qcom,kryo
+      - qcom,kryo280
       - qcom,kryo385
       - qcom,kryo485
       - qcom,scorpion
-- 
2.20.1

