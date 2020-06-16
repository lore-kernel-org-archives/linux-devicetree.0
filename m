Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686D4C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 01:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4650920739
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 01:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qhD/lWgk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgFPBvn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 21:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgFPBvn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 21:51:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DABCC061A0E
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 18:51:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4763F9;
        Tue, 16 Jun 2020 03:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592272301;
        bh=peS4/uh5rv4eTufOqf33S/epmbRDzQUT067NfhNk4Dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qhD/lWgk8GRGpn0jQBo39ZH0IPDl9X7KKSAmNtTy78Rm7iG4AIYGQtjCyK3e0ym/+
         d3pxV7r/+jUFiu5TSKPOGAnmOjv/TxGX20OIvBXxR/E5LyuJ6It99h5lghpyao/Lr7
         0M7f5YRhZi0gc5fHakResb6lQC3l+t85cgo+9pk4=
Date:   Tue, 16 Jun 2020 04:51:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        tomi.valkeinen@ti.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200616015119.GI1629@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200611160817.GA6031@pendragon.ideasonboard.com>
 <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

On Mon, Jun 15, 2020 at 11:38:07AM +0200, Ricardo Cañuelo wrote:
> On Thu, 2020-06-11 at 19:08 +0300, Laurent Pinchart wrote:
> > On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Cañuelo wrote:
> > > Make the ports node optional, since there are some DTs that don't define
> > > any ports for ti,tfp410.
> > > 
> > > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > 
> > Shouldn't we fix those DTs instead ? What's the point of a TFP410
> > without ports in DT ?
> 
> This comes from the discussion in the previous version of this series.
> 
> In the DTs that don't define any ports (it's dove-sbc-a510.dts only, actually)
> it's not clear how to define the ports (I'm not familiar with this board).
> Initially I defined a set of empty ports just to comply with the binding
> requirements, but Rob suggested that we might as well declare them as optional,
> since having an empty port definition with no remote endpoints is no better than
> having no ports at all.
> 
> I understand both opinions but I just don't know which is the best option at
> this point.

How about keeping the ports mandatory, and leaving dove-sbc-a510.dts to
be fixed later ?

-- 
Regards,

Laurent Pinchart
