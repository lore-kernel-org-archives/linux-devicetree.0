Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B3C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E3CE207D3
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="HOJquxRk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgFETGA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 15:06:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:15639 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgFETGA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 15:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383958;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=uG+xyzcgFcPs8d4qfzghhlZ8ma9xNU5sLA5RgBUV1Kk=;
        b=HOJquxRkl2HtaGSHiX79zLza50/q3/XLF4SMobsE0dBhyRvD7kwlqlSWth3Y9N5ckn
        s60ci2uwtyCsZNgA1oGuX8EOpEhvWmFhe0S0Mj/PEeSO7XPqgIaAQCz84jpHg4n9nnwl
        8cvHvIriuV0TYa5zGIxocJBG+sQEM/pkxLNTxglVidjt3uTqJnr0/OxkG/Tk+40YWc45
        kKeK2NgWU2I0NLzn9uv+rDFeJ+JWs3xpW8430DPmauhzEJro+Ns7XBEVqSyCovfxxfgP
        MRkuCRh4duCoCEXThdtEc691YB9ooV79ie9IBnwkbcRvvTqTRjibjqvQ1b0Hh6dMx0nh
        qzoQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxqKmE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] arm64: dts: qcom: msm8916: Set #address-cells for lpass
Date:   Fri,  5 Jun 2020 20:59:13 +0200
Message-Id: <20200605185916.318494-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As of commit 4ff028f6c108 ("ASoC: qcom: lpass-cpu: Make I2S SD lines
configurable"), lpass now supports children nodes to configure the
MI2S SD lines to use for one of the I2S ports. For example:

lpass@7708000 {
	dai@3 {
		reg = <MI2S_QUATERNARY>;
		qcom,playback-sd-lines = <1>;
	};
};

The "reg" property refers to the DAI number in this case,
so we need to set #address-cells and #size-cells appropriately
to avoid DTC warnings.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 32bd140ac9fd..b0f9cfaba1ed 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -700,6 +700,9 @@ lpass: lpass@7708000 {
 			interrupt-names = "lpass-irq-lpaif";
 			reg = <0x07708000 0x10000>;
 			reg-names = "lpass-lpaif";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
                 lpass_codec: codec{
-- 
2.26.2

