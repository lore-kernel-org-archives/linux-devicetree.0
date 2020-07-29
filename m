Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61447C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CD8320809
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 17:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LykoZLGI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2RVB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 13:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgG2RVB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 13:21:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1B0C0619D2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 10:21:01 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so13264981pfm.4
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RkhmVmn+F8zZR3MXN6wM+ixzJP6uusXl8abDcaadbwU=;
        b=LykoZLGIweffexQ73NX4n24tMeVD1jxrVEhBFJdBzix3ieNIhRJ1UyAW2pW9Xdc6Dd
         +T4eZ8jXk9fGCOP3GjK/h9dTk9cRzBH9ZARUErXgO7WCIRjN5z9dJu3Smaps7hgACjS4
         17VDpJ+EICAYp1oBGgmLp3aHiR6vfBiz686B/12/P5/yoOLRxFRhwyVPzowlRukVAVuN
         8k0+DWeyk5EvjcRrjsQE6/hA3qY8SGfBBfOd53gR4i2ZqHrp0/g1s6JwMpxyh77i6rqE
         j/vlvZj51WYAmbYXW9+Cu1ovFP6kdt+lU6uMfD8fdFRm1kAeE4xZwo4G3iNGEIlxH2B9
         7s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RkhmVmn+F8zZR3MXN6wM+ixzJP6uusXl8abDcaadbwU=;
        b=BXpclzUFP/9beulyELawoM+uUTA+CexDCSBU2LbeZD2qxGFqWj9DabhVBhhGcrfiGJ
         Wwyt5StvLqECmZijy46b0tbIB0w8TD4OzcdtZY/ZrJgiq20hlrUbsVMkNSxHLGU1jfFs
         tyqmtiAd11DeHx4HJcXRM8Fz0Qx5oAVKFyiqS+0DPeoi01OsrgBn8prQATwGYFPW6WOY
         rGT4mBei+FInl7OXIrPX127IllCKVIEx/9TGNiOnGObGVQ6znNXF+/zxfrw/bXHTMfVB
         3C/m+LtjXai7IyK3fIn5A/1INcpVCA4y07S0oqEN/I12ILfwK9jg5xAsSI7HPhWjUXp5
         I7eQ==
X-Gm-Message-State: AOAM530wWSLGF48TkimxvRpbUlC7tDHFlcSgtgg4hrCywmNrE+9WasfN
        q/GKqvz73qOEHOa/XWNs2fR69g==
X-Google-Smtp-Source: ABdhPJzYsG6bJfs+OjDq/bcVUSUtHseUIVoDgm8UZLKpJ5a7m2X7FhMkTfYyTY/cwe3oMahk3ykPTw==
X-Received: by 2002:a63:3c09:: with SMTP id j9mr30423593pga.206.1596043260739;
        Wed, 29 Jul 2020 10:21:00 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j11sm2950518pfn.38.2020.07.29.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 10:21:00 -0700 (PDT)
Date:   Wed, 29 Jul 2020 11:20:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mike.leach@linaro.org, coresight@lists.linaro.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 14/14] dts: bindings: coresight: ETMv4.4 system
 register access only units
Message-ID: <20200729172058.GA3060370@xps15>
References: <20200722172040.1299289-1-suzuki.poulose@arm.com>
 <20200722172040.1299289-15-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722172040.1299289-15-suzuki.poulose@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 22, 2020 at 06:20:40PM +0100, Suzuki K Poulose wrote:
> Document the bindings for ETMv4.4 and later with only system register
> access.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index d711676b4a51..cfe47bdda728 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -34,9 +34,13 @@ its hardware characteristcs.
>  					Program Flow Trace Macrocell:
>  			"arm,coresight-etm3x", "arm,primecell";
>  
> -		- Embedded Trace Macrocell (version 4.x):
> +		- Embedded Trace Macrocell (version 4.x), with memory mapped access.
>  			"arm,coresight-etm4x", "arm,primecell";
>  
> +		- Embedded Trace Macrocell (version 4.4 and later) with system
> +		  register access only.
> +			"arm,coresight-etm-v4.4";

I would rather call this "arm,coresight-etm-v4.4+" so that the binding's
semantic is still relevant when dealing with ETM v4.5 and onward. 

Thanks,
Mathieu

> +
>  		- Coresight programmable Replicator :
>  			"arm,coresight-dynamic-replicator", "arm,primecell";
>  
> -- 
> 2.24.1
> 
