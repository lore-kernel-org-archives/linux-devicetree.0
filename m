Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2B3C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B24D222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgAOMXA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:23:00 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:39916 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730283AbgAOMXA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:23:00 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id EEAE320366;
        Wed, 15 Jan 2020 13:22:54 +0100 (CET)
Date:   Wed, 15 Jan 2020 13:22:53 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, maxime@cerno.tech
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115122253.GA22854@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=WVcRL-gX3Aqz7jTcpKoA:9 a=_aDu49ajq4D_GkOu:21 a=UD8rQldCOfFGNFSc:21
        a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jyri.

On Wed, Jan 15, 2020 at 01:45:38PM +0200, Jyri Sarha wrote:
> This patch adds a new DRM driver for Texas Instruments DSS IPs used on
> Texas Instruments Keystone K2G, AM65x, and J721e SoCs. The new DSS IP is
> a major change to the older DSS IP versions, which are supported by
> the omapdrm driver. While on higher level the Keystone DSS resembles
> the older DSS versions, the registers are completely different and the
> internal pipelines differ a lot.
> 
> DSS IP found on K2G is an "ultra-light" version, and has only a single
> plane and a single output. The K3 DSS IPs are found on AM65x and J721E
> SoCs. AM65x DSS has two video ports, one full video plane, and another
> "lite" plane without scaling support. J721E has 4 video ports, 2 video
> planes and 2 lite planes. AM65x DSS has also an integrated OLDI (LVDS)
> output.
> 
...
> v6: - Check CTM and gamma support from dispc_features when creating crtc
>     - Implement CTM support for k2g and fix k3 CTM implementation
>     - Remove gamma property persistence and always write color properties
>       in a new modeset

I applied this, just to throw this throgh my build setup.

checkpatch reported:
total: 0 errors, 45 warnings, 46 checks, 4920 lines checked

- space after cast
- CamelCase
- Macro argument
- length warnings
- alignment

I would ignore the line length warnings for the coefficients, but fix the
rest.

	Sam
