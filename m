Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5970AC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 16:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A90720747
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 16:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDQOc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 12:14:32 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:58708 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726639AbgGDQOc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 12:14:32 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 12:14:32 EDT
X-Halon-ID: 926b1813-be10-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 926b1813-be10-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 18:08:28 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] dt-bindings: adv7180: Convert bindings to json-schema
Date:   Sat,  4 Jul 2020 18:06:42 +0200
Message-Id: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Lars,

This series converts the ADV7180 bindings to YAML and lists the new file 
under MAINTAINERS. I have used the schema to validate the usage of the 
bindings and found some issues with some Renesas boards [1].

1. [PATCH 0/2] ARM: dts: renesas: Cleanup ADV7180 bindings

Niklas Söderlund (2):
  dt-bindings: adv7180: Convert bindings to json-schema
  MAINTAINERS: Add ADV7180 bindings documentation

 .../devicetree/bindings/media/i2c/adv7180.txt |  49 -----
 .../bindings/media/i2c/adv7180.yaml           | 184 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 185 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.yaml

-- 
2.27.0

