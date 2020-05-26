Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175EAC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3437208B3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389385AbgEZTpO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 15:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389360AbgEZTpO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 15:45:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E085C03E96D
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 12:45:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1D5B82A0390
Message-ID: <a0a8d9178c4b5c05835115f5d2f4301e44146e8f.camel@collabora.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Date:   Tue, 26 May 2020 16:45:03 -0300
In-Reply-To: <CAMuHMdUV+qHpfLfbYwQwPXAUsh7HXvonUNWNh-SeTC-RpHwrog@mail.gmail.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
         <20200511110611.3142-7-ricardo.canuelo@collabora.com>
         <20200514015412.GF7425@pendragon.ideasonboard.com>
         <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
         <20200514152239.GG5955@pendragon.ideasonboard.com>
         <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
         <20200526014444.GB6179@pendragon.ideasonboard.com>
         <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
         <20200526101158.GA5903@pendragon.ideasonboard.com>
         <CAMuHMdUV+qHpfLfbYwQwPXAUsh7HXvonUNWNh-SeTC-RpHwrog@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2020-05-26 at 12:39 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, May 26, 2020 at 12:12 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, May 26, 2020 at 09:03:09AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart wrote:
> > > > On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Cañuelo wrote:
> > > > > On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > > > > > If we want to be more strict and require the definition of all the
> > > > > > > supplies, there will be many more DTs changes in the series, and I'm not
> > > > > > > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > > > > > > at them and it's not always clear which regulators to use or if they are
> > > > > > > even defined.
> > > > > > 
> > > > > > We can decouple the two though (I think). The bindings should reflect
> > > > > > what we consider right, and the dts files could be fixed on top.
> > > > > 
> > > > > Do you have a suggestion on how to do this? If we decouple the two
> > > > > tasks most of the work would be searching for DTs to fix and finding a
> > > > > way to fix each one of them, and unless I do this _before_ the binding
> > > > > conversion I'll get a lot of dtbs_check errors.
> > > > 
> > > > Rob should answer this question as it will be his decision, but I've
> > > > personally never considered non-compliant DT sources to be an obstacle
> > > > to bindings conversion to YAML. The DT sources should be fixed, but I
> > > > don't see it as a prerequisite (although it's a good practice).
> > > 
> > > I do my best to avoid introducing regressions when the binding conversions
> > > go upstream.
> > 
> > Please note that we're not talking about runtime regressions, as drivers
> > are not updated. It's "only" dtbs_check that would produce new errors.
> 
> Exactly.  I was talking about "make dtbs_check" regressions, too.
> 

A "make dtbs_check" failure, due to some foo.dts that fails the check
due to a correct YAML conversion, can't be considered a regression.

I strongly agree with Laurent here, we want to convert the bindings
to YAML and we can't consider non-compliant DT sources to prevent them.

Regards,
Ezequiel

