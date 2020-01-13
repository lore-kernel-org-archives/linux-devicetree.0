Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936F4C33CB0
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 686D02072B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="grS5FT+x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgAMWCd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:02:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54524 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgAMWCd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:02:33 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DM2LcN008267;
        Mon, 13 Jan 2020 16:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578952941;
        bh=Fg+cUMr+b2FbuTb4zKvsXhoIWkOZT33ZCoA758jhTEo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=grS5FT+xk9p3pLhUp0MZ/vtKpfueeGwtidvPwhqMblJ/y8Pvpbl49JNo1gJUxCnoX
         1cMPhZ9cHrsEdZIIX8Eey23VAheRbIXZjx2MlB0lhNHRXa+i9Nh8nv5DwnLzliDjWG
         lTTw5jqK23DgU4R6bDe+DZpZK6E6aYFVBheMBr4c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DM2LRs082846;
        Mon, 13 Jan 2020 16:02:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 16:02:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 16:02:21 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DM2KDx054728;
        Mon, 13 Jan 2020 16:02:21 -0600
Date:   Mon, 13 Jan 2020 16:06:06 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Jyri Sarha <jsarha@ti.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <praneeth@ti.com>, <yamonkar@cadence.com>,
        <sjakhade@cadence.com>, <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <maxime@cerno.tech>
Subject: Re: [PATCH v5 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200113220606.3ojuvl6mo6r7uubn@ti.com>
References: <cover.1576857145.git.jsarha@ti.com>
 <082458208aca73c3a44e567abcea87046da038d6.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <082458208aca73c3a44e567abcea87046da038d6.1576857145.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jyri Sarha <jsarha@ti.com> wrote on Fri [2019-Dec-20 17:55:12 +0200]:
> This patch adds a new DRM driver for Texas Instruments DSS IPs used on
> Texas Instruments Keystone K2G, AM65x, and J721e SoCs. The new DSS IP is
> a major change to the older DSS IP versions, which are supported by
> the omapdrm driver. While on higher level the Keystone DSS resembles
> the older DSS versions, the registers are completely different and the
> internal pipelines differ a lot.
> 
> DSS IP found on K2G is an "ultra-light" version, and has only a single
> plane and a single output. The Keystone 3 DSS IPs are found on AM65x
> and J721E SoCs. AM65x DSS has two video ports, one full video plane,
> and another "lite" plane without scaling support. J721E has 4 video
> ports, 2 video planes and 2 lite planes. AM65x DSS has also integrated
> OLDI (LVDS) output.
> 
> Version history:
> 
> v2: - rebased on top of drm-next-2019-11-27
>     - sort all include lines in all files
>     - remove all include <drm/drmP.h>
>     - remove select "select VIDEOMODE_HELPERS"
>     - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
>       to call it in new modeset case as it is also called in vp_enable())
>     - change probe sequence and drm_device allocation (follow example in
>       drm_drv.c)
>     - use __maybe_unused instead of #ifdef for pm functions
>     - remove "struct drm_fbdev_cma *fbdev;" from driver data
>     - check panel connector type before connecting it
> 
> v3: no change
> 
> v4: no change
> 
> v5: - remove fifo underflow irq handling, it is not an error and
>       it should be used for debug purposes only
>     - memory tuning, prefetch plane fifo up to high-threshold value to
>       minimize possibility of underflows.
> 
> Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

