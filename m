Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176B4C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 17:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE5CC24679
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 17:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgAOROE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 12:14:04 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:56466 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbgAOROE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 12:14:04 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7DC9A81200;
        Wed, 15 Jan 2020 18:14:00 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:13:58 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, maxime@cerno.tech
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115171358.GA23015@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
 <20200115122253.GA22854@ravnborg.org>
 <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
 <20200115144309.GA20850@ravnborg.org>
 <b4f5d846-aa44-a759-1caa-70244dfabeb3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f5d846-aa44-a759-1caa-70244dfabeb3@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=FBmygEOeIvoNrRZmZRsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jyri.

> Well, I'll bite the bullet then, and start mangling the code to the
> "strict" format.

While touching the code please consider moving all logging
over to the new drm_{err,warn,info,dbg} functions.
They give the nice "[drm]" marker.
And they are a tad shorter as you do not have to dereference ddev->dev
everywhere.
And you then also gain support for controlling logging using
drm.debug=0xxxx, os sysfs too.

See drm_print.h in latest drm_misc_next

With or without this change you can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
