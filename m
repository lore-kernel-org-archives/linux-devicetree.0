Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31838C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04C7F21883
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594684872;
	bh=6WGVHXSA1cTMUt/ea3dVR2JZLpaYDs3mLlCWQgV6WmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LMSG0rh/X8ua41fNpSsB5vhdjm2KM1z0sEM2uP1pK2ZWPveU/TOLAO/nDbtZu64qx
	 28ZWR1maQONT77jBVjsGJntp64cy/Drc8pomZXgqY33QdRfIOvEBxb5ehlTcnrPHuJ
	 3lPKiHBEsdtpN1WmRkj2mfBixOBrUIxsqvWrgzEw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgGNABL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 20:01:11 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42403 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGNABK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 20:01:10 -0400
Received: by mail-io1-f65.google.com with SMTP id c16so15448655ioi.9;
        Mon, 13 Jul 2020 17:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DfE+/eEhL/C/7mzzImUH7fr1V8lvgwK7gw/o36CiHCc=;
        b=F1qQucghlAwfj88Ur7gXskWYeLyTIVfbDpeQbgOQ6l5HwW0RiModiZ9rSYxTXv179f
         L3vUhkVNF4TLjBdCom2mlfQBxFgxd/sWIjez0Kea7GQqo0Dj5c7NQvsFO1MrxnJzf6D9
         QH1iEY602CQV1km3VkFC1/MRPyys4bpFazJib1DbiAmkdpcLPb2+/J2bQ8VOK2Gx5dpF
         h4kYZf3YU7wo01u7rvEN/ZyWDAfPt2CwZUc1oOWW9tg2sIhy+SdJEtDQbc+xSy5yxkkU
         tmroh52oKyNXH++35HoljKW6vcqfB6j6Dh2ptPSN2HmQH2B3vb5xrBI8Lx3+VDguX2wQ
         ZU9A==
X-Gm-Message-State: AOAM531N5QCciOdDnmrBbN/ceh5d0Xvw6wrKeVdIZ/K+gLYZmqhX6ZND
        k/W1UAN99RZvZgm5rETV0g==
X-Google-Smtp-Source: ABdhPJx85S/x+F+SaLcSc/V1TI9FIVxrAl7Lmv24/4MX7WwBWJmlqBWALzJD5lIWOPpaCnh7zneBNw==
X-Received: by 2002:a05:6638:e93:: with SMTP id p19mr2902688jas.67.1594684869852;
        Mon, 13 Jul 2020 17:01:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u65sm8228227iod.45.2020.07.13.17.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:01:09 -0700 (PDT)
Received: (nullmailer pid 964336 invoked by uid 1000);
        Tue, 14 Jul 2020 00:01:08 -0000
Date:   Mon, 13 Jul 2020 18:01:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets
 property
Message-ID: <20200714000108.GA964283@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 21 Jun 2020 03:47:32 +0300, Laurent Pinchart wrote:
> The resets property is used in DT sources in the kernel tree. Document
> it and make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
