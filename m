Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73988C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4724320780
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 02:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593482669;
	bh=SVQxPU4FKrHOentq7klPQS9GN+RnRhTmeYZhAhnpQkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=giVWv4ofSOVOQPK2fS7/xhM9AOeGc1xK3IUxnJYhin798ecRoMLEuLx0HyDcPq/x8
	 RgMTgZ8KmOdcVlP23rCELQIHI43OrKO6rmMMfInCxgJOivCklBZLBJdCCHYJ/EYodO
	 j1D9+OJ30gcnq8Sqx9PuEXVX2TWreydTop+cU9PI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgF3CE2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 22:04:28 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36577 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgF3CE2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 22:04:28 -0400
Received: by mail-il1-f196.google.com with SMTP id x9so16340639ila.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 19:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5aTkVLos9/xn9XRjNeZf+9N0nfWjIIzOFIYJ9XZTsZo=;
        b=Qt0XouLOZeXU7rUcROLGpjLgMS+ngjr57wp/5GWW7YjCDtn/l7ICt3bAEyTGn1CFmQ
         odhVKb+khiAdqVQlpe1bSwhrBgCMulrFiC3mRoLEHBSCZ1vtYSNR8YpCjwy4JgeLYVEa
         nrhhFa7M5Fbq3TlTy+czRiHRTcFh2+9OIDVMxztz9DJg5BNTSgvMNgPNJGK7mxpHp1kb
         FCckkTACJoRzR4bAVYx1V7iAaUmRh/9/WQBeLKmQ3GepdbEbeLunqPHQYyInhETHYoQG
         0RWd4RDp9h3iN+eBn5wDBeLb9yN8BUjna3YP47JFxwhs3IWKGyvUv1R13454OQGzbcQf
         da2g==
X-Gm-Message-State: AOAM531ovG6aP3FzPjCFbfPe2VEJCS4I08rCHC7t6CAZUNiC6vBwojQN
        P7SgEu/uSNdivUDQlbYO4Rp+69SvKA==
X-Google-Smtp-Source: ABdhPJwHq++7HOeuGQe//SVGz0kt42TZemyCS2hRllqraaE/nYvq7m40EaFxt+hsIx6QtI2Bxbfc7Q==
X-Received: by 2002:a92:6e11:: with SMTP id j17mr450408ilc.54.1593482667538;
        Mon, 29 Jun 2020 19:04:27 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id f9sm923162ilq.9.2020.06.29.19.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:04:27 -0700 (PDT)
Received: (nullmailer pid 3468570 invoked by uid 1000);
        Tue, 30 Jun 2020 02:04:25 -0000
Date:   Mon, 29 Jun 2020 20:04:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     maxime@cerno.tech, eric@anholt.net, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: vc4: dpi: Remove unneeded
 'simple-panel' property
Message-ID: <20200630020425.GA3467335@bogus>
References: <20200629221327.19885-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629221327.19885-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 29, 2020 at 07:13:26PM -0300, Fabio Estevam wrote:
> Remove the unneeded "simple-panel" property to fix the following warning
> seen with 'make dt_binding_check': 
> 
> Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml: panel: compatible: Additional items are not allowed ('simple-panel' was unexpected)
> Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml: panel: compatible: ['ontat,yx700wv03', 'simple-panel'] is too long

There's already a fix for this from Maxime which just removes the 
example as it doesn't add much value.

> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> index 58213c564e03..24119411b007 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> @@ -46,7 +46,7 @@ examples:
>      #include <dt-bindings/clock/bcm2835.h>
>  
>      panel: panel {
> -        compatible = "ontat,yx700wv03", "simple-panel";
> +        compatible = "ontat,yx700wv03";
>  
>          port {
>              panel_in: endpoint {
> -- 
> 2.17.1
> 
