Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C716CC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93B1F227BF
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576793390;
	bh=wqMKQK4mw5tODaGVCgyksnod/0pmknI0fBsf9GXStxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LMvbfVRxQ/N8nWOe23GbEVfb+2GK0Ptpvrqhr9mmyNiAlsCIry4EvwHxC6meb+p31
	 lRffH9PLdUXnFH+4Yu0SMajW4EqfaGJpyBOPgr4I3iNj2kPT3DpGoA+7JIUg742S8Z
	 E4hEoOMcydHUXN3VpeDF2iZQXn2rdo9YrHgVQySo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfLSWJu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 17:09:50 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33666 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfLSWJu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 17:09:50 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so9110336otp.0;
        Thu, 19 Dec 2019 14:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U/RsU+PHhomGsnfo9Kn/8bLlHcdkcwPTofimyib2fkg=;
        b=BMLeNW0InQUQqfM/4MntTroiczI7RL2g2OkifXkRp6Uq414c9O/Qw1Y3M8t86qtwT8
         WD4U9KwM4vaqRF33qrWlV+XP7r9xyXGJ895Ku2ZhrvE0wqgQZsuQInnXT5N6Ak4C8j2n
         hBI26ckubhbKHHz5LNJEG+IV+8l7WUCIB10xeNLiCWMSIzYYxMWNBQ32TYtGZO/kXrrb
         wVnLHts6THkX1ShxgoH5POTVonXvaR8XHUCKT8g53jlDx7IczS3M8zugRyLHBjBv2cZk
         nB8T1y95TubAX50mXuvdithbPqFImp+UerhHHdGTTEvEgCc0scd7vxltpi3rvwg9wN1n
         zSBg==
X-Gm-Message-State: APjAAAV2ISqEYkpnPNbnWFebf46eHN7BYJYDyccihsPQ7w1mnFhg+dAG
        HTCYCDEUbL2djP47K/4imw==
X-Google-Smtp-Source: APXvYqw5FQ4e+aIqVsw74a4fj9fZYz5Nsy+tPvDT5b5N8G/g1Ad8B4kx9pwAtrDVKMSqRUmTsoVXSA==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr9925887otm.73.1576793389133;
        Thu, 19 Dec 2019 14:09:49 -0800 (PST)
Received: from localhost (ip-184-205-0-249.ftwttx.spcsdns.net. [184.205.0.249])
        by smtp.gmail.com with ESMTPSA id a17sm1700902otp.66.2019.12.19.14.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 14:09:48 -0800 (PST)
Date:   Thu, 19 Dec 2019 16:09:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 06/14] usb: devicetree: dwc3: Add max lane and lsm
Message-ID: <20191219220946.GA24304@bogus>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 11, 2019 at 06:49:37PM -0800, Thinh Nguyen wrote:
> Add a new property to set maximum number of lanes and transfer rated
> supported for DWC_usb32. By default, the driver will configure the
> controller to use dual-lane at 10Gbps.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 66780a47ad85..7da1c4e7d380 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -85,6 +85,10 @@ Optional properties:
>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> + - snps,maximum-lane-count: set to specify the number of lanes to use for
> +			DWC_usb32 and later. Default is dual-lanes.

Why do you need this? When is it not the number of lanes the phy has?

Reuse 'num-lanes' from PCI binding?

> + - snps,maximum-lsm: set to specify the lane speed mantissa to use in Gbps.
> + 			Default is 10Gbps for SuperSpeed Plus.

So the value is '10' or '10Gbps'. Other valid values?

>   - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
>  			only. Set this and rx-max-burst-prd to a valid,
>  			non-zero value 1-16 (DWC_usb31 programming guide
> -- 
> 2.11.0
> 
