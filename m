Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972E1CA9EC3
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 11:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 621B821721
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 11:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgqZKdfC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731789AbfJ2L2x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 07:28:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38011 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbfJ2L2x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 07:28:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so13221389wrq.5
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
        b=hgqZKdfCfJnFj64xw3rXV3VPEK6d30/74W69Yz65m7g+kcAqJDHvB87K3T3uaOzxdG
         gDZMXPaHvF023TiCfdStdHxb59TDTlRirgQZCPVLF7e4Sq24i/aoB6trORieuPmale8m
         4H5agAOoNs10bZaFM+1LWvTScfQOQdVGEeHSKlbz1XFHUB42UXM10+8WtH1MCpJ4zajW
         z14D1/7i8aPEvwd8jvt6XlVu9U14gCyk/J8s0iS6GmyyTFJX96AQ5reclNp10Ie3hrsb
         g6sje56OCtVCgIX1MfM/wLcb/p9eZincHg4Nxes1s2mDThkK8LhqjuM2aoG+QAuaS/C3
         CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
        b=U8G/at0g19oEke1XnamcGNE7l0o5jiGaHKO913C1kVyMXDzpLlu8ZJkTrpXPvpPYSQ
         hMyoKjqlLbTMBPmR/1syybqBXJ1FhLW5pA2LSnBlLD3BlXVIP8BZ2/LAdxw+ELjQa6Ry
         XOSE7Q2oWVQiZRPyaqfHVnlK7JXaQKdEhFiLaPRG9A7mwDlSNJDHHNBccmhHNepHqdTr
         H/KlyGapgANpbir/hvCNDQtbi5P71+tl1qIN3ZUAuFNs9mWApr/ewcb/DXLMYWjxoj8l
         W1Kfh1RbzEVyEqwoe2OqylT1koQcwf2C9nvLEz5hsSnAQgOmJy4q6EvAUWq2FxcZeVJw
         Vj7Q==
X-Gm-Message-State: APjAAAUo7Gr+UkJvXi/IamLbCJyVCO3EdrsVNAh9vAYSfUTem5wZItwz
        //Zn8e6IFc7L8JmpqNs5KjGKbw==
X-Google-Smtp-Source: APXvYqxX7UvGklw4BukJiiU81RExjsPkGX9S1gah8yPCTcdMvKCN/bvu59A8jbhXzGu0JHLxw6LDnQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr18810399wrn.295.1572348530671;
        Tue, 29 Oct 2019 04:28:50 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:28:49 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 00/11] ASoC: Add support to WCD9340/WCD9341 codec
Date:   Tue, 29 Oct 2019 11:26:49 +0000
Message-Id: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support to Qualcomm WCD9340/WCD9341 Codec which
is a standalone Hi-Fi audio codec IC.
This codec supports both I2S/I2C and SLIMbus audio interfaces.
On slimbus interface it supports two data lanes; 16 Tx ports
and 8 Rx ports. It has Five DACs and seven dedicated interpolators,
Multibutton headset control (MBHC), Active noise cancellation,
Sidetone paths, MAD (mic activity detection) and codec processing engine.
It supports Class-H differential earpiece out and stereo single
ended headphones out.

This codec also has integrated SoundWire controller.
Patchset for this is already sent for review at
https://patchwork.kernel.org/cover/11185769/
    
This patchset has been tested on SDM845 based DragonBoard DB845c and
Lenovo Yoga C630 laptop with WSA881x smart speaker amplifiers via
soundwire and 4 DMICs.

Pin Controller patch does not have any link dependency, it can go by its own.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

If anyone is interested to try, here are working set of patches on top of rc3.
https://git.linaro.org/people/srinivas.kandagatla/linux.git/log/?h=audio/v5.4-rc5-YOGA-C630
alsa ucm files:
https://git.linaro.org/people/srinivas.kandagatla/alsa-lib.git/log/?h=DB845c

Thanks,
srini

Changes since v2:
- Updated mfd driver as suggested by Lee.
- Updated bindings as suggested by Rob.
- Addressed various comments by Cezary Rojewski
- Cleaned up code a bit.

Srinivas Kandagatla (10):
  ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
  mfd: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add basic controls
  ASoC: wcd934x: add playback dapm widgets
  ASoC: wcd934x: add capture dapm widgets
  ASoC: wcd934x: add audio routings
  dt-bindings: pinctrl: qcom-wcd934x: Add bindings for gpio
  ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
  ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga

Yeleswarapu Nagaradhesh (1):
  pinctrl: qcom-wcd934x: Add support to wcd934x pinctrl driver.

 .../pinctrl/qcom,wcd934x-pinctrl.yaml         |   52 +
 .../devicetree/bindings/sound/qcom,sdm845.txt |    5 +-
 .../bindings/sound/qcom,wcd934x.yaml          |  162 +
 drivers/mfd/Kconfig                           |   12 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/wcd934x.c                         |  306 +
 drivers/pinctrl/qcom/Kconfig                  |    7 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c   |  365 ++
 include/linux/mfd/wcd934x/registers.h         |  529 ++
 include/linux/mfd/wcd934x/wcd934x.h           |   31 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5084 +++++++++++++++++
 sound/soc/qcom/sdm845.c                       |   86 +-
 15 files changed, 6651 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 drivers/mfd/wcd934x.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
 create mode 100644 include/linux/mfd/wcd934x/registers.h
 create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
 create mode 100644 sound/soc/codecs/wcd934x.c

-- 
2.21.0

