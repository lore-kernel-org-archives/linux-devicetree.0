Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D3EC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 17:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBCAF2080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592242533;
	bh=vXGquYxK0P69MvJ2UUsi8bv6LfZSIpAfP0EzfruFDVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vMPpG6ElZ6v1FKF+C8DgunWUqUPK6Holdm9MCOQXq93CntBwzFZXQAty0tkKyD/f5
	 oArZxGGzvU9F/5M2Fu8DLtJ6IPK79Tv2og8vK4Je5cywo54d+v48CofQXrGqVxB4o4
	 Lj17HZRkffoji+4e8er7TwummWjPZmUpUAWBHqYM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgFORfd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 13:35:33 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46635 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgFORfd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 13:35:33 -0400
Received: by mail-io1-f67.google.com with SMTP id t9so18802831ioj.13
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 10:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1JiCuZIwRbQkXmLhUt7LtNnEibrkpGANtdOy2K9pN/A=;
        b=QeD0f0LkCq4g8kmJNFA9KvfPP0ZV5KL0cZ57P9nV1ApGHHGVBEoh0e4z/l03CKB0WS
         CViU64lBUlGcvqKXU1tnqTV/ZPE2Livb607NXceaN35Q9KbsD7SfQAt4aE3Tv7Odevcc
         Jj2dVqiiepyc3hAATL/0eKNIoAYMXqWMIOZeySa29u0Vtqrmi2lpA4HypYJ4E3ntdi64
         6zE77hc2z0VZUeUMBL2qfVYTwZPsA3NYHZdZnwbMrF/z5i1Fwx9/RANR5eB7MPnYLKAp
         38HNbTCsPqp2TKN6oU9pHQB7/7OqnTX/Ah2i/Ca9w86Gd1b0kAW7N8XuJGGqAnaqygts
         C8tg==
X-Gm-Message-State: AOAM533nk1phM7SvLgMsvay3qzAaF05VNC+8MqQO0KHS7YLS2TuEF62Z
        wX5+mF18V9f0ybf0l8mbyA==
X-Google-Smtp-Source: ABdhPJzmcCoxavzPmy5alBS5FHSzUeC93JuwlINmuFrp1yRWunDiT9BIk4RqZaXq2VXnwXR00TbBwA==
X-Received: by 2002:a6b:39d7:: with SMTP id g206mr29016266ioa.31.1592242532219;
        Mon, 15 Jun 2020 10:35:32 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f22sm8284533iob.18.2020.06.15.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:35:31 -0700 (PDT)
Received: (nullmailer pid 2007945 invoked by uid 1000);
        Mon, 15 Jun 2020 17:35:30 -0000
Date:   Mon, 15 Jun 2020 11:35:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     broonie@kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for
 MAX98360A
Message-ID: <20200615173530.GB2006513@bogus>
References: <20200605034931.107713-1-tzungbi@google.com>
 <20200605034931.107713-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605034931.107713-3-tzungbi@google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 05, 2020 at 11:49:31AM +0800, Tzung-Bi Shih wrote:
> Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
> Adds compatible string "maxim,max98360a" for driver reuse.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
> index 4bce14ce806f..75db84d06240 100644
> --- a/Documentation/devicetree/bindings/sound/max98357a.txt
> +++ b/Documentation/devicetree/bindings/sound/max98357a.txt
> @@ -1,9 +1,10 @@
> -Maxim MAX98357A audio DAC
> +Maxim MAX98357A/MAX98360A audio DAC
>  
> -This node models the Maxim MAX98357A DAC.
> +This node models the Maxim MAX98357A/MAX98360A DAC.
>  
>  Required properties:
> -- compatible   : "maxim,max98357a"
> +- compatible   : "maxim,max98357a" for MAX98357A.
> +                 "maxim,max98360a" for MAX98360A.
>  
>  Optional properties:
>  - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
> @@ -20,3 +21,8 @@ max98357a {
>  	compatible = "maxim,max98357a";
>  	sdmode-gpios = <&qcom_pinmux 25 0>;
>  };
> +
> +max98360a {
> +	compatible = "maxim,max98360a";
> +	sdmode-gpios = <&qcom_pinmux 25 0>;
> +};

Nothing new here, you don't need another example.

> -- 
> 2.27.0.278.ge193c7cf3a9-goog
> 
