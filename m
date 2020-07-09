Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E41C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 19:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2731A20775
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 19:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRu13Z0E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgGIT30 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 15:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgGIT30 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 15:29:26 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D389C08C5DD
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 12:29:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z5so1404464pgb.6
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x/U7Hyj1lkNWWpCKmP6FeJ+27MCr9OUMUAFO2UtX4yg=;
        b=eRu13Z0EkubMZlrKLPOJ7ZH9Fg6zy17jy5Vh09YLC/MQc9/t1N/M30Y5gmmdqqxr/E
         M8gLt+vonkUwcckkl84RgJf5wGq1TAiQIX9pUTQKuN5wU/0Pn7s8CGluxJbWx2sJujVY
         dcWCt0VkHhoTgydMDFu3FQZRJVYelVsdkZySZWRdk4NjQocply0RMyTrnpyTk5RAhrJV
         XG1bpymGRsL2i4yE31mQizwHmQhj7qB/XoGVVNEn/QZF0nHUovbceCsBBMLF/RA7I8va
         3aywPIJXwNzKKvdQcnX0aD/PyNpjlv8US7ALyLRqtCidzmhTpNaiHssResHno3Zc/VMo
         +/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x/U7Hyj1lkNWWpCKmP6FeJ+27MCr9OUMUAFO2UtX4yg=;
        b=dO45Xs/nlNs6cSF89HpzStA37/QdYnt+4JqPKHVgALU0FHV0AorqOdNsnUEgWikquD
         hq2tfw3MoHmMH+VURHrr9h/g06k7N7c/zOnIEnHAwUQ4P8x4NZGpvti1DYGYb4eVDniM
         YdDnhxYf2eDl8d4TF8RCc5crrohW5JDtEQRnv3dLjnZ9VlRUuhcSyCpD/fX4LH/txVty
         bER3eRayyyDOggBclxnaUf+FpWffo992J+f7CRnpSb56XmTQTraRLCMhSKegk0gw6O8+
         1M9mVLPUIbpfycnS9FofuIw6VbGbvVUyxbMnHRjnt701n25qSqnSmBp+JzIA+QwKCEBJ
         hddQ==
X-Gm-Message-State: AOAM530i9bmLnDR4GJoKHWTjyaIBbrfMjT4jNxsy5fR9WyEdQl43lEL0
        6b410ZSFgYW9j61dHCkrO2c89w==
X-Google-Smtp-Source: ABdhPJxRNWYbm4rzHtO99C40tFaWJAzQnnLjDsK2WcWD1ygXWJHbVEj61vEYDNgrc1iu404itWFSIg==
X-Received: by 2002:a65:4349:: with SMTP id k9mr30627877pgq.404.1594322965775;
        Thu, 09 Jul 2020 12:29:25 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u26sm3428393pfn.54.2020.07.09.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:29:25 -0700 (PDT)
Date:   Thu, 9 Jul 2020 13:29:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] remoteproc: k3-r5: Initialize TCM memories for ECC
Message-ID: <20200709192923.GB948668@xps15>
References: <20200630024922.32491-1-s-anna@ti.com>
 <20200630024922.32491-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630024922.32491-4-s-anna@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 29, 2020 at 09:49:21PM -0500, Suman Anna wrote:
> The R5F processors on K3 SoCs all have two TCMs (ATCM and BTCM) that
> support 32-bit ECC. The TCMs are typically loaded with some boot-up
> code to initialize the R5 MPUs to further execute code out of DDR.
> The ECC for the TCMs is enabled by default on K3 SoCs due to internal
> default tie-off values, but the TCM memories are not initialized on
> device power up. Any read access without the corresponding TCM memory
> location initialized will generate an ECC error, and any such access
> from a A72 or A53 core will trigger a SError.
> 
> So, zero initialize both the TCM memories before loading any firmware
> onto a R5F in remoteproc mode. Any R5F booted from U-Boot/SPL would
> require a similar initialization in the bootloader. Note that both
> the TCMs are initialized unconditionally as the TCM enable config bits
> only manage the access and visibility from R5.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2:
>  - Fixed the logic of initializing TCMs even when the resets deassertion
>    failed
>  - Dropped the confusing last sentence from the 2nd paragraph of the
>    patch description
>  - Revised the patch title to move away from remoteproc/k3-r5
>  - Dropped Mathieu's Acked-by because of the changes
> v1: https://patchwork.kernel.org/patch/11456371/
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index c4f99e59dc2f..aca0eaf42a38 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -363,11 +363,24 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>  
>  	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ?
>  		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
>  			ret);
> +		return ret;
> +	}
>  
> -	return ret;
> +	/*
> +	 * Zero out both TCMs unconditionally (access from v8 Arm core is not
> +	 * affected by ATCM & BTCM enable configuration values) so that ECC
> +	 * can be effective on all TCM addresses.
> +	 */
> +	dev_dbg(dev, "zeroing out ATCM memory\n");
> +	memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
> +
> +	dev_dbg(dev, "zeroing out BTCM memory\n");
> +	memset(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
> +
> +	return 0;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  }
>  
>  /*
> -- 
> 2.26.0
> 
