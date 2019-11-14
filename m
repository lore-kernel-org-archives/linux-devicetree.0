Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44872C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A31620709
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 09:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y6MS4nhF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfKNJkH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 04:40:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44436 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfKNJkH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 04:40:07 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dwct060060;
        Thu, 14 Nov 2019 03:39:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573724398;
        bh=eR1yIrg2X8EeWm9KCPcT2Lr4/cMCf/WphmqdpoQ3zsE=;
        h=From:To:CC:Subject:Date;
        b=Y6MS4nhFWAgNDGvua5dmwrshnfV3YvzMpOHfCxccYAIPWvYXkp360vVqRbbDMUib4
         6z2SzubaeypK/V5OGTTvC1yHvN1UlXvO4VWO0nWMnABCfVT4Na0s+KpSxgvXrVp4m3
         edVYNvymCgV7kN9hyjrXBK7Ax3650U2X7o2H5wnk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE9dwMV035445
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 03:39:58 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:39:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:39:58 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjn085959;
        Thu, 14 Nov 2019 03:39:56 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 0/3] drm/omap: fix am4 evm lcd
Date:   Thu, 14 Nov 2019 11:39:47 +0200
Message-ID: <20191114093950.4101-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tony, Thierry, Laurent,

After the recent change of moving from omapdrm specific panel-dpi driver
to the DRM simple panel, AM4 EVM/ePOS's panel is not working quite
right. This series has fixes for it, but I'm not sure if these are the
right ways to fix the issues, so comments welcome.

1) Panel driver is not probed. With omapdrm's panel-dpi, the match
happened with "panel-dpi" compatible string. Now with panel-simple, the
match should happen with the panel model compatible string, which is
"osddisplays,osd057T0559-34ts" in the DT file. However, no such
compatible exists in panel-simple.

Interestingly, the actual panel at least on my EVMs and ePOSes is not
osd057T0559-34ts, but osd070t1718-19ts. Also, I was unable to find any
information about osd057T0559-34ts. I don't know the history with this,
so it is possible that the early versions of the boards did have
osd057T0559-34ts, but was later changed to osd070t1718-19ts.

As osd070t1718-19ts is supported by panel-simple, changing the
compatible string to osd070t1718-19ts in the DT file solves this one.

2) Timings in DT file cause a kernel warning. Omapdrm's panel-dpi used
video timings from the DT file, so they are present in all the DT files.
panel-simple uses timings from a table in the panel-simple driver, but
gives a kernel warning if the DT file contains timings.

This can be solved by removing the timings from the DT file.

3) Sync drive edge is not right. This one might have been present also
with panel-dpi, I didn't verify. The problem is that the panel-simple
data for osddisplays_osd070t1718_19ts defines bus_flags for DE polarity
and pixdata edge, but not for sync edge.

The datasheet for the panel does not give any hint on what the edge
should be.  Omapdrm defaults to driving syncs on falling edge, which
caused the image to be shifted one pixel to the right.

Adding DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE bus_flag solves the problem. AM5
EVM also has the same panel with the same behavior.

====

The reason I'm not sure if the 1) and 2) fixes are correct is that
they're breaking DT compatibility. Should we instead make changes to
panel-simple to keep the same DT files working?

This would mean adding a new entry for the osd057T0559-34ts panel, but
as we don't have datasheet for it, I think we could just append the
compatible string to osd070t1718-19t's data.

It would also mean doing some change to the panel-simple code that gives
the warning about timings in DT data. This might make sense, as I think
we have other DT files with video timings too.

For 3), I think the patch is fine, but I'm not sure if the display
controller driver should be able to deduce the sync drive edge from the
pixdata drive edge. Are they usually the same? I have no idea...

 Tomi

Tomi Valkeinen (3):
  ARM: dts: am437x-gp/epos-evm: fix panel compatible
  ARM: dts: am437x-gp/epos-evm: drop unused panel timings
  drm/panel: simple: fix osd070t1718_19ts sync drive edge

 arch/arm/boot/dts/am437x-gp-evm.dts  | 18 +-----------------
 arch/arm/boot/dts/am43x-epos-evm.dts | 18 +-----------------
 drivers/gpu/drm/panel/panel-simple.c |  3 ++-
 3 files changed, 4 insertions(+), 35 deletions(-)

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

