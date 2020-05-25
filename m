Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F6CC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 07:43:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2C742075F
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 07:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389121AbgEYHnm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 03:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389105AbgEYHnm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 03:43:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F222EC061A0E
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 00:43:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 3BDAC2A0A70
Date:   Mon, 25 May 2020 09:43:35 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
 <20200514152239.GG5955@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200514152239.GG5955@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > If we want to be more strict and require the definition of all the
> > supplies, there will be many more DTs changes in the series, and I'm not
> > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > at them and it's not always clear which regulators to use or if they are
> > even defined.
> 
> We can decouple the two though (I think). The bindings should reflect
> what we consider right, and the dts files could be fixed on top.

Do you have a suggestion on how to do this? If we decouple the two
tasks most of the work would be searching for DTs to fix and finding a
way to fix each one of them, and unless I do this _before_ the binding
conversion I'll get a lot of dtbs_check errors.

The binding conversion itself is done, if we go this route the only
additional change would be to make the supplies required.

Cheers,
Ricardo
