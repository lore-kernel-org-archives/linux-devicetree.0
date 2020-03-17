Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AD0C10F29
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:57:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE08B20752
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="almf5Jtj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgCQN5w (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 09:57:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42704 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgCQN5w (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 09:57:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id v11so25845780wrm.9
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R7mPWyazQzpq+QB7kvcjm1xqFg1EYXZslw7p+6l9zyk=;
        b=almf5Jtj3eNx0d/aXBR7+Oze2+ETeYjtyMlJ9OEbQmb8gMN8blXwHv2GG8cTMSG8Gb
         TqQI2NvD/8dBdMeEBmIXhIlFHwrbl/hv5ChDDsNGpnlpK5hvQzof8fIixUIUsBguIXTb
         KDN4gxBzEroJNoXlYrX/bRITTsURtbZ+0C1rc3DI0n3W0P0ylmLJ6omYznM5Mry+BHEl
         sXOc3Pq73C98/nsy0iLaajh56wLjwq7AMkYoauh0RYGnVUMCy44eNrnIGcJTSZeVDb/w
         dYQ9baRi0UO2Pr1LUpCM6HKEzgo2MXSbZM7mFSpDv3xrJ2Ax8m4VmF9IwYMZTjiNJSAG
         YvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R7mPWyazQzpq+QB7kvcjm1xqFg1EYXZslw7p+6l9zyk=;
        b=amsC2e/nFPulF6ZaGYXuEEtJUfbzQaZ1AyzHS6Rfqe1TIKGMo8zyRtxGX9vWNH07cn
         5cH8j/2gwUse6qNa00bqLo4IG4h574vm/wxVKZAPm6JpRnk9/iELrOkz4gn6voFWQe6G
         GMwyZxC2vQYvEae347A7TUGtudjY/WQs9YY0XJfK1SHG80r+bv1K6xSwaJPB8qpyvg2G
         zHgOfkHQhGwSjC5S44kOHplPjiJrkZJ/afpHAn9Co6EoqaI3NhOn/WUMrB1Rb66I5sF+
         yll9T4EcRrsFQut/k456s7ci8PHYcDXWG1BscLHHS8jN56Qcx23Vldzk0k8k76UO3IJ0
         mg9g==
X-Gm-Message-State: ANhLgQ2TqQrQt1G5pAdAGXUaFfQHUEsLb526Gj0BP6swc9EQLqogPU7G
        BNVsXXWSpcXJ6gfcishCXkh2pQ==
X-Google-Smtp-Source: ADFU+vtjVlC/k5+6U/ZJ5/Eyy3Wu7I7oB0zbdo6cV/jFpbNjcRBn/Fnh1DNmBZO9Lag7OIncCJrjOw==
X-Received: by 2002:a5d:490e:: with SMTP id x14mr6707580wrq.58.1584453470131;
        Tue, 17 Mar 2020 06:57:50 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:49 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 0/6] Qualcomm CCI & Camera for db410c & db845c
Date:   Tue, 17 Mar 2020 14:57:34 +0100
Message-Id: <20200317135740.19412-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series depends on the Qualcom CCI I2C driver series:
https://patchwork.kernel.org/cover/10569957/

This series enables basic camera functionality on the Qualcomm db410c and
db845c (RB3) platforms.

This includes building drivers as modules, adding devicetree nodes
for camera controllers, clocks, regulators and sensor nodes.

Loic Poulain (2):
  arm64: dts: msm8916: Add i2c-qcom-cci node
  arm64: dts: apq8016-sbc: Add CCI/Sensor nodes

Robert Foss (4):
  arm64: dts: sdm845: Add i2c-qcom-cci node
  arm64: dts: sdm845-db845c: Add pm_8998 gpio names
  arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
  arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  76 ++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  27 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 210 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  92 +++++++++
 arch/arm64/configs/defconfig               |   4 +
 5 files changed, 409 insertions(+)

-- 
2.20.1

