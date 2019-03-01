Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34210 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387914AbfCAPwv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:51 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2] tegra2/tegra3 automotive clock init
Date: Fri,  1 Mar 2019 15:35:34 +0000
Message-Id: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
List-ID: <devicetree@vger.kernel.org>

This is a re-implementation of adding clock initialization for
tegra2 and tegra3 automotive devices accroding to Dmitry Osipenko's
feedback on version 1[0].

We have moved the initialization from the clock driver to device
tree, but instead of putting them into a dtsi file, we used
dt overlay to patch the device tree at runtime, we believe the
ability to dynamically detect the chipset and apply the right
settings should be useful according to the discussion[1].

Changes against v1:
  - use device tree overlay to introduce the automative clock configs
  - enable dt overlay for tegra20/30
  - move the condition "soc_is_tegra_auto" to be after applied
    clock init table.

[0] https://www.spinics.net/lists/linux-tegra/msg38347.html
[1] https://www.spinics.net/lists/arm-kernel/msg665373.html
