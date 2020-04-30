Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84657C8300F
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 09:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED4F2173E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 09:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="iBd84ggD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgD3JHj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 05:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726930AbgD3JHi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 05:07:38 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE3CC08E859
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 02:07:37 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x17so5900829wrt.5
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6LWNLbbug+kOK8gudRYkqI8/+G2DNYHCHmidemuCiQE=;
        b=iBd84ggDJFof8EZ9qo1Y9VkaE8gV3w9MJt68Q8FVbP1s/YM6DhBWT0hmczB4LiYEy3
         f1V3v2oIzHUBrQbwtstbpxFS9mdASa3Xg6lBd2LdZE69f5A6ELeckgB7G839Acuo79RJ
         93ZTkskH0/a+B3I+RLSEwUodVDJNpZ8AXUVuLbEtFrICcLOpZjmTB2F8i59o7UIwE4o2
         am7TT3Cc0nIz7yNbl4qQ2EN39ecAoiGYX+S6V+sKLWAzj6PFSXI+eODNb0fTqEiwZOqD
         djnaIf1vO5blvwnioGU6WPedeOlA/TUR/KhKct+hTNMepKHLBwm/16rPDrTvodw1Ojs+
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LWNLbbug+kOK8gudRYkqI8/+G2DNYHCHmidemuCiQE=;
        b=q7gAAJZpucwqHTawdyBMGe3aysGHj5IalQBb2SKUOT/J8SFq1UHCNf0PstefPWBYF8
         KgcNVaX3bYVQcT8vPqy+BSq4XM84cHdit1yecTCU2+7CArONWOzKxFbn3nPQrlZyZ1j2
         Sq03u+FKU5vXKlvR2gSfxirHI58C9LUX7UWo+oUBEHqo/f3yxZn3EYxijKfYJQq0ij+j
         oUq9sciZuy+9Mcn18FhlW25BM9rHj6BFjVHvggoJO9iSk+ifSM6RfFmpLxGucyfUI+Sq
         2r0xL3g3r6EmdEP+rgzcxAr8spVG/uEMuptoCL/8D1YRyvg2tg5QuFVMjXa9NxEAF6Jc
         ZfcA==
X-Gm-Message-State: AGi0PuYXkVXFTR31Q7wWzAO6OnofLQtx3YkD0ZW+UDM1xcFN2Ry4lx0h
        jhfgeevMpE4Wctt9hnCI3W7Cdw==
X-Google-Smtp-Source: APiQypJAebwircJDFu+JA5JJ5LW0VuZ9H0Q8lJtahQqO+fkp//ZcxyC6MDxBPskPjtY7bZeajZKGHA==
X-Received: by 2002:adf:bb0d:: with SMTP id r13mr2861094wrg.251.1588237656263;
        Thu, 30 Apr 2020 02:07:36 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id t20sm10962025wmi.2.2020.04.30.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:07:35 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Christian Lamparter <chunkeey@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH net-next v5 3/3] ARM: dts: qcom: ipq4019: add MDIO node
Date:   Thu, 30 Apr 2020 11:07:07 +0200
Message-Id: <20200430090707.24810-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430090707.24810-1-robert.marko@sartura.hr>
References: <20200430090707.24810-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the necessary MDIO interface node
to the Qualcomm IPQ4019 DTSI.

Built-in QCA8337N switch is managed using it,
and since we have a driver for it lets add it.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v4 to v5:
* Rebase to apply on net-next

Changes from v3 to v4:
* Change compatible to IPQ4019

Changes from v2 to v3:
* Correct commit title

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bfa9ce4c6e69..b9839f86e703 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -576,5 +576,33 @@ wifi1: wifi@a800000 {
 					  "legacy";
 			status = "disabled";
 		};
+
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq4019-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
 	};
 };
-- 
2.26.2

