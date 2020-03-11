Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A3AC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDE9C20873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTSFsTwT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgCKMfI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:35:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38146 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbgCKMfI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 08:35:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id n2so1927936wmc.3
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaarF50dxbS3Z8Mh0BzIdcf7YKpiLwN04fKYbKDEJfo=;
        b=mTSFsTwTgQ395aAGTlSYACy3RpEti3lHZ/SdKLzuPJUEhPFwgtcD/0x7JD1LmsEyLz
         vLr8lEFv/uOg5+Hi5xuDDqecCPjxNi02fn6naqQ5/M/q4Q36F88RiOq/ovCCK48Ar+Dc
         0P34UBq5R1Jexx3KgTxx4vBU5PM8e/XP45Dxnf6oz2y0ZKKS2nAfn4tCxyECf+0moQgl
         DBaHI3o9o7jlpRQNCThE0/fSZpqYxbOA8VJE7eSxzaBnqfo+wHr/D/bQrHnsfazug5gC
         5j4YTLOoliD+IuU/K2E8FRl51ekJyN3da0utLjH0xJ/aWYgNoW9EyzQas3GGEipaYAQm
         Vosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaarF50dxbS3Z8Mh0BzIdcf7YKpiLwN04fKYbKDEJfo=;
        b=ZFX+JTjtAWm8NU8NBzUd4IVnFFYMWF3mdr9+yeZ/XLIKFGnA6ClTRDzCGImVvwwoB4
         nvyy+dr2ER6bcilwcdWz6hpycttQJ5gUp7sl2yvGjBlJsGB+HkeIEJxLR9BufAfgjgIf
         LJX2KgeiK3VrOsmsb4pArlF7wn8CCpWeICBiGwiuIjiZbcrYXA0aJUuEnJbCb0FAGCgz
         wHJR/iukd0kIRTdzhL1UB/q0zIJuR8muhSRvGuYyXhMmtCzEKs+P3KIPl6i3pMwTSFDw
         AKpdK4hPpA4r6rU9meoj72g7lroGEg95+3ltC3nqijUqHoxUxnF7omBEwdczqBKkthJm
         uhjQ==
X-Gm-Message-State: ANhLgQ0qfEGbEwx3L8kHhWlamaa6yd4QEUBVOcrmk4uIh/AqyIIuUK+W
        kN26Tm3ImBbbkaYaf48yJuyALw==
X-Google-Smtp-Source: ADFU+vtijpANu3z4d1JWR353H0zygtSe8oto36au5GoaVFlUBSvVn7Jemj9lTKV4zXVdPkwgCr0WiQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr3676317wmk.172.1583930105627;
        Wed, 11 Mar 2020 05:35:05 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:04 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 0/6] Qualcomm CCI & Camera for db410c & db845c
Date:   Wed, 11 Mar 2020 13:34:55 +0100
Message-Id: <20200311123501.18202-1-robert.foss@linaro.org>
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

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  75 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  27 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 273 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 110 +++++++++
 arch/arm64/configs/defconfig               |   4 +
 5 files changed, 489 insertions(+)

-- 
2.20.1

