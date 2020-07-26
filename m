Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF4DC433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 20:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC74420715
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 20:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGZUlu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jul 2020 16:41:50 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:47642 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgGZUlt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jul 2020 16:41:49 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 22E0A20024;
        Sun, 26 Jul 2020 22:41:47 +0200 (CEST)
Date:   Sun, 26 Jul 2020 22:41:45 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
Message-ID: <20200726204145.GA3750553@ravnborg.org>
References: <20200725211457.5772-1-marex@denx.de>
 <20200725211457.5772-2-marex@denx.de>
 <20200726071517.GD1691925@ravnborg.org>
 <a8d6b9ad-a9c4-925b-e9f8-00c803b30e9a@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d6b9ad-a9c4-925b-e9f8-00c803b30e9a@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
        a=7gkXJVJtAAAA:8 a=24rWtvPpTJrT0KyJ0wcA:9 a=CjuIK1q_8ugA:10
        a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
        a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Sun, Jul 26, 2020 at 12:17:46PM +0200, Marek Vasut wrote:
> On 7/26/20 9:15 AM, Sam Ravnborg wrote:
> > Hi Marek.
> 
> Hi,
> 
> > On Sat, Jul 25, 2020 at 11:14:57PM +0200, Marek Vasut wrote:
> >> Add very basic driver for Toshiba TC358762 DSI-to-DPI bridge, derived
> >> from tc358764 driver and panel-raspberrypi-touchscreen. This driver is
> >> meant to replace the panel-raspberrypi-touchscreen too, as the bridge
> >> connection can be described in DT too.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> To: dri-devel@lists.freedesktop.org
> >> Cc: Eric Anholt <eric@anholt.net>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: devicetree@vger.kernel.org
> >> ---
> > 
> > Two general comments.
> > - This driver should use the bridge panel - this will simplify the
> >   driver in many places. We already have several good examples in-tree
> >   that does this.
> 
> Can you list such an example ?

Take a look at tc358764.c in following patch-set:
https://lore.kernel.org/dri-devel/20200726203324.3722593-1-sam@ravnborg.org/

Your current driver will be even smaller after implmenting these
changes.

	Sam
