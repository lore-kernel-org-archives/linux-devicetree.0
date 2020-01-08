Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF8DC33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44E7520692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578496792;
	bh=lQ7nTvf0VncBOxooWzt5qUXRBr+ZfxVkA4u6XTXqjDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gdeabForpuojKr5W0Nia4Jqg8RIwJZ5Uu6yBt57ayympGwsyjzWs1AuHKtsW9Fega
	 b1X6vFxd5Ood4cig312B1wSH87BDfYnJP/iDJTyhAqD3UIvSMlJiDrOYNwS4JWWzLZ
	 5CeJkD4sTSq+fxn/1fTAjZSZemPVkYZMN76gb2Ho=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgAHPTv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 10:19:51 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45919 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgAHPTv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 10:19:51 -0500
Received: by mail-ot1-f67.google.com with SMTP id 59so3860972otp.12
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 07:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m9q7NyF9bxvsGuJ+wYPNrRrtLEAkg6/rWpKgxYHTLfk=;
        b=S3kWS3fqMHw9uhb9EU+i4/nJ7CuT964UAOQc8S8Ac9pjX3Vl+LIh7OCzOhyRFgY3wH
         2xtWrVD9Z5Xo6VD1d+34MO/mH0Yk5I9mF4qEs6JxmE9X9HYlCUth5GTFw92uNayC14iG
         +a3aY4ImqgAueqOnxpyu6jCQksc09htuNnmFaiKHY5fyTLji/eBfhM3tq6ajnK69wYpi
         /EN55vHX6c3dhmmVInIy88pNMPTIAeNG5cF6ppQWj/ZOXGBt0BbxGJeojW01JB9HkMal
         JRZ10IcSVhX2Kw1cAVvekdS7Pa72Ev6bw71NZRqC7IwzYERewCl8OohxqR7C9HOcmcLY
         TrUA==
X-Gm-Message-State: APjAAAXLhEX44knctgwvL+ljyCOsOtDy9nSaGBwChtoGIa5gjex1C45L
        hoN/lwNIOU00kfo/pWVut8HIVis=
X-Google-Smtp-Source: APXvYqwlQT5EyDgoVCNPGgesjgRLBzjYVWScxpI7pJdtKrh3yK5PvfoYpkfOd8rOr33oz+oBwd8eTQ==
X-Received: by 2002:a05:6830:160c:: with SMTP id g12mr4376507otr.82.1578496789795;
        Wed, 08 Jan 2020 07:19:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s24sm1158371oic.31.2020.01.08.07.19.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:19:49 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 09:19:48 -0600
Date:   Wed, 8 Jan 2020 09:19:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 4/4] dt-bindings: usb: Add snps,consolidate-trbs &
 consolidate-trbs
Message-ID: <20200108151948.GA24992@bogus>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <2450178afa4e09b315402c64224b44b542363fc7.1576848504.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2450178afa4e09b315402c64224b44b542363fc7.1576848504.git.joglekar@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 20, 2019 at 07:10:24PM +0530, Tejas Joglekar wrote:
> This commit adds the documentation for consolidate-trbs, and
> snps,consolidate-trbs property. These when set enables the quirk for
> XHCI driver for consolidation of TRB's when small buffer sizes are
> scattered over the TRB cache not making up to MPS or total transfer size
> with Synopsys xHC.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 6 ++++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 66780a47ad85..9851da41a442 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -101,6 +101,12 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,consolidate-trbs: enable TRBs consolidation - host mode only. Set this
> +			to valid then for Synopsys xHC the TRBs would be
> +			consolidated to at least MPS in order to prevent the
> +			controller getting hang due to small buffer sizes which
> +			does not make up to MPS size or total transfer size
> +			across TRB cache.

Why not just always enable this?

Otherwise, this should be implied by the compatible string.

>  
>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 3f378951d624..be8d5e6a6333 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -43,6 +43,7 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - consolidate-trbs: indicate if you need to consolidate trbs
>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> -- 
> 2.11.0
> 
