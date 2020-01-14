Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5FBC33CB2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCF5524672
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579025721;
	bh=ByaNJKCgek99Dwuc8WcR2GybN9NUZcgpiS+ahOxmjIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dwCvm6ZY+8OwELb4zKo42QIuFUCaIX9O34Ne2fQ0l0irwnUxXxsd6kiXZHfbsMlAx
	 TNJWoVTh2ce//ADrx9VUWBU11r6DHIcyprHNZ83DHhzCcqNLBAXFcJu6dz3eR4dZHR
	 p8JHIDBpZksArw5oORUXKihOihDnJ3kLeXRVtWDQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgANSPV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 13:15:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46792 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbgANSPR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 13:15:17 -0500
Received: by mail-oi1-f196.google.com with SMTP id 13so12700716oij.13
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 10:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5LSZFhjvkBvH4Jm+XH1uoBzxnQKONQoyfsFilqe6/1E=;
        b=VNle4rG+x6iilrGTXghrxwykmAO+ELusRxnvBrtW/t1HJUw3eak6dDI/SUhiTaLhGc
         wakKiKg+ol629PcnXPfsoUboZDxk6PgX4OuYBaB5HBw6A8wEGcanvpVF8Gvb3UMX7lAn
         g04GCwI1dMlsiO9BlDyEBMaQefn1IKEjwRFc3yV11JhT+SbX68ER4eY8rCk4fJn7kLOp
         TN3P9zHOjRyAj5EGdEqlACWX82ssnyskux7DjjTjDN5WBBlKs7wkTH3rSaX7Db2nldav
         9slw4/cj1OyOFUxf47RWTQNT5maQMva7W6d2kql+Z/3SPEhn/VqUrJgB0lQGFV2K+0gR
         pQCw==
X-Gm-Message-State: APjAAAVl6UMNohl0+zLkmP0dSNTFDFa3RM10BBNZLacxPikeiQP3pdbm
        iNczaZtcnsd7UyL61WQASoSqouI=
X-Google-Smtp-Source: APXvYqxd5xLcvyKHc0roebwqVjqKo2LCsBvgezPPe5r09zsNKrhZd4y9wHClQW1UzasUYmro/Za6ZA==
X-Received: by 2002:a05:6808:8d5:: with SMTP id k21mr18263225oij.121.1579025716461;
        Tue, 14 Jan 2020 10:15:16 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z17sm4798433oib.3.2020.01.14.10.15.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 10:15:15 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22090b
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 12:15:14 -0600
Date:   Tue, 14 Jan 2020 12:15:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Beniamin Bia <beniamin.bia@analog.com>
Cc:     linux-iio@vger.kernel.org, Michael.Hennerich@analog.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        biabeniamin@outlook.com, knaack.h@gmx.de, lars@metafoo.de,
        robh@kernel.org, Jonathan.Cameron@huawei.com,
        Beniamin Bia <beniamin.bia@analog.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: ad7606: Fix wrong maxItems value
Message-ID: <20200114181514.GA4529@bogus>
References: <20200114132401.14117-1-beniamin.bia@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114132401.14117-1-beniamin.bia@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 14 Jan 2020 15:24:01 +0200, Beniamin Bia wrote:
> This patch set the correct value for oversampling maxItems. In the
> original example, appears 3 items for oversampling while the maxItems
> is set to 1, this patch fixes those issues.
> 
> Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation to yaml")
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
