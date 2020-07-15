Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775EEC433E6
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 09:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 619BD2053B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 09:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgGOJPy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 05:15:54 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:33038 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729577AbgGOJPx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 05:15:53 -0400
X-Halon-ID: c4f91b1b-c67b-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id c4f91b1b-c67b-11ea-8fb8-005056917f90;
        Wed, 15 Jul 2020 11:15:52 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] dt-bindings: adv7604: Convert bindings to json-schema
Date:   Wed, 15 Jul 2020 11:14:52 +0200
Message-Id: <20200715091455.1772470-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hans,

This series converts the ADV7604 bindings to YAML and lists the new file
under MAINTAINERS. I have used the schema to validate the usage of the
bindings and only found one issue that is fixed in [1].

1. [PATCH] ARM: dts: gose: Fix ports node name for adv7612

Niklas Söderlund (3):
  dt-bindings: adv7604: Fix documentation for hpd-gpios
  dt-bindings: adv7604: Convert bindings to json-schema
  MAINTAINERS: Add ADV7604 bindings documentation

 .../devicetree/bindings/media/i2c/adv7604.txt |  88 ----------
 .../bindings/media/i2c/adv7604.yaml           | 161 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 162 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml

-- 
2.27.0

