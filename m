Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE24C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A6852068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594655822;
	bh=SEBqvsM7mXZseePnytz7+cp2u35fQ/w6AWKqI+ro1r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c0Z0Xc2KMRIqNsl5dw/rXzknmdiHDXmAYh1WR0n0ZU0wKE9BHGOflpV8nWUL+iOwj
	 1c9hic1Iha9c3zQg/fBaKhggP2y738WlXwrFKT2FgclwjmaouJBd+V8LEfudToyER3
	 APTtNMZaCYOo4jfh6doHSHa9I0M0s/5V+QxUnOlE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbgGMP5C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 11:57:02 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40605 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbgGMP5B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 11:57:01 -0400
Received: by mail-io1-f68.google.com with SMTP id l17so2492506iok.7;
        Mon, 13 Jul 2020 08:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KoKKMla/uV6lVvThsKoY/n+C6PI/9y0lYfBZDiPoY0U=;
        b=Dpj9D6F2+FqX17G91nJL85jjiZueY7Gb6Q9rH4eLkuGWE5SlpJmyeIMMUN+ijaxhKx
         wMzSev6apVZ4Xg02z8/Cug18AzgWyI3hkn7bJMng7IE6xORKS/98TVcNM36Yz+cTPK22
         bT2IZAyZKxtBXOAu77DeyUV+1l8P4WF+lIG/jVEcdUefN8mbWVSUxzjBX+XC6iRK4xn/
         0cKCj8RHI1A/7RiIfJF+uMYjqs2OE0esVwGd/nyhnYQtdYfOlDOuIktFRmledXG79IGo
         2KA7Vyj4a1XscQzYkS0Oaf4VJ6l6gRBlZfN4oVfYGeCds7ulDkawpMXVvq1jq19u6U+a
         ge+A==
X-Gm-Message-State: AOAM530GC1t8G5zKoe9aMSUIye+qf4YdmpyJWO4I0WfDA8kPs1AAfO8T
        GA52E7ATcH3ixQDPBwfzjUs61wRFXw==
X-Google-Smtp-Source: ABdhPJy6ZF1zzn/oRtoonJVg75hjx+jd1g9/dP1spLHVHEPBWZBwLz9KyG2hWBSwr5/inTzCDDtR8A==
X-Received: by 2002:a6b:661a:: with SMTP id a26mr309367ioc.197.1594655821210;
        Mon, 13 Jul 2020 08:57:01 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s5sm8411068ilo.24.2020.07.13.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:57:00 -0700 (PDT)
Received: (nullmailer pid 289202 invoked by uid 1000);
        Mon, 13 Jul 2020 15:56:59 -0000
Date:   Mon, 13 Jul 2020 09:56:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        dongchun.zhu@mediatek.com, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: Re: [PATCH 2/2] dt-bindings: media: i2c: Document 'remote-endpoint'
Message-ID: <20200713155659.GA283117@bogus>
References: <20200618134045.151532-1-jacopo@jmondi.org>
 <20200618134045.151532-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618134045.151532-3-jacopo@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 18, 2020 at 03:40:45PM +0200, Jacopo Mondi wrote:
> Document the 'remote-endpoint' property and add it to the list of required
> endpoint properties in imx219 and ov8856 dt-schema binding files.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
>  Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
