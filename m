Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C1DC2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C62720768
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDIRKJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:10:09 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:38704 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgDIRKJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:10:09 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 0FA0F20029;
        Thu,  9 Apr 2020 19:10:07 +0200 (CEST)
Date:   Thu, 9 Apr 2020 19:10:06 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ltk500hd1829: Remove the reg
 property
Message-ID: <20200409171006.GA31904@ravnborg.org>
References: <20200328183641.11226-1-festevam@gmail.com>
 <20200328203001.GD32230@ravnborg.org>
 <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=pGLkceISAAAA:8 a=60QWDGjvRy7Pmp0JI_cA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Thu, Apr 09, 2020 at 10:04:13AM -0600, Rob Herring wrote:
> On Sat, Mar 28, 2020 at 2:30 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Sat, Mar 28, 2020 at 03:36:40PM -0300, Fabio Estevam wrote:
> > > Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
> > > the dsi unit name, but missed to remove the 'reg' property, which causes
> > > the following 'make dt_binding_check' warning:
> > >
> > > Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name
> > >
> > > Fix it by removing the unneeded 'reg' property.
> > >
> > > Fixes: 52120e8c7ae3 ("dt-bindings: display: fix panel warnings")
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> >
> > Thanks, applied to drm-misc-next.
> 
> This should go in fixes for 5.7 as well as the one for xinpeng,xpp055c272.
Will take care later this week or start next week.
Ping me if you continue to see panel releated warnings in late -rc1.

	Sam
