Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E37C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3719320578
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgGOMpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 08:45:23 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32981 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgGOMpX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 08:45:23 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8933AC0009;
        Wed, 15 Jul 2020 12:45:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v3 0/3] dt-bidings: media: ov5647 bindings + small fix
Date:   Wed, 15 Jul 2020 14:48:35 +0200
Message-Id: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A small update to v2:
- Add Laurent's tags
- Remove 'endpoint' from the list of required port properties, in the
  newly introduced ov5647 bindings, and while updating the existing ov8865
  ones
- Make Dave and me co-maintainers for ov5647 as the two email addresses we tried
  to contact Luis with both failed.

Thanks
  j

Jacopo Mondi (3):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: i2c: Document 'remote-endpoint'
  media: MAINTAINERS: ov5647: Add myself as maintainer

 .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 79 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/ov8856.yaml |  7 +-
 MAINTAINERS                                   |  3 +-
 5 files changed, 90 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

