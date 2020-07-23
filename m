Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3025C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 20:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7F9206E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595536180;
	bh=BEIghVSpfj4pej4m+Awv91V5gV084MRDhlrjU5+4m+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kJJT2Zzy3wg5RHhkPWOVeWfwr4lEQbPC2/3YxATIerwrjmqb+982Ww44o3FaC+Nuz
	 vn6c3r8WtiUBoO5Gg7PZ3VZKgcY8qabSg/COroesxrOJOuAM66pFx7YaN7to9BYzDg
	 P7KGOORsCw3DQxvAe4NfZMOjsOQj4oMoXYteyiE0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgGWU3k (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 16:29:40 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42886 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgGWU3j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 16:29:39 -0400
Received: by mail-il1-f193.google.com with SMTP id t27so5427243ill.9;
        Thu, 23 Jul 2020 13:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kjud4HzJiYuJbrWHJZPLLkD9nUbndPaEbp8Lk6hPciw=;
        b=D0yQXu4P4yhZWQHAyEJqPnO6BgsAY0UgmEX/26UkR1A7qR7enEWcRFaVWNrlcvjMOs
         XypNRJJ6eiSQtZqA0+pXqXgZ1R+PbNPhb2xW0ebdZ1bba/ABJjVHbljwsrxFJGbYuJsq
         /ogpFDEmRca1zieuTKeYn8XeGi70e5UPEacGS1US+J8YiazqV0aDsaFczE68V1B9mxtz
         uaIDAjyOl/N9e6TzPU5Lt0E7JBPAZxgx6Zz3Dbz77VXSVDmDixnYx3cRUaI15gPSNdYC
         u8xFs4pC8xI5rD4JtU41kr7z7GP2Tucemd/xSQLVgJDveGEzFB6OPfFnvW/L8G/Di7S3
         3u7g==
X-Gm-Message-State: AOAM531ExblBZCa9HWLjSIqj/ZfMV1WuNXw6Ru5JIJnT1fTKVHsE0u59
        gTHq2xFNlgINTBczrNoJRA==
X-Google-Smtp-Source: ABdhPJyVRyKvIrX21z4Zl2OJ4Xp53IgxAGPYZ3HN3G0+kSgHj7Uy5uc1dGpt8JJf6bR/XReMP27Prw==
X-Received: by 2002:a92:dc09:: with SMTP id t9mr6938082iln.226.1595536178724;
        Thu, 23 Jul 2020 13:29:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w15sm2030713ior.4.2020.07.23.13.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 13:29:37 -0700 (PDT)
Received: (nullmailer pid 808938 invoked by uid 1000);
        Thu, 23 Jul 2020 20:29:36 -0000
Date:   Thu, 23 Jul 2020 14:29:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 06/12] usb: devicetree: Introduce num-lanes and lsm
Message-ID: <20200723202936.GA801155@bogus>
References: <cover.1595468673.git.thinhn@synopsys.com>
 <d605a437f0a4bc837a05269caaa3875c2e0b29d8.1595468673.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d605a437f0a4bc837a05269caaa3875c2e0b29d8.1595468673.git.thinhn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 22, 2020 at 07:12:39PM -0700, Thinh Nguyen wrote:
> According to USB 3.2 spec, a super-speed-plus device can operate at
> gen2x2, gen2x1, or gen1x2. Introduce "num-lanes" and
> "lane-speed-mantissa-gbps" properties for devices operating in
> super-speed-plus. If the USB controller device supports multiple lanes
> at different transfer rate, the user can specify the HW capability via
> these properties.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
> Changes in v2:
> - Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties
> 
>  Documentation/devicetree/bindings/usb/generic.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> index ba472e7aefc9..a8253da684af 100644
> --- a/Documentation/devicetree/bindings/usb/generic.txt
> +++ b/Documentation/devicetree/bindings/usb/generic.txt
> @@ -7,6 +7,17 @@ Optional properties:
>  			"low-speed". In case this isn't passed via DT, USB
>  			controllers should default to their maximum HW
>  			capability.
> + - num-lanes: tells USB controllers that we want to work up to a certain number
> +			of lanes. Valid arguments are 1 or 2. Apply if the
> +			maximum-speed is super-speed-plus. In case this isn't
> +			passed via DT, the USB controllers should default to
> +			their maximum HW capability.
> + - lane-speed-mantissa-gbps: tells USB controllers that we want the symmetric
> +			lanes to operate up to a certain rate in Gbps. Valid
> +			inputs are 5 or 10 (i.e. Gen 1/Gen 2 transfer rate).
> +			Apply if the maximum-speed is super-speed-plus. In case
> +			this isn't passed via DT, the USB controllers should
> +			default to their maximum HW capability.

This still leaves 'maximum-speed = "super-speed-plus"' ambiguous. Fix 
that please.

To put it another way, we already have one way to define USB speeds. 
Don't define a new and different way that only covers a fraction of the 
possibilities.

Rob
