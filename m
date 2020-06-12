Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54AAC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86F282081A
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIaEotPV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgFLOTL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC79C03E96F;
        Fri, 12 Jun 2020 07:19:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t18so9928647wru.6;
        Fri, 12 Jun 2020 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRc2+qZ2Z+lCDr+4i+dVIgMgCDA8r2cDbCUzOgaTMo0=;
        b=sIaEotPVgM5Lpj72Vt7S+AdSgEEpnw4Hq3Kk4Q+5+BZz99PuXTcXwkfVrsFpLd3UKM
         7mvoMxDQiRDnj+R2plkcvmCDNNYoep+UzxwzZst9u8fLgbtvVnV+dXBEhE8tYvUno24e
         ICW7pwsXUfw2YyxcFGlXMj1LCyYI3RL0z1EvWO0fZ0vYnDMOHOL0ZbOOlfiSCLjnxdgz
         sPyXDQ69ueyiZNOt7gloIofvyRMSdVfBS4G+KhGLCxzpgfHYrq29WRQ8BC/5lvU5cneS
         41xarqJNJwwRYPbEWZx0MUQgJjuzQjqWzEUPvnVJ74SqWhJXwh3q0bYaJMt4Pk5XYJH+
         7kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRc2+qZ2Z+lCDr+4i+dVIgMgCDA8r2cDbCUzOgaTMo0=;
        b=M53jE1zWsB+2ffMzCz3SgjcG/DCEkUMNLvVz75ZQzjeKDnuMSOWsEpobTIjMUE0fvi
         OSFASx8rAYUJBDkqagzEIS6eMM5ywEyW5HsWO786oViZbGZEMh6UYtPw+w/kBKzpfvez
         ugskYzBymWBLGaPmvihpaX9N1+owyBan6QZ6EpAsF9atng1NiOKV+rpDyrx6y/ZAAF3g
         UJQAHpkNdUBX3eI7bTB7ZRG3zDgX2mj92Dghl2BHovwElrCLq0BzlvPkQUYISuMe6Mfs
         EhIbDldIf1hOxj7ZxnRniCSZSRpcOxOwHm/k0sgeXW/vxLltKUogdQXbGCMN0fL7MiBN
         6z8A==
X-Gm-Message-State: AOAM531C6Wz5NKunpViqGjYPup7GxiiDsDYj5LIB4fgSspBTp5Lpip5I
        TrxYE3TZRsqFYa6Pui9d25M=
X-Google-Smtp-Source: ABdhPJyPWNgi/OeG+zYPHemJFmuoP0Zxm345flOkQ3UsRJY7Y7RdebTQ2UGjbsKIUGeAqfLCJmbf+A==
X-Received: by 2002:adf:f389:: with SMTP id m9mr14440659wro.195.1591971548705;
        Fri, 12 Jun 2020 07:19:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l1sm11468039wrb.31.2020.06.12.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/38] dt-bindings: json-schema conversions and cleanups
Date:   Fri, 12 Jun 2020 16:18:25 +0200
Message-Id: <20200612141903.2391044-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Rob,

This set of patches is the result of trying to get all the Tegra DTS
files validated against the YAML bindings. I initially set out to do
this conversion because I wanted to add interconnect properties and
a way of validating them, so this started off as just a conversion
of various bindings and the addition of the interconnects properties
but then spun out of control a bit as I was running into various
issues with the validation.

I do have another set of patches of about 60 patches that fix various
preexisting issues in the device tree files, but after applying these
conversions and fixes as well as the DT updates I can validate all 32
and 64-bit device tree files for Tegra with a "make dtbs_check".

Not all of the device tree bindings have been converted yet, but the
main ones should be covered. I plan on doing a couple more conversions
once these have landed and as I find the time.

I wasn't sure whether I should be sending this as multiple smaller
series or a large set, but ended up deciding on the latter because a lot
of these are very similar, so should be easier to review as a lot. If
you prefer some other format, let me know.

Thierry

Thierry Reding (38):
  dt-bindings: interrupt-controller: arm,gic: Add compatible for
    Tegra186 AGIC
  dt-bindings: memory: nvidia: Mark memory controller as interconnect
    provider
  dt-bindings: memory: Increase number of reg entries on Tegra194
  dt-bindings: firmware: Convert Tegra186 BPMP bindings to json-schema
  dt-bindings: firmware: tegra186-bpmp: Document interconnect paths
  dt-bindings: display: tegra: Document display-hub
  dt-bindings: display: tegra: Convert to json-schema
  dt-bindings: display: tegra: Document interconnect paths
  dt-bindings: gpu: tegra: Convert to json-schema
  dt-bindings: gpu: tegra: Document interconnect paths
  dt-bindings: mmc: tegra: Convert to json-schema
  dt-bindings: mmc: tegra: Document interconnect paths
  dt-bindings: pci: tegra: Convert to json-schema
  dt-bindings: pci: tegra: Document interconnect paths
  dt-bindings: sound: tegra: hda: Convert to json-schema
  dt-bindings: sound: tegra: hda: Document interconnect paths
  dt-bindings: usb: tegra-xusb: Convert to json-schema
  dt-bindings: usb: tegra-xusb: Document interconnect paths
  dt-bindings: net: dwc-qos-ethernet: Convert to json-schema
  dt-bindings: net: dwc-qos-ethernet: Document interconnect paths
  dt-bindings: sound: sgtl5000: Convert to json-schema
  dt-bindings: gpio: tegra186: Use unique include guard
  dt-bindings: gpio: tegra186: Convert to json-schema
  dt-bindings: mfd: max77620: Convert to json-schema
  dt-bindings: gpio: tegra: Convert to json-schema
  dt-bindings: pci: iommu: Convert to json-schema
  dt-bindings: tegra: Add missing compatible strings
  dt-bindings: phy: tegra-xusb: Convert to json-schema
  dt-bindings: tegra: pmc: Increase clock limit for power domains
  dt-bindings: panel: Allow reg property for DSI panels
  dt-bindings: panel: simple: Use unevaluatedProperties
  dt-bindings: leds: Document rfkill* trigger
  dt-bindings: memory-controller: Document Tegra132 EMC
  dt-bindings: memory-controller: Fix "reg" entries on Tegra194
  dt-bindings: memory: Update Tegra210 EMC bindings
  dt-bindings: power: supply: sbs-battery: Document TI BQ20Z45
    compatible
  dt-bindings: pwm: Explicitly include pwm.yaml
  dt-bindings: serial: Document Tegra-specific properties

 .../devicetree/bindings/arm/tegra.yaml        |   46 +-
 .../arm/tegra/nvidia,tegra20-pmc.yaml         |    2 +-
 .../bindings/display/panel/panel-simple.yaml  |    5 +-
 .../display/tegra/nvidia,tegra20-host1x.txt   |  466 ---
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 1458 +++++++++
 .../firmware/nvidia,tegra186-bpmp.txt         |  107 -
 .../firmware/nvidia,tegra186-bpmp.yaml        |  201 ++
 .../bindings/gpio/gpio-max77620.txt           |   25 -
 .../bindings/gpio/nvidia,tegra186-gpio.txt    |  165 -
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  215 ++
 .../bindings/gpio/nvidia,tegra20-gpio.txt     |   40 -
 .../bindings/gpio/nvidia,tegra20-gpio.yaml    |  111 +
 .../devicetree/bindings/gpu/nvidia,gk20a.txt  |   90 -
 .../devicetree/bindings/gpu/nvidia,gk20a.yaml |  204 ++
 .../interrupt-controller/arm,gic.yaml         |    7 +
 .../devicetree/bindings/leds/common.yaml      |   17 +-
 .../nvidia,tegra124-emc.yaml                  |    4 +-
 .../nvidia,tegra186-mc.yaml                   |   70 +-
 .../nvidia,tegra210-emc.yaml                  |   34 +-
 .../devicetree/bindings/mfd/max77620.txt      |  162 -
 .../devicetree/bindings/mfd/max77620.yaml     |  662 ++++
 .../bindings/mmc/nvidia,tegra20-sdhci.txt     |  117 -
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  283 ++
 .../bindings/net/snps,dwc-qos-ethernet.txt    |  168 -
 .../bindings/net/snps,dwc-qos-ethernet.yaml   |  322 ++
 .../bindings/pci/nvidia,tegra20-pcie.txt      |  682 ----
 .../bindings/pci/nvidia,tegra20-pcie.yaml     |  835 +++++
 .../devicetree/bindings/pci/pci-iommu.txt     |  171 -
 .../devicetree/bindings/pci/pci-iommu.yaml    |  168 +
 .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
 .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     |  127 -
 .../power/supply/sbs,sbs-battery.yaml         |    6 +-
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |   51 +-
 .../bindings/pwm/google,cros-ec-pwm.yaml      |    4 +-
 .../devicetree/bindings/pwm/iqs620a-pwm.yaml  |    4 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |    1 -
 .../devicetree/bindings/pwm/pwm.yaml          |    2 +
 .../bindings/pwm/renesas,pwm-rcar.yaml        |    4 +-
 .../bindings/pwm/renesas,tpu-pwm.yaml         |    4 +-
 .../bindings/regulator/regulator-max77620.txt |  222 --
 .../devicetree/bindings/serial/8250.yaml      |   26 +
 .../bindings/sound/nvidia,tegra30-hda.txt     |   35 -
 .../bindings/sound/nvidia,tegra30-hda.yaml    |  141 +
 .../devicetree/bindings/sound/sgtl5000.txt    |   60 -
 .../devicetree/bindings/sound/sgtl5000.yaml   |  103 +
 .../bindings/thermal/max77620_thermal.txt     |   70 -
 .../devicetree/bindings/trivial-devices.yaml  |    2 -
 .../bindings/usb/nvidia,tegra124-xusb.txt     |  132 -
 .../bindings/usb/nvidia,tegra124-xusb.yaml    |  371 +++
 include/dt-bindings/gpio/tegra186-gpio.h      |    4 +-
 51 files changed, 8103 insertions(+), 3681 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/max77620.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
 create mode 100644 Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
 create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.txt
 create mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml

-- 
2.24.1

