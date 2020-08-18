Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9B3C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 12:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B24D2076D
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 12:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgHRMQj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 08:16:39 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38121 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRMQi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 08:16:38 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6264360002;
        Tue, 18 Aug 2020 12:16:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: media: ov772x: Convert to json-schama
Date:   Tue, 18 Aug 2020 14:20:09 +0200
Message-Id: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Just adding a missing signed-off-by to 2/3

Re-pasting here the cover letter for reference

--------------------------------------------------------------------------------
Convert to json-schema the ov772x bindings and add support for endpoint
properties to pave the way for  Prabhakar's support for BT.656 in the driver.

Prabhakar: could you confirm the properties defaults are sane according to your
setup?
--------------------------------------------------------------------------------

Jacopo Mondi (3):
  dt-bindings: media: ov772x: Convert to json-schema
  dt-bindings: media: ov772x: Make bus-type mandatory
  dt-bindings: media: ov772x: Document endpoint props

 .../devicetree/bindings/media/i2c/ov772x.txt  |  40 ------
 .../devicetree/bindings/media/i2c/ov772x.yaml | 134 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 135 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml

--
2.27.0

