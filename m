Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2969EC35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 18:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F32D82082E
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 18:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KArXZabh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgBCSdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 13:33:21 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39223 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbgBCScR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 13:32:17 -0500
Received: by mail-pj1-f66.google.com with SMTP id e9so124711pjr.4
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 10:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnHettLd109wANxmdLuXyjYbhCkrWo2MBVjX008Rwpo=;
        b=KArXZabhSftb0nm4KAEC8Kh1eRvQA9bTbTyctAjK4VDpavX5woENwIipPOLRK7mNTO
         FYyPfsFYmEThLjIMpcQkGmKCgkjXAY7tSdFE/YOz7ZCV6BJWt5DWPurXYVPhTRckrZFo
         kBkNttwnUMA05tTj+bQqGlZvOA380ZD3Oo5Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnHettLd109wANxmdLuXyjYbhCkrWo2MBVjX008Rwpo=;
        b=PfuvH+OJMlakOfD+m9xWr8Of+hKdEsuzK0afUe376IlyHaiWPfthX2pq9r+q1aPDu5
         m0+ITOnTQZLDozAuwJPbfPoh7iQhye8iJn0OzSrhcwRTmm1dmPLogjQwvWSTyTQX224z
         RR8G83FevL5tulc2jsJzzX5TLBP1uhmfXsrM1x2SRXZ4M6j4TAsK0nvQ00m8AOlw3JNv
         zvoZIXwxXchWmEjK76qPQD77fNa+auFFh04RXQ9alvUeS+WzHaZ64x10IWzPcI8Qvu9l
         bAjGg0MupE5DbRvvYfJ7PvmFwOgXuT6i3s6krKt2FgO91wtbcWVoQlONfiKny/j0GMez
         SbqQ==
X-Gm-Message-State: APjAAAWnUYlgEZPlwVg4qQ0PfTwq+VQdw/TWfW+ppz3d7tL285go8sES
        wJ4/8CX/Tu/GuCXTvgvYsdpJkg==
X-Google-Smtp-Source: APXvYqzupddr0m+0FM3AlZBJi/XgpMRn2ETFD6Sx9S1ysEUvEJeqNWIF5FlGp7vm535awanJb+BeJg==
X-Received: by 2002:a17:90a:35e6:: with SMTP id r93mr448876pjb.44.1580754736620;
        Mon, 03 Feb 2020 10:32:16 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:16 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 03/15] arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
Date:   Mon,  3 Feb 2020 10:31:36 -0800
Message-Id: <20200203103049.v4.3.Ie80fa74e1774f4317d80d70d30ef4b78f16cc8df@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We're transitioning over to requiring the Qualcomm Display Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTES:
- Until the Linux driver for sdm845's dispcc is updated, these clocks
  will not actually be used in Linux.  It will continue to use global
  clock names to match things up.
- Although the clocks from the DP PHY are required, the DP PHY isn't
  represented in the dts yet.  Apparently the magic for this is just
  to use <0>.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Newly discovered gcc_disp_gpll0_div_clk_src added.
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..0985813fee50 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2933,6 +2933,24 @@ opp-200000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_link_clk_divsel_ten",
+				      "dp_vco_divided_clk_src_mux";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

