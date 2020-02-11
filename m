Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E73C352A4
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D14320870
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x8yLEeAJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgBKAwQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 19:52:16 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34966 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbgBKAwP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 19:52:15 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so3536052plt.2
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=usB5IoDyLwWY36+AuSkvkbrGcg49AWldfTwBCrrtmpU=;
        b=x8yLEeAJm5pg44gCh19Xinxc52LnzVmwZBRkJFm2t+blF3Kx8ux8OLeeQTKtqyZJh7
         v43NbY/nF8f4JoFBX+I+mlu8+VJnZem3CbyjRUNAJpJecBPJXslIhd5FHYtVk5Hmkt2J
         e01TAgFVetot9Jeq4x2df5WUV5Jv4S8cBsHbPCKxrio8pvWw1vFrD6DLB2Mwk57nmry1
         AaMId8w0OC3YuuzcHw5wo4C0BCABvmzadCE98WJ4GoVysMT+pRKhL1slWvJzduJpnrVL
         82tyDGYgnXlUv7I5Jsorp7bwjFlD58W8D8tcrpiQ+7/t3/G7V+fIH9IN2UNgUCRQxmdB
         5FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=usB5IoDyLwWY36+AuSkvkbrGcg49AWldfTwBCrrtmpU=;
        b=cYEkxS8VOyozt0Jq7oIRwi49gfqmyttGGfG0FW8U5DLAQt8nff9T0U55LKW5JBB94O
         0TlMqHZjMZ9Ur9ySb21Hx8eV92M2oXoqU1gpsDmW+INpvBggHypTGwkKs9KslhLagOPq
         MjaxhcgGhKmMsINg/FJs85pthjK/WQHr/LXPpL5T3CrGIQsWCKUQRp2znJStmXp4tNkg
         zq5bQHigDN4BiPV9vN+dXEBUyOyAAguz9uwqyP4xDcfDp9exddqecjq7Vew4snCDIMS2
         OZTkOPoqCZZKlWNrQgzyW2SR9RGbpUaWTgc0M/QdG8TQpkmFJNprDE+EQZUAS3mWMBgg
         yS6w==
X-Gm-Message-State: APjAAAV150af+FsowhKxmfalWSVGWGj88YEz6YZLio8E3gvjEHbqZy9+
        Hkd85Hyzi45vgRigXwWwNWKwww==
X-Google-Smtp-Source: APXvYqzBLJhl4yfx6CRhp1php6TZrHLUEmZeDDuor9FiyoO4g8yRWY7V1J8l3ohfRc3nP4NIgJzOWQ==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr669765pjq.130.1581382334401;
        Mon, 10 Feb 2020 16:52:14 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:13 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
Date:   Mon, 10 Feb 2020 16:50:55 -0800
Message-Id: <20200211005059.1377279-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a simple-mfd representing IMEM on QCS404 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replace offset with reg

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4ee1e3d5f123..f539293b875c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
 			status = "disabled";
 		};
 
+		imem@8600000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible ="qcom,pil-reloc-info";
+				reg = <0x94c 200>;
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.24.0

