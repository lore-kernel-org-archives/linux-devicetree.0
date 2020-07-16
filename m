Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801F9C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 537A420787
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=snejp.pl header.i=@snejp.pl header.b="Zbz3DUNT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgGPV3x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 17:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGPV3v (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 17:29:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885F1C08C5CE
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 14:29:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x9so10006363ljc.5
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSgxBMa/LciITm4xNGQOGJtl7ToeFI5VUQq2fMU9kUQ=;
        b=Zbz3DUNTVx11rl3Ngndz8qWW88ScyQKsu4g0teQujRj+i98pjRKuVKYnCW/epc7n5B
         I6wbujCpX75TTtgGwRqGCy9GuR6bWHtM1mKJwuABaWS9ywnSVCWW+ribuQppt7eSH1fR
         wlqea1KflCfEriSbPlJaKWUA3YCXDhBOVvc+mjYC1LlqchzUGgunlKlzCrpUHHbQUjpG
         9CsqSWeHeZ8padjnQUAxssUX8nRZzKAJkOQQuB+kuoY96tb5J6rPPYrrCkkn1Srn4/EH
         2OKjmy2OqpPkUPNbLIpaLPPCCqB8c+XB5Je8hDktji+BDm8+iwVuvE/9/M1IxzuhaJRk
         kYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSgxBMa/LciITm4xNGQOGJtl7ToeFI5VUQq2fMU9kUQ=;
        b=FXbdFZi2YSoSB/KqNo9kZzHK4bC1A5mZDHcOptYicLwggXlW6Pzgr0JISCInjfgyTU
         wnjBOKB9sk271hG+3wPVsVugg0v57Dj2axAXKqq6EeGb0IgPesQ+2cdBjeYXigSEWIiP
         PByhVW+xo5TOFj/oEIdYSkwDfYxxPcPPoJzZwkzF+uHgttSnW78A/h2tp0GVqNCfLWAU
         hIEgTfT/IvnsuZWm9O+pdCDYmQ/F8FGwJ9XPa1gb9OXEO+HQNhUACsXw0ZsRgSKc5nXR
         5JDpR3jUUP0qSUbj5QEVqoYBwPJ/tATRrE2+/M2FbLQLF74X2cSM80Bb7hiU8ZCy52Uz
         46Mg==
X-Gm-Message-State: AOAM531cfQFew/pWh9Zv22R7hsjeTp/iD+ptxJm4t6js26N5+HTpzNhp
        IHr9M8wfPxUq8VsEV8elUsACWw==
X-Google-Smtp-Source: ABdhPJyZvXQ8kQ0bJomu189c2+ewR7hN0lGTxEt+uwwWJdCfMT1d2Lobc/YG1w6zV/sSMoEOa52Mzw==
X-Received: by 2002:a2e:8216:: with SMTP id w22mr3132272ljg.2.1594934990067;
        Thu, 16 Jul 2020 14:29:50 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id r11sm1277137ljc.66.2020.07.16.14.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:29:49 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 96f3d442;
        Thu, 16 Jul 2020 21:29:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Qualcomm MSM8226 TLMM binding and driver
Date:   Thu, 16 Jul 2020 22:55:27 +0200
Message-Id: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

Changes in v2:
 - Changed node name pattern to '-pins$' in qcom,msm8226-pinctrl.yaml binding
 - Expanded example in yaml binding with a 'serial-pins' node sample 

Bartosz Dudziak (2):
  dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
  pinctrl: qcom: Add msm8226 pinctrl driver.

 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 132 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c        | 631 ++++++++++++++++++
 4 files changed, 773 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8226.c

-- 
2.25.1

