Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0B3C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D941921548
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bj4klpDv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFQWnw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:43:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQWnv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:43:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B1BCF9;
        Thu, 18 Jun 2020 00:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592433829;
        bh=RsQLbHMQw0UnnMPXiJLpwb7U7RPinG9A0N7ByG5hyvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bj4klpDvexsIx02tUwJp8pvRLCUAjQm8xeslbCUfE/Vf4usT2oWacy9HFLrIOZNUf
         faDGeL3MsCLKh6dw9jNJQEXnPRECPJaiMS3FWqICfdf1bITaAvUthue0AMxfepuWtl
         fuv9lwk52SICRGq4BtGOq1jaADjKu3lFoYNKOAA8=
Date:   Thu, 18 Jun 2020 01:43:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, airlied@linux.ie
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200617224326.GE32604@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200617223455.GA2953201@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617223455.GA2953201@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Wed, Jun 17, 2020 at 04:34:55PM -0600, Rob Herring wrote:
> On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Cañuelo wrote:
> > Make the ports node optional, since there are some DTs that don't define
> > any ports for ti,tfp410.
> 
> Only arch/arm/boot/dts/dove-sbc-a510.dts AFAICT... It should be updated 
> IMO.

Agreed, but Ricardo wasn't sure how to update it. It would be nice if
someone with knowledge of the hardware could have a look.

By the way, this patch is dropped from v4 of the series.

> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > index 605831c1e836..1c9421eb80fa 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > @@ -83,7 +83,6 @@ properties:
> >  
> >  required:
> >    - compatible
> > -  - ports
> >  
> >  if:
> >    required:

-- 
Regards,

Laurent Pinchart
