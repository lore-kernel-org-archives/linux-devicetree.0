Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB315C433E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 18:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FF352078D
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 18:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgGJSrf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 14:47:35 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:48750 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgGJSrf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 14:47:35 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 593238051B;
        Fri, 10 Jul 2020 20:47:31 +0200 (CEST)
Date:   Fri, 10 Jul 2020 20:47:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Chris Zhong <zyw@rock-chips.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to
 DT Schema
Message-ID: <20200710184730.GA628995@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704103408.GA735964@ravnborg.org>
 <20200709233502.GA1103707@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709233502.GA1103707@bogus>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
        a=SIG6TxBT1hdypITfUdwA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

> > On Sat, Jul 04, 2020 at 12:28:03PM +0200, Sam Ravnborg wrote:
> > > This patch-set convert 3 of the remaining panel bindings to yaml.
> > > 
> > > This is a follow-up on v2 that converted a lot of panel bindings:
> > > https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
> > > All was applied except for the reaming three patches included here.
> > > 
> > > One binding is a DSI binding so just added to panel-simple-dsi.
> > > The other two bindings addressed review feedback from Rob.
> > > 
> > > Sebastian Reichel has a pending patch to address the remaining
> > > panel binding in display/panel/
> > > 
> > > All bindings pass dt-binding-check.
> > > Based on top of drm-misc-next.
> > > 
> > > 	Sam
> > > 
> > > 
> > > Sam Ravnborg (3):
> > >       dt-bindings: display: convert innolux,p079zca to DT Schema
> > >       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
> > >       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
> > 
> > git format-patch adds a space after the ',' - in the subject.
> > This is often a good idea, but not for binding files.
> > Will fix when I apply - if I do not forget that is..
> 
> Sure about that? I'm pretty sure it's dri-devel doing it. Look at 
> lore.kernel.org copies for different lists. I've been fighting with that 
> first in patchwork (which had this bug) and then in b4 (which is where 
> it got nailed down to dri-devel).
You are right.

The patches that I copied myself on had the correct subject.
Only the dri-devel mails had the mangled subject.

	Sam

> 
> Rob
