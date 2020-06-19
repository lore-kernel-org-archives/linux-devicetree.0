Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E992C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 19:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E6992158C
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 19:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/BjF00/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389252AbgFSTif (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 15:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389188AbgFSTif (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 15:38:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74E2C0613EE
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 12:38:34 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gl26so11342201ejb.11
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpwwnZrnzSnEb6bDojOEsD8rwL4chvZZSUmpcx7QESw=;
        b=T/BjF00/RfXCtXbTEbblGcsobBcy62kNibhE+cavYfetTcgA5YdXgur/ga8X5zQghb
         hsd4iiX0KBUkF5pIsqDGpUkLmzrL9q00L6jJZpziMbidEpUtQDMJwx2/vMRowF5KuoZm
         Zxby3Gqk+RCyAtudVPW/ioX1Hj55tXL1bpih1m9iV4esPl0OFS052IsMjUIm9pqGcA4p
         coAcvO4vkujWqnXV5KXU42eCp9VglBqur0cKBSpmkJZqCzkp/xFH9iZ3+otuNj0Maz8a
         GIQxTmx+QagHUb6fABybYI3UR58wQTg6xV6xEUbyBHbqrROer6jQQKuq2TXCoRt4tbsj
         kddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpwwnZrnzSnEb6bDojOEsD8rwL4chvZZSUmpcx7QESw=;
        b=fkLMr+RgjDBep15NSUlzmeJMUWF/UpZEQHpdHpycz8/j3LlNG20AOzJU5wDZUx1Swi
         qN/g28GDGQ++NECfV49oDqakCb513wzsF9ebjKLyMpyU39l8UVHIqGe+0Kajxupf5HuP
         vg7KBPvMIIMRx5spP7oezzdyl+VPVOdpDvAIrahjey5d6DbBBPQufHNh1/Mb0xjDR9VN
         Ae7FI7g28UxzfjRjO8/Gvb1Lap8WljN/3JOrO6OGvuXC0GwUt+JGuTWU0ANigi2rTta9
         kKVs/Cid5DJw51pRqwt7rAXdapHuAgwpu01JJIe/vKkK+Txw+x+FuuiMyK2no9eyQRTU
         GRjQ==
X-Gm-Message-State: AOAM5316APCG/UABkhLqWAd+nIZy8erCCtKaVhJlb7XvFoOl3KprkP2r
        B7DZhzOIf2QLs/+X2IQHWjMFSg==
X-Google-Smtp-Source: ABdhPJxuJXgPP5jW3b107fI8sRQCwDQUpcmePVvJrmhw9aFDTDubdtWZDNme31ly8sscFs/ISEmkrA==
X-Received: by 2002:a17:907:b05:: with SMTP id h5mr4547315ejl.499.1592595513560;
        Fri, 19 Jun 2020 12:38:33 -0700 (PDT)
Received: from localhost.localdomain (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id dn17sm5310125edb.26.2020.06.19.12.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 12:38:33 -0700 (PDT)
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
To:     alsa-devel@alsa-project.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matt Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] ASoC: qcom: add apq8039 sound card and bindings
Date:   Fri, 19 Jun 2020 22:38:29 +0300
Message-Id: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the apq8039 sound card along with device tree
bindings for it.

A notable feature of this patchset is the capability to aggregate
arbitrary ALSA controls sequences into functions that are exposed
via a single enum ALSA control.

Detailed information for this mechanism is presented in the DT binding
document.

Pantelis Antoniou (2):
  dt-bindings: sound: Device tree bindings for the apq8039 sound complex
  ASoC: qcom: add apq8039 sound card support

 .../bindings/sound/qcom,apq8039.yaml          |  370 ++++++
 sound/soc/qcom/Kconfig                        |    9 +
 sound/soc/qcom/Makefile                       |    2 +
 sound/soc/qcom/apq8039.c                      | 1126 +++++++++++++++++
 4 files changed, 1507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
 create mode 100644 sound/soc/qcom/apq8039.c

-- 
2.20.1

