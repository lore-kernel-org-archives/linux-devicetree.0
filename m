Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03253C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 20:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6273206D5
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588796185;
	bh=i5ET2Mm8LVW05VBaO5EgxbwDXu4RRZ6XtVChRQ9RkmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SkVZaRQj1fyXCphq8vqXRfE5FzZpzhPmi2YRmikVppVb2CxQmtk+er9eE3Iojagr4
	 gZm5ckRf5LY5v+4Y+p1NoBT3Epzmc1KPxwwoOqe5dMuTt6+9czR62TqQCTWfkfuXst
	 sYVvHsZVPboO5XeGFjS/Yu5T6WTX+AzyEs8JJ8jg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEFUQZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 16:16:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41839 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgEFUQZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 16:16:25 -0400
Received: by mail-oi1-f196.google.com with SMTP id 19so2952688oiy.8;
        Wed, 06 May 2020 13:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SHBfyTMcPIzuRWumH0aiBKSwCoZ1ueSmrKZkMQNhw6Y=;
        b=TNYSS793lv3Q+nMCtM2ZyTr4ASrsn/uWrtRV8RmStiUwbFntqB8KaxOLI4B8h6xMdX
         0kF/uOIuoDihOh9Aob6OuaVEymsGIddCrOtbfFWSaD2oi6S1A07l+0tf76hH/Poox/tx
         Zi7uQLJCdHHeQk2ihvzuGIZEvUkTXTlfYwO4Ft5mZf90RbqvZTZS4hqz88ORUPFxtA8v
         QurxuZHLTBblNz11fY656yaGnc8xWo+BlAPOQiJDiEOFlcNrxzhuC74qdXen0pNzbbmI
         8/S4k9WLocSzNGcQbcQMqXIBlmwzGzODuHtZ/49O7OApvWi67fvWfVpFysv8s/8OPdRo
         1aqQ==
X-Gm-Message-State: AGi0PuY/w53arhcCo7FBegKDX7bhk3fyxr0HmzcHLwTpFSScVvlsryke
        /YX4HvVkxdHeQUIauH9Aag==
X-Google-Smtp-Source: APiQypLX99PrQfl5EX6/W2oSYk8iNXplqPS1Zs80LJE7PJ0tmR+iBCnzfv4x9JAVYNDgm+y/l3bu0A==
X-Received: by 2002:a05:6808:8ed:: with SMTP id d13mr3880455oic.149.1588796184077;
        Wed, 06 May 2020 13:16:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d10sm792193otp.19.2020.05.06.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:16:23 -0700 (PDT)
Received: (nullmailer pid 24023 invoked by uid 1000);
        Wed, 06 May 2020 20:16:22 -0000
Date:   Wed, 6 May 2020 15:16:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG
 trb cache size quirk
Message-ID: <20200506201622.GA23227@bogus>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 21, 2020 at 03:18:09PM +0530, Tejas Joglekar wrote:
> This commit adds the documentation for sgl-trb-cache-size-quirk, and
> snps,sgl-trb-cache-size-quirk property. These when set enables the
> quirk for XHCI driver for consolidation of sg list into a temporary
> buffer when small buffer sizes are scattered over the sg list not
> making up to MPS or total transfer size within TRB cache size with
> Synopsys xHC.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>

The author and S-o-b emails don't match.

> ---
>  Changes in v2:
>  - Renamed the property
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 4 ++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 9946ff9ba735..6d0418ee4dbd 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -104,6 +104,10 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,sgl-trb-cache-size-quirk: enable sg list consolidation - host mode
> +			only. Set to use SG buffers of at least MPS size
> +			by consolidating smaller SG buffers list into a
> +			single buffer.
>  
>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 3f378951d624..14d900474894 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -43,6 +43,9 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - sgl-trb-cache-size-quirk: set if you need to consolidate sg list into a
> +    temporary buffer when small SG buffer sizes does not make upto MPS
> +    size or total transfer size across the TRB cache size.
>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> -- 
> 2.11.0
> 
