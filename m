Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8439DC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 09:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6096920739
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 09:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgFQJrF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 05:47:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56672 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgFQJrF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 05:47:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id EA9E32A3876
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie
Subject: [PATCH v4 0/4] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date:   Wed, 17 Jun 2020 11:46:29 +0200
Message-Id: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series converts the DT binding for the TI TFP410 DPI-to-DVI encoder
to json-schema.

It also fixes a minor bug in the ti-tfp410 driver that causes a
wrong calculation of the setup and hold times when the de-skew feature
is enabled. The retrieval of the de-skew value from the DT has also been
updated to reflect the binding changes.

Changes in v4:

  - ti,tfp410.yaml:
    - "ports" node set back as required (Laurent Pinchart). This means
      that dove-sbc-a510.dts will not comply with the binding and will
      have to be fixed at some point.

The bindings have been tested with:

  make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...ti,tfp410.yaml>
  make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...ti,tfp410.yaml>

for <arch> = arm and arm64.
This uncovered a number of dts files that use the TFP410 but not through
I2C and don't define the ti,deskew property. These should also be fixed.

Ricardo Cañuelo (4):
  dt-bindings: display: ti,tfp410.txt: convert to yaml
  dt-bindings: display: ti,tfp410.yaml: Redefine ti,deskew property
  drm/bridge: tfp410: fix de-skew value retrieval from DT
  drm/bridge: tfp410: Fix setup and hold time calculation

 .../bindings/display/bridge/ti,tfp410.txt     |  66 ---------
 .../bindings/display/bridge/ti,tfp410.yaml    | 131 ++++++++++++++++++
 drivers/gpu/drm/bridge/ti-tfp410.c            |  10 +-
 3 files changed, 136 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml

-- 
2.18.0

