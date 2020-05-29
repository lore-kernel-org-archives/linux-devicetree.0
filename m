Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94155C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 18:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 724E9206A4
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590775553;
	bh=r77XAoN5fd638oLmE3+GQc9P2h1ARPtV4kP03iQo/88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sv2EyUyBWS6ym1Foj1nM6ClI9+LTY4ouqUJm3FSBkbpck4IWvlkKo5JpWG5Mr5PZb
	 HFLP9aeDnRSccG2tn82RjWNludZPtWyVnywSli6cYH9VBpGaaxh8EZWsx2jYrwVNtM
	 Tz2ThRM4H37eEmNJDNYGMvVJahzUs/wSrLTOVnJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgE2SFw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 14:05:52 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35878 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgE2SFw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 14:05:52 -0400
Received: by mail-il1-f194.google.com with SMTP id 17so3405875ilj.3;
        Fri, 29 May 2020 11:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MPQeJvwFRTgbgwMrp+Kir/wUqqdjEZ7jsT2I5deov8=;
        b=mFuNDrjoT4CfSHAmDfhHzkIWZjcMaVWNQXE5oqDq+RrPbsOxQuDIHxpecsPas50lF5
         Cv3QcD8l7uRFa8DHrLsmswHre5KZ9Js4IPe1ip22ro8nkCJ46QsybsfPqE4nhVyUcz4M
         nPhVx+gn780t20ZF03P71kdDe/KEaetMvzcrOurlRDCUPBQ2O7XRTLwWzED24BQzslC8
         SZnGCZ6IokLeF3d/ZwMHTM9lmvNoWogDVmoHxK0wcOXHd4RLhAcUZeEcaSLoXehxhND0
         wChVQhboVV8GsmAKgPbAy5T4VD63mMzeNhyRcPaaGRkN3o6EW351Hgg0YLBj0o3wNRyc
         bDCA==
X-Gm-Message-State: AOAM533+0QcGaFjLFa5KkSZ1KiFH0zDc+6bzlABOETmbpQWzafv5xs/A
        mEytbZilI9kEJPtrmZGx4g==
X-Google-Smtp-Source: ABdhPJzv0a953fnw5nmavyZAUFL9HJTvVrPtcJWDLGyQzSHQIuiZm4yg096cKyrTDUX96bx+f0I/7A==
X-Received: by 2002:a92:a1d1:: with SMTP id b78mr4067029ill.164.1590775551476;
        Fri, 29 May 2020 11:05:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r17sm5288597ilc.33.2020.05.29.11.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:05:50 -0700 (PDT)
Received: (nullmailer pid 2671061 invoked by uid 1000);
        Fri, 29 May 2020 18:05:50 -0000
Date:   Fri, 29 May 2020 12:05:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Add documentation for SG trb
 cache size quirk
Message-ID: <20200529180550.GA2665183@bogus>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <d91b768b3827fce611ba052aa1bcca19ac09fd75.1590415123.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d91b768b3827fce611ba052aa1bcca19ac09fd75.1590415123.git.joglekar@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 27, 2020 at 04:10:55PM +0530, Tejas Joglekar wrote:
> This commit adds the documentation for sgl-trb-cache-size-quirk, and
> snps,sgl-trb-cache-size-quirk property. These when set enables the
> quirk for XHCI driver for consolidation of sg list into a temporary
> buffer when small buffer sizes are scattered over the sg list not
> making up to MPS or total transfer size within TRB cache size with
> Synopsys xHC.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 4 ++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index d03edf9d3935..0fcbaa51f66e 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -102,6 +102,10 @@ Optional properties:
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
> index dc025f126d71..c53eb19ae67e 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -44,6 +44,9 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - sgl-trb-cache-size-quirk: set if you need to consolidate sg list into a
> +    temporary buffer when small SG buffer sizes does not make upto MPS
> +    size or total transfer size across the TRB cache size.

Still don't understand why you have 2 properties? Is this a generic 
issue for multiple XHCI controllers? If yes, you don't need the first 
one. If no, then you don't need the second one.

Really, I'd prefer neither, and this should be implied by a specific 
compatible string. Having a separate property doesn't work if you find 
this issue later on after already adding XHCI support. IOW, don't make 
users update their DT to handle a quirk.

Rob
