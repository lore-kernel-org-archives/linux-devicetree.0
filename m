Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF19BC33CAC
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 11:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 827AC2080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580730791;
	bh=WXJ1vR0cnAE4GKnMrJIBMdbUmxp1MeclXVzQ6nYgQys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eCK7Go0kSpiVHFPM4HpthLzZutBpQ0fpSrJ3e9CPqbDfhStSwAukm+GfTyQ/B2ZfX
	 hCU2kb+yZYWCUyz1LzPfTazMjyvswaSy9Olgjql/HOFvAUlrdlSJNOkwUK0Qs/kbFN
	 dmFe1MxKYAL9nBdfDrVtB489pEf66Vgc4qxFK2B8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgBCLxK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 06:53:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35332 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgBCLxK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 06:53:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id b17so16645690wmb.0
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 03:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pgP8ReHnfqMyOtpv6kSRjmyrukP+cayKuF9fN47fWx0=;
        b=KmNZrw+R+kCg1UJ2J1yt4OrCPmJ4tb1ahWVvfWB8Uyy+onL2A+TQuzC2Ha5K9Y0QrJ
         jdYX37MewSmjm5pmAkf3O1J/RLuzB8jp9e3IQ75ArKqGKYVefOiui7VF/KZJazJF669U
         GkKK82Vfw70xjp0WSiaeDAPv4wJssMbYFmN6lJ6UGmUhD4B4jquVCu1S8bZOqxvf0pRS
         tUO97rhsPcCn2vBrZTBpkWoBv0kUCr3/NORJ2tK4KfEu6DBmJNkKESelN5F1FbHLNk0v
         JuMLaVUmUSdLUhG8l7KRNNC/ScBqN7odPNuPkqPFxu9WtQzhb1cElV6rZi2N3xtC4UC9
         zvSQ==
X-Gm-Message-State: APjAAAWMXHxTbgYl9TCOcLI2mXjIv9frsgBrotUpazm+gonDiaUrY6zy
        DOVlTtiV2snEt1xW4Se0kQcCaaPa3A==
X-Google-Smtp-Source: APXvYqwou6qPCS2uB6L31P/wztCMXG0JcP7REU8XApEjzGEQ+SlPydaQt7lSK0xTi6SszUmqIQRdkA==
X-Received: by 2002:a1c:9a84:: with SMTP id c126mr29520372wme.111.1580730788265;
        Mon, 03 Feb 2020 03:53:08 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id h10sm23186266wre.3.2020.02.03.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 03:53:07 -0800 (PST)
Received: (nullmailer pid 6708 invoked by uid 1000);
        Mon, 03 Feb 2020 11:53:06 -0000
Date:   Mon, 3 Feb 2020 11:53:06 +0000
From:   Rob Herring <robh@kernel.org>
To:     lijiazi <jqqlijiazi@gmail.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        lijiazi <lijiazi@xiaomi.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] of: Use enum instead of macro to define flag
Message-ID: <20200203115306.GA20133@bogus>
References: <00a5abf82a735ff0de442c28c25a60ff4b408a66.1579603361.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a5abf82a735ff0de442c28c25a60ff4b408a66.1579603361.git.lijiazi@xiaomi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 21, 2020 at 07:52:36PM +0800, lijiazi wrote:
> Use enum instead of macro to define device node flag.
> And it seems that no need start with 1, so let's start with 0.

Yes, the diff tells me all this. What's missing is why?

I assume this has something to do with the vsprintf changes? Is this a 
dependency?

On it's own, this seems like needless churn.

> 
> Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: lijiazi <lijiazi@xiaomi.com>

Need a full name here.

> ---
>  include/linux/of.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index c669c0a..b90936c0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -140,12 +140,14 @@ extern raw_spinlock_t devtree_lock;
>   * struct device_node flag descriptions
>   * (need to be visible even when !CONFIG_OF)
>   */
> -#define OF_DYNAMIC		1 /* (and properties) allocated via kmalloc */
> -#define OF_DETACHED		2 /* detached from the device tree */
> -#define OF_POPULATED		3 /* device already created */
> -#define OF_POPULATED_BUS	4 /* platform bus created for children */
> -#define OF_OVERLAY		5 /* allocated for an overlay */
> -#define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
> +enum of_device_node_flag {
> +	OF_DYNAMIC = 0,		/* (and properties) allocated via kmalloc */
> +	OF_DETACHED,		/* detached from the device tree */
> +	OF_POPULATED,		/* device already created */
> +	OF_POPULATED_BUS,	/* platform bus created for children */
> +	OF_OVERLAY,		/* allocated for an overlay */
> +	OF_OVERLAY_FREE_CSET,	/* in overlay cset being freed */
> +};
>  
>  #define OF_BAD_ADDR	((u64)-1)
>  
> -- 
> 2.7.4
> 
