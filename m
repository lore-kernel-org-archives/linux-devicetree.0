Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49589C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25EFC2075B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgAOOnP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:43:15 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:50714 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOOnP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:43:15 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 1ECBB2002F;
        Wed, 15 Jan 2020 15:43:10 +0100 (CET)
Date:   Wed, 15 Jan 2020 15:43:09 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, maxime@cerno.tech
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115144309.GA20850@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
 <20200115122253.GA22854@ravnborg.org>
 <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=DS-CZ__rylYsUGF3V18A:9 a=AQiqg4VX56o5Sd8s:21 a=xfkTRcJW48Ixwwvu:21
        a=CjuIK1q_8ugA:10 a=1BnFAEYpt1gA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jyri.

> >>
> > ...
> >> v6: - Check CTM and gamma support from dispc_features when creating crtc
> >>     - Implement CTM support for k2g and fix k3 CTM implementation
> >>     - Remove gamma property persistence and always write color properties
> >>       in a new modeset
> > 
> > I applied this, just to throw this throgh my build setup.
> > 
> > checkpatch reported:
> > total: 0 errors, 45 warnings, 46 checks, 4920 lines checked
> > 
> > - space after cast
> > - CamelCase
> > - Macro argument
> > - length warnings
> > - alignment
> > 
> > I would ignore the line length warnings for the coefficients, but fix the
> > rest.
> > 
> 
> You are using --subjective, or are there new warnings turned on since I
> rebased?
This was the warnigns that appearted when I did
cat patches | dim apply

So the defaults in dim was used - which is:
-q --emacs --strict --show-types

As dim is the tool used when applying patches to drm-misc-next then
whoever ends up applying the patches will see the same warnigns from
checkpatch.

You can find more info on dim here:
https://drm.pages.freedesktop.org/maintainer-tools/dim.html

As maintainer of this driver you will need to learn the basics.

My dim vocabulary are:
dim apply
dim fixes
dim push
dim update-branches
dim checkpatch

dim can do much more, but this is the ones that I use most.
In your case you would like to use "dim checkpatch HEAD~5"

	Sam
