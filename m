Return-Path: <SRS0=9JgI=YN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EEDCA9EA9
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 04:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3E942190F
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 04:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfJTEI1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 00:08:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:37096 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbfJTEI1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 20 Oct 2019 00:08:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 73045AC75;
        Sun, 20 Oct 2019 04:08:25 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        info@synology.com, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: Initial RTD1293/RTD1296 and DS418j/DS418 support
Date:   Sun, 20 Oct 2019 06:08:09 +0200
Message-Id: <20191020040817.16882-1-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This series adds Device Trees for the Realtek RTD1293 and RTD1296 SoCs and
Synology DiskStation DS418j and DS418 NAS devices.

v2 was updated to YAML schemas.

More details at:
https://en.opensuse.org/HCL:DS418j
https://en.opensuse.org/HCL:DS418

Latest experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

v1 -> v2:
* Rebased onto Rob's SoC YAML schema conversion
* Moved SPDX-License-Identifier to top
* YAML schema conversions of watchdog and rtc
* Dropped "arm,armv8" (Rob)
* Adopted BSD-2-Clause instead of MIT dual-license (Rob)
* Dropped accidental enable-method and cpu-release-addr
* Fix DS418 to actually use rtd1296.dtsi

Cc: info@synology.com
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>

Andreas Färber (8):
  dt-bindings: watchdog: realtek: Convert RTD119x to schema
  dt-bindings: rtc: realtek: Convert RTD119x to schema
  dt-bindings: arm: realtek: Tidy up conversion to json-schema
  dt-bindings: arm: realtek: Document RTD1293 and Synology DS418j
  arm64: dts: realtek: Change dual-license from MIT to BSD
  arm64: dts: realtek: Add RTD1293 and Synology DS418j
  dt-bindings: arm: realtek: Document RTD1296 and Synology DS418
  arm64: dts: realtek: Add RTD1296 and Synology DS418

 Documentation/devicetree/bindings/arm/realtek.yaml | 27 ++++++---
 .../devicetree/bindings/rtc/realtek,rtd119x.txt    | 16 ------
 .../devicetree/bindings/rtc/realtek,rtd119x.yaml   | 38 +++++++++++++
 .../bindings/watchdog/realtek,rtd119x.txt          | 17 ------
 .../bindings/watchdog/realtek,rtd119x.yaml         | 38 +++++++++++++
 arch/arm64/boot/dts/realtek/Makefile               |  5 ++
 arch/arm64/boot/dts/realtek/rtd1293-ds418j.dts     | 30 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1293.dtsi           | 51 +++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts  |  3 +-
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  3 +-
 arch/arm64/boot/dts/realtek/rtd1296-ds418.dts      | 30 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi           | 65 ++++++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd129x.dtsi           |  3 +-
 13 files changed, 280 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1293-ds418j.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1293.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296-ds418.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296.dtsi

-- 
2.16.4

