Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29F1CA9ECB
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 18:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C76B208C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 18:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byzZsRbo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbfJaSiM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 14:38:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42237 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbfJaSiM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 14:38:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id 21so4943818pfj.9
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=N1sFZqwPmR4rpLnTH9EOl8Ec1vu8lx2vJgOvXRwWkdo=;
        b=byzZsRbo1K5r5tZ9HCdoeKVaM2vVjUyHpMT8oMNzYnFVyuGnd51bXKwnJz/wYP4tLL
         md/RZdp6ZrW6+UC+s3BaSFceWg3YjZw4JKw9O5j9QqfGmucTLWkTvDlDQ3KkQhFfm8bv
         Mmqm9lB4VFO4p3mNYVJUBPX/drJlSHi9+TYQRSNVIkwnIzTr2Zmv5KieSjkseQFvzvSX
         yIDb7zFiftuB/fKiSZZZJtLcOJhKp995o20a0vYkyjrNPxH96ysTxPOdqrBw5hHs4oxK
         VIwGgkuXQTSJNBYt3RJf46PQ9KHuPuyJEd9vw/lWFTck3sdLVst85/eV2F6DOCsPGJdY
         TFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=N1sFZqwPmR4rpLnTH9EOl8Ec1vu8lx2vJgOvXRwWkdo=;
        b=IMw0IQxsOYzIj7lbafkvth5O9hLqFEjTJv8MIoYZu90fMA2lnO6McYPQ8S8e2HDzCo
         fNkPOsTejigXv99t+YGy2m6VKTsodnPBDhhgHAmDrw6063wijTaj+22MQ+G8gslpHURR
         KcAhWnGL8Een0XnSmDPPcX+w8Q/dV0nl9ghUcWxwY2AhdrREt3JwshIBvjtHxil6HtHD
         nc0MKJQZz6Ekqr2bVYi6cFjuMKZ4XnofCv16XXngG7oz0lzVWVkbP5VRPoBp+6WaYiMJ
         B+r0gyLRRQm/6Zab/l7xK9Hk/RdrM7JyS/gFVWOFbvbvW1AUHkuXCcaiAZrk9YaL+FWR
         3n1w==
X-Gm-Message-State: APjAAAWS8DreHf8MND/0pmLPZVrwKQqzrPBMsTppZCkFv2KH3k2A1uAk
        uqYdm4sE5HmaEBYrao+ORmQn8Q==
X-Google-Smtp-Source: APXvYqz2z4mCOV4dafyiPlm4jEuXwGM0HcicDzIRwe+C+Ny2iK2C7j6WEqW/rQguEW7FhHp66Lji9Q==
X-Received: by 2002:a62:1ac6:: with SMTP id a189mr8291977pfa.96.1572547091322;
        Thu, 31 Oct 2019 11:38:11 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id h25sm3867466pfn.47.2019.10.31.11.38.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:10 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v7 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date:   Fri,  1 Nov 2019 00:07:29 +0530
Message-Id: <72cc755c16888976edea555f1df60a299daa8a1e.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
zone for each of those sensors to expose the temperature of each zone.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145..33c534370fd5 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -217,6 +217,96 @@
 				};
 			};
 		};
+
+		q6-dsp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				q6_dsp_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		modemtx-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				modemtx_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				video_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		wlan-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				wlan_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		gpu-thermal-top {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				gpu1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		gpu-thermal-bottom {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 10>;
+
+			trips {
+				gpu2_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
 	};
 
 	cpu-pmu {
-- 
2.17.1

