Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9103C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 15:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA1B520665
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 15:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfK0PqB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 10:46:01 -0500
Received: from muru.com ([72.249.23.125]:43714 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0PqB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Nov 2019 10:46:01 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5BF508102;
        Wed, 27 Nov 2019 15:46:37 +0000 (UTC)
Date:   Wed, 27 Nov 2019 07:45:56 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
Message-ID: <20191127154556.GI43123@atomide.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191127 12:59]:
> Hi Tony, Thierry, Laurent,
> 
> Any thoughts on the below points?

> I think yet another option is to write some omap boot time quirks code,
> which looks at the DT data, and changes the panel compatible string (for 1),
> and removes the timings node (for 2).

Nah, seems we can just update the compatible.

> On 14/11/2019 11:39, Tomi Valkeinen wrote:
> > 1) Panel driver is not probed. With omapdrm's panel-dpi, the match
> > happened with "panel-dpi" compatible string. Now with panel-simple, the
> > match should happen with the panel model compatible string, which is
> > "osddisplays,osd057T0559-34ts" in the DT file. However, no such
> > compatible exists in panel-simple.
> >
> > Interestingly, the actual panel at least on my EVMs and ePOSes is not
> > osd057T0559-34ts, but osd070t1718-19ts. Also, I was unable to find any
> > information about osd057T0559-34ts. I don't know the history with this,
> > so it is possible that the early versions of the boards did have
> > osd057T0559-34ts, but was later changed to osd070t1718-19ts.

I guess you could keep the old compatible there too if really needed.
But then again if the old compatible is known to be incorrect, it
should be just updated.

So it looks good to me for the dts changes. Do you want me to pick
them into fixes as it seems that the panel driver fix is a separate
issue?

Regards,

Tony
