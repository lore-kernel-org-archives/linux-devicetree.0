Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2A0C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A132E20810
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592433455;
	bh=/UaB+o/ziKRXfcGb24Jqg9Bvptn9+1rRn8vhhGb2SFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NgwyfsT5kBFtdYnTxG1ALQzvkeh+dReW3he3ao0gpJ1kybuF63UujnOkl6Ey6boVI
	 4gTRLVzBFqv1HZXcC0nVbs7mBbQ6kH6RoIni1kgR7B9C+N6zRmPALRUl85sbKxNN4q
	 dWBtkEWuEfq5Ogma0NXLPygFtkiXpCTOfr6ohnzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgFQWhf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:37:35 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33910 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgFQWhf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:37:35 -0400
Received: by mail-il1-f194.google.com with SMTP id x18so3960262ilp.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 15:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZpqmM5b2vnIEZM+uoBwaGezs/bIVuA8qCIC5e2tj4Mk=;
        b=odAd1d2M498/jjPe08PWr0c1GHtaQvuczQxTTEeeu8fntREEYUeJ5QsPIsqNuu0JAe
         3KB2u9QhVw5FK2/JngxvtmzLwl1XVs8uUx4HRf4V3NF5wTbTQCjtRH0LsecUeqeN5REH
         WSQZHDgoHbnkG3mfczdBxKf3EypY3yELcNOm3i3GoQbkZxmpnVjMOl35o7XfmMok/yJw
         KWhWVkPG0Jbr8wdQR3uoCAYzgBmlDBFmKcPruzhWj+z9Ccf6vPf3Xv5HRoWY9ZyllsBl
         +2YouWe6v8QZRcIxdw4lGIim8qs6SgqsY2XUb9jj8QNZCaxk5DoSaudZxAKa0nEEOeTC
         eHKg==
X-Gm-Message-State: AOAM532UHotr9DCQeexlvwWnlvCmdCXH//Y4BucYzzQ/fj7yQR/7fR+B
        4Ov80PpyCULciSgq2G/Hog==
X-Google-Smtp-Source: ABdhPJyAq5HXFt/cfdAiAR+bnOeSiQTllpHYl1CjJVPEXer5Qdf+2qJhDdxmi+THg3z+2BKJ3Mb/mA==
X-Received: by 2002:a92:190:: with SMTP id 138mr1144486ilb.5.1592433454005;
        Wed, 17 Jun 2020 15:37:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t5sm717751iov.53.2020.06.17.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:37:33 -0700 (PDT)
Received: (nullmailer pid 2965169 invoked by uid 1000);
        Wed, 17 Jun 2020 22:37:32 -0000
Date:   Wed, 17 Jun 2020 16:37:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200617223732.GB2953201@bogus>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200611160817.GA6031@pendragon.ideasonboard.com>
 <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 15, 2020 at 11:38:07AM +0200, Ricardo Cañuelo wrote:
> Hi Laurent,
> 
> Thanks for reviewing the patch
> 
> On Thu, 2020-06-11 at 19:08 +0300, Laurent Pinchart wrote:
> > Hi Ricardo,
> > 
> > Thank you for the patch.
> > 
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

I did? Must have missed some context.

> I understand both opinions but I just don't know which is the best option at
> this point.

Just leave the warning to be fixed.

Rob
