Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE617C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B02A721D7D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cW9CMjup"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLSIX7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:23:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53870 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfLSIX7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:23:59 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NN3o085897;
        Thu, 19 Dec 2019 02:23:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576743803;
        bh=8ULQWT/8Gqwbv84v/vrRnQfeBXWOo7ObBc+GlFgPtqE=;
        h=From:To:CC:Subject:Date;
        b=cW9CMjupoG9/a1e8aY/PcDYNpsc/0fyY7dTqLngJg2DIzB/PU+MVl9VBVyaa7XUmX
         jgbpMtxvyCR57dA9OJebZdJTbaYPleSVeC/j9KHLwD3zuOT/ol6V8fYL7btIGE1aq2
         pdrGV+FYrbOQFSOjqEXG/TB+fdyGxheL1K7wiRCk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NNne052864;
        Thu, 19 Dec 2019 02:23:23 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 02:23:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 02:23:22 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NJI4095098;
        Thu, 19 Dec 2019 02:23:20 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>, <maxime@cerno.tech>
Subject: [PATCH v4 0/5] drm/tidss: New driver for TI Keystone platform Display SubSystem
Date:   Thu, 19 Dec 2019 10:23:14 +0200
Message-ID: <cover.1576704528.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Changes sice v3:
- Add descriptions some yaml binding properites
- Remove redundant minItems directives from yaml bindings
- Remove ports node from ti,k2g-dss yaml binding
- no change to MAINTAINERS or to the driver code

Changes since v2:
- Add version history to commit messages
- Fix yaml bindings now that got dt_binding_check dtbs_check working propery
- Move tidss entry in MAINTAINERS after omapdrm and add "T: git
  git://anongit.freedesktop.org/drm/drm-misc"
- no change to driver code

Changes since the first version of the patch series [2]:
- "drm/tidss: New driver for TI Keystone platform Display SubSystem"
 - rebased on top of drm-next-2019-11-27
 - sort all include lines in all files
 - remove all include <drm/drmP.h>
 - remove select "select VIDEOMODE_HELPERS"
 - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
   to call it in new modeset case as it is also called in vp_enable())
 - change probe sequence and drm_device allocation (follow example in drm_drv.c)
 - use __maybe_unused instead of #ifdef for pm functions
 - remove "struct drm_fbdev_cma *fbdev;" from driver data
 - check panel connector type before connecting it
- No change to binding or MAINTAINERS patches

There was couple of attempts upstream an earlier version of this
driver about a year ago [1]. Back then I needed to stop my efforts to
implement support for next Keystone DSS version, so now the driver
supports three different Keystone DSS version on three different SoCs.

I am starting the patch series versioning from the beginning because it
has been over a year since the previous patch set and the structure of
the driver has evolved quite a bit. However, all the earlier comments
should be addressed in this series.

[1] https://patchwork.freedesktop.org/series/44947/
[2] https://lists.freedesktop.org/archives/dri-devel/2019-November/246542.html

Jyri Sarha (5):
  dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
  dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
  dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
  drm/tidss: New driver for TI Keystone platform Display SubSystem
  MAINTAINERS: add entry for tidss

 .../bindings/display/ti/ti,am65x-dss.yaml     |  154 +
 .../bindings/display/ti/ti,j721e-dss.yaml     |  209 ++
 .../bindings/display/ti/ti,k2g-dss.yaml       |  114 +
 MAINTAINERS                                   |   11 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/tidss/Kconfig                 |   14 +
 drivers/gpu/drm/tidss/Makefile                |   12 +
 drivers/gpu/drm/tidss/tidss_crtc.c            |  376 +++
 drivers/gpu/drm/tidss/tidss_crtc.h            |   46 +
 drivers/gpu/drm/tidss/tidss_dispc.c           | 2643 +++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h           |  132 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  243 ++
 drivers/gpu/drm/tidss/tidss_drv.c             |  285 ++
 drivers/gpu/drm/tidss/tidss_drv.h             |   40 +
 drivers/gpu/drm/tidss/tidss_encoder.c         |   88 +
 drivers/gpu/drm/tidss/tidss_encoder.h         |   17 +
 drivers/gpu/drm/tidss/tidss_irq.c             |  185 ++
 drivers/gpu/drm/tidss/tidss_irq.h             |   72 +
 drivers/gpu/drm/tidss/tidss_kms.c             |  248 ++
 drivers/gpu/drm/tidss/tidss_kms.h             |   15 +
 drivers/gpu/drm/tidss/tidss_plane.c           |  217 ++
 drivers/gpu/drm/tidss/tidss_plane.h           |   25 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.c     |  202 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h     |   22 +
 25 files changed, 5373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
 create mode 100644 drivers/gpu/drm/tidss/Kconfig
 create mode 100644 drivers/gpu/drm/tidss/Makefile
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

