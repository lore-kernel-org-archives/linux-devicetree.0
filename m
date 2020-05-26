Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4248C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 01:45:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BEBF2071C
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 01:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rA+7VCeT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388233AbgEZBpA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 21:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387794AbgEZBo7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 21:44:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E266C061A0E
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 18:44:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9451562;
        Tue, 26 May 2020 03:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590457498;
        bh=WO78qSn6qRwq865tLbnkjyz39KiwOC685Y01AfjqX8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rA+7VCeTSx+FV23WUjOiz5m8cbmHlx4/aL4TkVantAECyeFmxUUHm95x+oMH4c+SV
         OGbgf6UGcxxX4SjIxTDtGCPDi+GASoR9QZ33Pk1VtSiHyx+ahqYqu8jgmwYCUh8olo
         J3viD2UCBZEgtvz3Ctc33evH4Agj2X+2aUQWLEII=
Date:   Tue, 26 May 2020 04:44:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200526014444.GB6179@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
 <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Cañuelo wrote:
> On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > If we want to be more strict and require the definition of all the
> > > supplies, there will be many more DTs changes in the series, and I'm not
> > > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > > at them and it's not always clear which regulators to use or if they are
> > > even defined.
> > 
> > We can decouple the two though (I think). The bindings should reflect
> > what we consider right, and the dts files could be fixed on top.
> 
> Do you have a suggestion on how to do this? If we decouple the two
> tasks most of the work would be searching for DTs to fix and finding a
> way to fix each one of them, and unless I do this _before_ the binding
> conversion I'll get a lot of dtbs_check errors.

Rob should answer this question as it will be his decision, but I've
personally never considered non-compliant DT sources to be an obstacle
to bindings conversion to YAML. The DT sources should be fixed, but I
don't see it as a prerequisite (although it's a good practice).

> The binding conversion itself is done, if we go this route the only
> additional change would be to make the supplies required.

-- 
Regards,

Laurent Pinchart
