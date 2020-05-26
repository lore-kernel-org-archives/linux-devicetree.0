Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4320FC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 10:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB472073B
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 10:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fmwuBd9d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgEZKMN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 06:12:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37570 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgEZKMN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 06:12:13 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14191562;
        Tue, 26 May 2020 12:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590487932;
        bh=Py2isC6mRTURlfpioRLzyzMY0J2Ilp98yboi0lSZ12M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fmwuBd9dFsgK6/1pNS8bs4W3gePvmrztDmRaV3dTbG9JCEPJzLLS6+Hs0Ql2eoFFo
         Zoy7LOiMyXQBCg2fab8rib53qUHzZyUUHL8uq4t8cbp09FGF8Ij5NIT7+kTS8V/Aa5
         9zM/2K7FcVstY//cC1jZEoj8GISrQAsG3poJIucs=
Date:   Tue, 26 May 2020 13:11:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200526101158.GA5903@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
 <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
 <20200526014444.GB6179@pendragon.ideasonboard.com>
 <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

On Tue, May 26, 2020 at 09:03:09AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart wrote:
> > On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Cañuelo wrote:
> > > On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > > > If we want to be more strict and require the definition of all the
> > > > > supplies, there will be many more DTs changes in the series, and I'm not
> > > > > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > > > > at them and it's not always clear which regulators to use or if they are
> > > > > even defined.
> > > >
> > > > We can decouple the two though (I think). The bindings should reflect
> > > > what we consider right, and the dts files could be fixed on top.
> > >
> > > Do you have a suggestion on how to do this? If we decouple the two
> > > tasks most of the work would be searching for DTs to fix and finding a
> > > way to fix each one of them, and unless I do this _before_ the binding
> > > conversion I'll get a lot of dtbs_check errors.
> >
> > Rob should answer this question as it will be his decision, but I've
> > personally never considered non-compliant DT sources to be an obstacle
> > to bindings conversion to YAML. The DT sources should be fixed, but I
> > don't see it as a prerequisite (although it's a good practice).
> 
> I do my best to avoid introducing regressions when the binding conversions
> go upstream.

Please note that we're not talking about runtime regressions, as drivers
are not updated. It's "only" dtbs_check that would produce new errors.

> FTR, hence patches 1-3 are already in v5.7-rc7.

-- 
Regards,

Laurent Pinchart
