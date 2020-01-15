Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478F7C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DE93222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgAOM30 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:29:26 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:40412 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOM30 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:29:26 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 2960F20372;
        Wed, 15 Jan 2020 13:29:24 +0100 (CET)
Date:   Wed, 15 Jan 2020 13:29:22 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, maxime@cerno.tech
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115122922.GA18982@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
        a=6AkCbFbQfmYoq7yG4RYA:9 a=QEXdDO2ut3YA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jyri.

> 
> v6: - Check CTM and gamma support from dispc_features when creating crtc
>     - Implement CTM support for k2g and fix k3 CTM implementation
>     - Remove gamma property persistence and always write color properties
>       in a new modeset

I get this error when I build this patch on top of drm-misc-next:

drivers/gpu/drm/tidss/tidss_encoder.c: In function ‘tidss_encoder_atomic_check’:
drivers/gpu/drm/tidss/tidss_encoder.c:35:23: error: ‘struct drm_encoder’ has no member named ‘bridge’
   35 |  for (bridge = encoder->bridge; bridge; bridge = bridge->next) {
      |                       ^~
drivers/gpu/drm/tidss/tidss_encoder.c:35:56: error: ‘struct drm_bridge’ has no member named ‘next’
   35 |  for (bridge = encoder->bridge; bridge; bridge = bridge->next) {
      |                                                        ^~

I did not investigate - but it looks like the patch needs
to be adapted to latest drm-misc-next changes.

	Sam
