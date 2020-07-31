Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB28C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DC4208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596226907;
	bh=Redl61uZRuNF2+MYC0S6ZKG2g3Xg7R48v0ErMyM9D5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jtmJjwUQaK4lHd35F9VM24HuM6NhSlCpNDYgEaHvkbPJ4/N/AzznfGygOMcUiEXkP
	 eAbZ34ukXIW3bCH5EdrXzm59phX8g2ApsNMQN6xUZNJfRXN/zW0BDcV8cneYqCruOt
	 blMXsJI8XagEIMnwqO3J96OAXd/xGl5wQSNZSL0Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgGaUVr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 16:21:47 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42562 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaUVq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 16:21:46 -0400
Received: by mail-il1-f196.google.com with SMTP id i138so20450284ild.9;
        Fri, 31 Jul 2020 13:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wPKQMrSu6SrwiTmJxF1yx529zC5bYwghqKth9/BpG0I=;
        b=a4BgOEhYm/bn96E8hwWjCLXFTTyOXMVYWqVkmRTwGk38MvkFw440IPPauujN349wKU
         Ns+p4F2i8VMZlKgx8u2N3VMIQC+dgeeGLMon3mzT4WcoFCeSTgVHO4ruOgqJURnsIitm
         rymlcM0XB/ZhF4xKASoXzdznOqeamgH2X+jap5k2adRpTPXpRztlWBrWM+DuZWDwfaY9
         7gIZ9AI1MU8O+TNnVdYnZ4+XXLNBslVQu8A1Tz018XRO08h4QoUBHi28DVT+owtKiXLY
         KQbO9Tf3jDiu55KMhBHQVXR1daXkiJebKx6LOw1nGyL/A3CNlBci35dKosesRcGF4AFY
         8Waw==
X-Gm-Message-State: AOAM533zNY17ziUOwZhYJ1s6nlhrPuDZlXjhVLG9F4t7dBouuBeyabDx
        yUpTTzZPSZh8vWuT1iAW0w==
X-Google-Smtp-Source: ABdhPJzHXTn2ynX0uQxl+XB6A62isIcXXwVAM5y4pzlwGIE6kDD6K5VgZ+LIcMnnPq4UW1ncdGzsCA==
X-Received: by 2002:a92:8453:: with SMTP id l80mr5714564ild.83.1596226905749;
        Fri, 31 Jul 2020 13:21:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m184sm5018983ioa.12.2020.07.31.13.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:21:45 -0700 (PDT)
Received: (nullmailer pid 716083 invoked by uid 1000);
        Fri, 31 Jul 2020 20:21:43 -0000
Date:   Fri, 31 Jul 2020 14:21:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 06/12] usb: devicetree: Include USB SSP Gen X x Y
Message-ID: <20200731202143.GA715967@bogus>
References: <cover.1595727196.git.thinhn@synopsys.com>
 <3cf8c20044d15dfa5e5113b3a532054b4f96c13f.1595727196.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf8c20044d15dfa5e5113b3a532054b4f96c13f.1595727196.git.thinhn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 25 Jul 2020 18:36:32 -0700, Thinh Nguyen wrote:
> According to the USB 3.2 spec, a super-speed-plus device can operate at
> gen2x2, gen2x1, or gen1x2. If the USB controller device supports
> multiple lanes at different transfer rates, the user can specify the HW
> capability via these new speed strings:
> 
> "super-speed-plus-gen2x2"
> "super-speed-plus-gen2x1"
> "super-speed-plus-gen1x2"
> 
> If the argument is simply "super-speed-plus", USB controllers should
> default to their maximum transfer rate and number of lanes.
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
> Changes in v4:
> - None
> Changes in v3:
> - Use "maximum-speed" to include both the num-lane and transfer rate for SSP
> - Remove "num-lanes" and "lane-speed-mantissa-gbps" properties
> Changes in v2:
> - Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties
> 
>  Documentation/devicetree/bindings/usb/generic.txt | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
