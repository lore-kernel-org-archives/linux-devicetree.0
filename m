Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ABEC433E2
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1733A2074B
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 19:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="h2MjRBk4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgFETF4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 15:05:56 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:35317 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgFETF4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 15:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383954;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W4bCg1lG4HoFwBxz9czdfoDXzBcdOM4JgKX/4m0N6s0=;
        b=h2MjRBk4NJPOygjGjhRJGK9JTyEpbQJWOQryW93I5BArfbcS5Zzk6S/q4ZFUoFm8Z7
        u+2/tH+SY7/GCM1iXXx4DIlsutyxMsnaQfJDn8+1QUbnvh820B6FXo5qa0UNU8Sw3bgD
        vchzrp41AUbUqmtYAqDc3vEA4t+jCLTUfoeUGffWxso+CK5tb3epq0nZ4lYLHAEYMDpn
        SHP355VMBrat6uAdOgjebcnd1YLM4S5TKZomczxOjMsxv/dzfVs0nd1v4CdWten4q4qc
        skWcoXv+ktm1o8wZFADUiUbzULALRW8mAkwjhdDyoPZlFgYrn5CWantHu5CFSCaIf2Xm
        U5pA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxsKmH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:54 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/4] arm64: dts: qcom: apq8016-sbc: Replace spaces with tabs
Date:   Fri,  5 Jun 2020 20:59:16 +0200
Message-Id: <20200605185916.318494-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185916.318494-1-stephan@gerhold.net>
References: <20200605185916.318494-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

apq8016-sbc.dtsi uses spaces on some lines instead of tabs.
Make this consistent by converting them to tabs.

Also remove some redundant comments from the DAI link definitions
- this is already visible from the comment block before the "sound"
node or the device node entries itself.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 75 ++++++++++++-----------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8a4b790aa7ff..364014c96632 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -453,22 +453,23 @@ capture - Quat MI2S
 
 		*/
 
-                sound: sound {
-                        compatible = "qcom,apq8016-sbc-sndcard";
-                        reg = <0x07702000 0x4>, <0x07702004 0x4>;
-                        reg-names = "mic-iomux", "spkr-iomux";
-
-                        status = "okay";
-                        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
-                        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
-                        pinctrl-names = "default", "sleep";
-                        qcom,model = "DB410c";
-                        qcom,audio-routing =
-                                "AMIC2", "MIC BIAS Internal2",
-                                "AMIC3", "MIC BIAS External1";
+		sound: sound {
+			compatible = "qcom,apq8016-sbc-sndcard";
+			reg = <0x07702000 0x4>, <0x07702004 0x4>;
+			reg-names = "mic-iomux", "spkr-iomux";
+
+			status = "okay";
+			pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+			pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+			pinctrl-names = "default", "sleep";
+			qcom,model = "DB410c";
+			qcom,audio-routing =
+				"AMIC2", "MIC BIAS Internal2",
+				"AMIC3", "MIC BIAS External1";
+
 			external-dai-link@0 {
 				link-name = "ADV7533";
-				cpu { /* QUAT */
+				cpu {
 					sound-dai = <&lpass MI2S_QUATERNARY>;
 				};
 				codec {
@@ -476,26 +477,26 @@ codec {
 				};
 			};
 
-                        internal-codec-playback-dai-link@0 {            /* I2S - Internal codec */
-                                link-name = "WCD";
-                                cpu { /* PRIMARY */
-                                        sound-dai = <&lpass MI2S_PRIMARY>;
-                                };
-                                codec {
-                                        sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-                                };
-                        };
-
-                        internal-codec-capture-dai-link@0 {             /* I2S - Internal codec */
-                                link-name = "WCD-Capture";
-                                cpu { /* PRIMARY */
-                                        sound-dai = <&lpass MI2S_TERTIARY>;
-                                };
-                                codec {
-                                        sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
-                                };
-                        };
-                };
+			internal-codec-playback-dai-link@0 {
+				link-name = "WCD";
+				cpu {
+					sound-dai = <&lpass MI2S_PRIMARY>;
+				};
+				codec {
+					sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+				};
+			};
+
+			internal-codec-capture-dai-link@0 {
+				link-name = "WCD-Capture";
+				cpu {
+					sound-dai = <&lpass MI2S_TERTIARY>;
+				};
+				codec {
+					sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+				};
+			};
+		};
 
 		spmi@200f000 {
 			pm8916@0 {
@@ -650,9 +651,9 @@ resin {
 };
 
 &wcd_codec {
-        status = "okay";
-        clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-        clock-names = "mclk";
+	status = "okay";
+	clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
+	clock-names = "mclk";
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
-- 
2.26.2

