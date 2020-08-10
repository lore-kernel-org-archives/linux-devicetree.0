Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B67C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 21:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1333206B5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 21:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgHJVwQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 17:52:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37785 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgHJVwQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 17:52:16 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.homenet.telecomitalia.it (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E736740008;
        Mon, 10 Aug 2020 21:52:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v4 0/4] dt-bindings: media: ov5647: Convert to dt-schema
Date:   Mon, 10 Aug 2020 23:55:39 +0200
Message-Id: <20200810215543.113206-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,
   re-based on latest media master with small typographical updates to the
bindings document.

The series collects patches which have been sent to the list as part of
of two separate series.

I've not been able to get in touch with the sensor driver last maintainer
of the driver (Luis Oliveira)

Thanks
  j

v2->v3:
- Expand the series with two additional patches
- Make 'remote-endpoint' not required: we allow empty endpoints, to be filled
  in with overlays
- End all senteces with a full stop for consistency

Jacopo Mondi (4):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: ov5647: Document pwdn-gpios
  dt-bindings: media: ov5647: Document clock-noncontinuous
  media: MAINTAINERS: ov5647: Replace maintainer

 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 88 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 3 files changed, 91 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

