Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD5C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF52421883
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594684806;
	bh=Z9hkJnYlqlu6P0qKOgUaj9mS3xQtM/ZSfCcNxbchudU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TiGVA9NpM4eNwWFIXAohgQ0ctdz+IJhNJND6gJjTAR8h+Jvd7Bnhqy0O07ePthgTI
	 Ptub3trWHjonzlWdmNpesxf7EEVkuXy4ErRXfPih7UH0GFQzTJIZECtFQZoVFDe8tr
	 ol6u5r5Tc9ml10b1ms7yX8oNuXl+sLfavx4N2QTg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgGNAAF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 20:00:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35633 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNAAC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 20:00:02 -0400
Received: by mail-io1-f67.google.com with SMTP id v8so15466051iox.2;
        Mon, 13 Jul 2020 17:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r50jI5Epw0T7cDrBuYpNQc5/XyysqitF1Jq+t5e3lPY=;
        b=XHf7YTjqby859HUQh6tSj2nBjSGqHHuYmxP/H6QEbUjUqCG9JiYK+NLkdhnZ/4hwbl
         KEOItLyD10pg3U7rgsyE0ISKWfbdCKIbQf11zYUCaZvx7ii57rPYBRnVWxOZMRNnm4DN
         0yaeAXKBlkyGdmoF+3TUjPURp5X/prk18/d22/l/zDSblY9uPZ9b4D/xObkhEOE0Q4we
         mL1IL8iaRPsREc7jLLXS1zMPEWStJqrLGeYpr2KE1Uu+cPX1hQUGeuMHWdDxKuTnIfJi
         aaF7fdsoINBhv36xHz8RQTbE+hSsj/zd1PisCW6sjROgp32/YBHcu7oDO3vevDdPtSgJ
         uEWA==
X-Gm-Message-State: AOAM530kqn4jk0gvEdIqtRw0FWMZayaXrpx6lwrP+WmFYFdravJLGaEc
        GSC/R/aR09o5+bDjQUfrUxDAmfjJAECY
X-Google-Smtp-Source: ABdhPJxcHgRruhguDGNu6k2qR0/v1KiIrq65FIx7ah15DIRiQ3H45qmsicLZaH3RL4vu2TL7IsCS1A==
X-Received: by 2002:a02:6d1b:: with SMTP id m27mr2880785jac.129.1594684801021;
        Mon, 13 Jul 2020 17:00:01 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b21sm8375281ioc.36.2020.07.13.17.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:00:00 -0700 (PDT)
Received: (nullmailer pid 962515 invoked by uid 1000);
        Mon, 13 Jul 2020 23:59:59 -0000
Date:   Mon, 13 Jul 2020 17:59:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: media: renesas, fcp: Add resets and
 iommus properties
Message-ID: <20200713235959.GA962466@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 21 Jun 2020 03:47:29 +0300, Laurent Pinchart wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
