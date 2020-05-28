Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D999BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 06:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82DA207BC
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 06:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgE1GgW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 02:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE1GgW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 02:36:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B52C05BD1E
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 23:36:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 445512A3C63
Date:   Thu, 28 May 2020 08:36:16 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>, michal.simek@xilinx.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200528063616.e2na5lcnxzl34sc3@rcn-XPS-13-9360>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>, michal.simek@xilinx.com
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
 <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
 <20200526014444.GB6179@pendragon.ideasonboard.com>
 <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
 <CAL_JsqJgQajnKdQ1Bt6YFX04fX0VGz44Q3kBdLLR04OzhWrH5A@mail.gmail.com>
 <CAMuHMdXQQXOcVuq7Zhfp4qGH0vmLtxp3fdCJ+7VSAMQYSdjsTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXQQXOcVuq7Zhfp4qGH0vmLtxp3fdCJ+7VSAMQYSdjsTg@mail.gmail.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

On mié 27-05-2020 20:18:07, Geert Uytterhoeven wrote:
> > There's currently no requirement that binding schema don't introduce
> > warnings in dts files. That should change when/if we get to a warning
> > free state (probably per platform/family). I don't think we're close
> > on any platform? (If we are, I'd like to start tracking that). It is
> > good to pay attention to the warnings you get though as the schema may
> > not be doing what you expect or the binding really doesn't match
> > reality.
> 
> OK.
> 
> > > I do my best to avoid introducing regressions when the binding conversions
> > > go upstream.
> >
> > Meaning you fix the dts files or massage the schema to match? If we
> > just adjust schema to match, what's the point in this effort? We
> > should find things wrong or ill defined.
> 
> I fix up DTS files, and fast-track those fixes, so they appear upstream before
> the DT binding conversion, where possible.

Thank you everyone for pitching in and for clarifying the procedure,
I'll prepare a new series with the changes that Laurent proposed
(without the patches that Geert already merged).

Cheers,
Ricardo
