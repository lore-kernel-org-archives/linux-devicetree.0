Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AD8FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 09:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C8B721D7B
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 09:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXIzhvrb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbfKHJzt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 04:55:49 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:39939 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730069AbfKHJzt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 04:55:49 -0500
Received: by mail-il1-f194.google.com with SMTP id d83so4606363ilk.7
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 01:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=spYWTHjb7/MYzsI9bYPcwS26fEghILksNMY9w8ImjM0=;
        b=ZXIzhvrbd4xxyWux72pPsvlPW99KePyYAt/Ja3nYluiduO6c00vIX+TC0Hp44xFrFf
         gOsQXi3l6l2Ok3XLfAtQopP3BCRIyDFf/tiJLz8G5Qi9hRXrPW7Q1KipED8u0TFo/YFT
         6NcNpaRUi/NWOsLPT+U6r9d/QWrdh+i8ABP33IeTi1UuxB+2JJNIV97wZauPsBGAYSw9
         DcrGud7Lk+STyaH/zkeCIEpzEmoier69vvVaRkpdG5CLs3sPcjZJbDh6dwWDm+KEdJEf
         2KZWnkhgIcoBXlWVkCdHA0d6uWAfurQma5kglDFOlhDHyIa/MMZoqsHOJeEIeDRfF6oY
         iSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=spYWTHjb7/MYzsI9bYPcwS26fEghILksNMY9w8ImjM0=;
        b=JLKe4Cl5u2ZOpoIkC+wtl0RNzklVpcIbTFm9U77lruyaeOoIJ+J73Uy1dYsb/nOZJ4
         EM4OfBW1A1RJAdJ6A7X6jT3R1Db9z4MFt8gctm/6raVL4vS8de7lOrYblqkRn831TQ1e
         3CimRZp1XbL0y/sBbmOgtFwJZDRZyEt1uZhoS+4o2109UU/kYevxLTW+E/BdrRj0Z7wV
         BKZJCVNKF09kF7+z6+S+jXFuanYBhLHsLVQ2djVzYyP1Thqk8MzhVTtsxCvKvlE4zBVd
         qPeL44y5bCRIFIGseNUrP3aQkv9x4hTUnDks3hcLEdFpgQs2MEAD0ML4fWAvsgrVhsUD
         SmUQ==
X-Gm-Message-State: APjAAAVSlRJovzjUZ6Q1QxMPf38XVznuVWAkiQwSUTqu7wu2z962Girr
        bcgColIwNPjO8DwxRAnP4cJJ/ongO10mBw==
X-Google-Smtp-Source: APXvYqxARYtwBC201uyHdNNTlDXaPFI6/906RtwY8BQdnP0JJkgmWvxjTofTB7u4fR8W6vOkU5NcSg==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr12471267pjg.87.1573206948601;
        Fri, 08 Nov 2019 01:55:48 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id v14sm5019009pfe.94.2019.11.08.01.55.44
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Nov 2019 01:55:47 -0800 (PST)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     rui.zhang@intel.com, edubezval@gmail.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org,
        baolin.wang7@gmail.com, freeman.liu@unisoc.com,
        zhang.lyra@gmail.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: thermal: sprd: Add the Spreadtrum thermal documentation
Date:   Fri,  8 Nov 2019 17:54:30 +0800
Message-Id: <0a6b113010ad772a633b9cfeeb280dc41f17b951.1573206815.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Freeman Liu <freeman.liu@unisoc.com>

Add the Spreadtrum thermal documentation.

Signed-off-by: Freeman Liu <freeman.liu@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 .../devicetree/bindings/thermal/sprd-thermal.txt   |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sprd-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.txt b/Documentation/devicetree/bindings/thermal/sprd-thermal.txt
new file mode 100644
index 0000000..a9da7f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.txt
@@ -0,0 +1,41 @@
+* Spreadtrum thermal sensor controller bindings
+
+Required properties:
+- compatible : Should be "sprd,ums512-thermal"
+- reg: Address range of the thermal registers
+- clock-names: "enable" for thermal module enable clock.
+- clocks: Should contain a clock specifier for each entry in clock-names.
+- nvmem-cells: A phandle to the calibration data provided by a nvmem device.
+- nvmem-cell-names: Should be "thm_sign_cal" and "thm_ratio_cal".
+- #thermal-sensor-cells: Should be 1. See ./thermal.txt for a description.
+
+Child nodes properties:
+- reg: Specify the sensor id.
+- nvmem-cells: A phandle to the calibration data provided by a nvmem device.
+- nvmem-cell-names: Should be "sen_delta_cal".
+
+Example:
+
+	ap_thm0: thermal@32200000 {
+		compatible = "sprd,ums512-thermal";
+		reg = <0 0x32200000 0 0x10000>;
+		clock-names = "enable";
+		clocks = <&aonapb_gate CLK_THM0_EB>;
+		#thermal-sensor-cells = <1>;
+		nvmem-cells = <&thm0_sign>, <&thm0_ratio>;
+		nvmem-cell-names = "thm_sign_cal", "thm_ratio_cal";
+
+		prometheus0-sensor@0{
+			reg = <0>;
+			nvmem-cells = <&thm0_sen0>;
+			nvmem-cell-names = "sen_delta_cal";
+		};
+
+		ank1-sensor@1{
+			reg = <1>;
+			nvmem-cells = <&thm0_sen1>;
+			nvmem-cell-names = "sen_delta_cal";
+		};
+
+		......
+	};
-- 
1.7.9.5

