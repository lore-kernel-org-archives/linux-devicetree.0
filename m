Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE44C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 588B720665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPQcMRG5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLVLj0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:26 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53619 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfLVLj0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:26 -0500
Received: by mail-wm1-f65.google.com with SMTP id m24so13173388wmc.3;
        Sun, 22 Dec 2019 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGDiB5QdWMyYZ86YVXZSGDQSEd273un0Guw/pubzTaw=;
        b=UPQcMRG5QIcbCZkg0ZEu+A9wTRgedH8I0q5LXL4N6df0WgJOvWYyiSGKhlNyn4AS78
         jPC0LnI4SWmSNjiN+5ttA6osmcwmPo0OGeXaRy9vUB9X2PbJbOQf9/VHGN/uvSBMnksQ
         bWGwI/P26Zts2DgVHfIw4JuUpxPSLgX1vZeyXqy3SXs8P0ubO+a+lrV/EpfSohdFs1ha
         MkRpl3HJVb1dEOWkRuDx6KunKWTCaxSH1+WfwVeztdaLQ9t3sK7mx+GMVqExOaO18lA5
         wHcyzqgugezovJiUkgaOleL0zN6tEGjlcrYnhokXXddvBqhgZB0NzAFmwCBKxB6+vkog
         61fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VGDiB5QdWMyYZ86YVXZSGDQSEd273un0Guw/pubzTaw=;
        b=oTVdsnGsevKmoPp8qBH6ln9UUm8G1NgpwM4zqvE0FB/uZGgLaLFqASGlKjy2r0xl14
         C1lBMrbMU7tMz4RNv1pQ7x0DUWjupGdsMwi57VhSzGh82z+ID3B5ecR780TE2Tqwyzjm
         Gf4UqZuKawBZ82j2iMZ48wJ9ODBTrm0Yqrmo7AZNB3wW/6jt2AyZtMsWMZbTklo9oxWM
         bd9o3Uctmu6V1qTJiSzrOchkH6vmQDXK7VWIyCU1YUB4gwLZ2cd+I2IHmMiVCb/XFv/d
         hYOhQlvxWJdvyCCE1F3VhJtsa3pUUHt0ow9PpVPLog40dXTbCFLGy9d1VE6Gp4HVDWnc
         6Oig==
X-Gm-Message-State: APjAAAVvRTeBfHPkERYdxlrYBpi3lFRv4XcvaLrkYGaaCBPVrAYh+Gxg
        WElkEK0j0QabWOwstYTGNcM=
X-Google-Smtp-Source: APXvYqxOW39MiQtHhEXlKKCiKjnRposvvY0Fnox5AGwbFCiLUb/TK5GsAIyo03pics4m3RfiSVUS7Q==
X-Received: by 2002:a05:600c:294:: with SMTP id 20mr25992658wmk.97.1577014764157;
        Sun, 22 Dec 2019 03:39:24 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id k8sm16724969wrl.3.2019.12.22.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/6] memory: tegra: Miscellaneous Tegra124 improvements
Date:   Sun, 22 Dec 2019 12:39:15 +0100
Message-Id: <20191222113921.1469372-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of changes improves the EMC bindings on Tegra124 and Tegra132.
The goal is to bring them up to par with the bindings on Tegra20 and
Tegra30 and future bindings that will be introduced for Tegra210 and
later.

Note that there's a tiny bit of ABI break here in that new device trees
will cause existing debugfs support from working. Since the EMC driver
doesn't do anything other than provide a backend for the debugfs
interface, I think that's something that we can live with.

A new debugfs interface is introduced in this series and it replaces the
existing one, which turns out to be too limited looking forward to plans
to make the EMC act as an interconnect provider.

Thierry

Thierry Reding (6):
  dt-bindings: memory-controller: Convert Tegra124 EMC to json-schema
  memory: tegra: Refashion EMC debugfs interface on Tegra124
  ARM: tegra: Let the EMC hardware use the EMC clock
  arm64: tegra: Let the EMC hardware use the EMC clock
  ARM: tegra: Rename EMC on Tegra124
  arm64: tegra: Rename EMC on Tegra132

 .../nvidia,tegra124-emc.txt                   | 374 -------------
 .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   2 +-
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   2 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |   2 +-
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |   2 +-
 arch/arm/boot/dts/tegra124.dtsi               |   4 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |   4 +-
 drivers/memory/tegra/tegra124-emc.c           | 185 ++++--
 9 files changed, 681 insertions(+), 422 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml

-- 
2.24.1

