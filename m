Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457F0CA9EC4
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 17:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 130A7204FD
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572369153;
	bh=q0eNIEx6A0rxe1rHT7LIJKaSACIBfngAmyTIWEJGPNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HEyVzfSuLawke5pZnBy0/Iituw/+2xggUdyLROwPFB1TphUuxtW8LyqkonMqOc/3d
	 tD3KcTHU5oGNDy6BHMEzeU5H6EvLabFLSXLTFwJVgbM50dpBg1J5u5OKzJWEFrNMeD
	 8xHIenlkH/aVR6+gPC+yyEZ30KtIVJsLc7DMIY7Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403779AbfJ2RM3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 13:12:29 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:39826 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390870AbfJ2RM2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 13:12:28 -0400
Received: by mail-oi1-f171.google.com with SMTP id v138so9583821oif.6;
        Tue, 29 Oct 2019 10:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fNM2UEnnNDrdLfT2bI3aJJfoKHNAkx3pECB9YdXiOiw=;
        b=j9PmG0VB34UD9j9FnnKPMatsBWZrEB71f5/heqmqWmbYor/wTU3iIKR1iQxLO+/5cJ
         gDWRS+LGlXorab69GEBbgKw0AbZGO6FoEy0lTq5IfHOEmYClo8lu+PndU3UhfGn6n9HB
         ZBWzqk7Htiqcz6vThMMRJ1WPe/q6tf1WOuCFr8tG1XLDMapix3HzypTSe66P/jgipMrr
         QCpWLaL93u05Pw1vxh5eEwRbIrzL789DBcOGRLpWdkbQLwsto/FrFiBSJRgnuy921ArL
         WDetfGQMAOBYTcXUwSQFzEnuAhEKp4f+Q5n6+SENppmS/wwIy21VjYU/LVoI21lt2WRe
         veJA==
X-Gm-Message-State: APjAAAWxTWpgpsNDoKtRuwr/1wpBEd7Fy1mIjljFZKlz6jn8TaAyibnR
        ycLh7+LRb4BDpR2C9bIEtg==
X-Google-Smtp-Source: APXvYqw0wGAUcfIn/tVYmeShtukBRHI9od8K/vH6/YwMErb1SV8d+MlQ35+4oUSu+PubXFiv9w2Xrg==
X-Received: by 2002:aca:3c86:: with SMTP id j128mr1343511oia.153.1572369146892;
        Tue, 29 Oct 2019 10:12:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm4986311otb.63.2019.10.29.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:12:26 -0700 (PDT)
Date:   Tue, 29 Oct 2019 12:12:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Cc:     vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        dan.j.williams@intel.com, michal.simek@xilinx.com,
        anirudha.sarangi@xilinx.com, nick.graumann@gmail.com,
        andrea.merello@gmail.com, appana.durga.rao@xilinx.com,
        mcgrof@kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: Re: [PATCH -next 2/6] dt-bindings: dmaengine: xilinx_dma: Fix
 formatting and style
Message-ID: <20191029171225.GA31221@bogus>
References: <1571763622-29281-1-git-send-email-radhey.shyam.pandey@xilinx.com>
 <1571763622-29281-3-git-send-email-radhey.shyam.pandey@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571763622-29281-3-git-send-email-radhey.shyam.pandey@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 22 Oct 2019 22:30:18 +0530, Radhey Shyam Pandey wrote:
> Trivial formatting(keep compatible string one per line, caps change etc).
> It doesn't modify the content of the binding.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> ---
> Changes since RFC:
> New patch. Trivial formatting (compatible string one per line) as
> suggested by Rob in MCDMA RFC series.
> ---
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
