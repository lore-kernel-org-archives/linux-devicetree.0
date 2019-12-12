Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDC6C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 20:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C524121556
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 20:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wQJsBnE0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbfLLUgB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 15:36:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55742 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730834AbfLLUgB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 15:36:01 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96416A2B;
        Thu, 12 Dec 2019 21:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576182958;
        bh=jns3lG4yF9SJ1qJ0UZr0iN9a4ReAkskKE8/XSfSUMOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wQJsBnE0n8EacJ2jzzVRMtR35IRBSLJOoFr11byn52ff+vL8/mgtZauAgabU0t+qo
         uiWZjcVl6RwjzIlz0H3Hfs520q3aE118VAKvsWASr7uiCIrzmnoYZx2iTdKIk1Ngo/
         Y0yG3FN6IShh+TqEg6HQiLuTjSnVm1jR/DiLHzFE=
Date:   Thu, 12 Dec 2019 22:35:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20191212203550.GB4892@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
> On 11/12/2019 18:53, Tony Lindgren wrote:
> > * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
> >> Hi Tomi,
> >>
> >> Thank you for the patch.
> >>
> >> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
> >>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
> >>> the panel timings in the DT file. So remove them.
> >>
> >> Should you in that case drop the panel-dpi compatible string too, as the
> >> panel-dpi bindings require panel timings in DT ?
> > 
> > Yeah sounds like if panel-dpi is no longer usable for this device it
> > should be dropped from the compatible list.
> 
> Ok, I agree.
> 
> Looking at the dts files, panel-dpi is used in a bunch of boards. But
> we even have 3 dts files with panel-dpi, without the detailed panel
> model in compatible...
> 
> Fixing those will break the compatibility with old dtbs and new
> kernel, unless we add timings-from-dt to a panel driver that handles
> panel-dpi.

I know, and I don't have a perfect answer for this :-( I don't see a
third option, it's either breaking DT backward compatibility or adding
timings parsing to a panel driver (either a new panel-dpi driver or to
panel-simple). What's your preferred option ?

-- 
Regards,

Laurent Pinchart
