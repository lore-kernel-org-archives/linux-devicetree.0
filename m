Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A23C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 13:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BD9E207D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 13:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbgFRNhi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 09:37:38 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:14363 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgFRNhh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 09:37:37 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6448F24000D;
        Thu, 18 Jun 2020 13:37:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH 0/2] dt-bidings: media: ov5647 bindings + small fix
Date:   Thu, 18 Jun 2020 15:40:43 +0200
Message-Id: <20200618134045.151532-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

While converting the ov5647 bindings to dt-schema I noticed the remote-endpoint
property was not documented in the only 2 existing image sensor bindings.

Convert the ov5647 bindings and add remote-endpoint as required property to
the existing ones.

Jacopo Mondi (2):
  dt-bindings: media: ov5647: Convert to json-schema
  dt-bindings: media: i2c: Document 'remote-endpoint'

 .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
 .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
 .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/ov8856.yaml |  5 ++
 4 files changed, 92 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml

--
2.27.0

