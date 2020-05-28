Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D9C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75BD20814
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590678824;
	bh=i5wJB+K4nZbGuf4w7idHX+09szEEGPjGPv3q1xLVWJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FoL7Cgz1rYeVB4oJtEA5Lduz1JQ4lQLgr2sDNaF3qAK9le3054H25fDaogwZW9/k4
	 Jl22wqvue/9GSeo1SmYv721cFLsdYzgaHr2kXq+6dYJvJiDjKuNgFr24arkBsusJv8
	 fpT0r9IKuVsJfFO2ePO1pHZydNyAQx3HhVYYWSZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404135AbgE1PNm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 11:13:42 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40969 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404206AbgE1PNg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 11:13:36 -0400
Received: by mail-il1-f193.google.com with SMTP id d1so456721ila.8
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 08:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vgkKnqmdXddKK+S+wsut0vxIkGzIa7iZR1isP7Df9rI=;
        b=AndtjPmT4FH6SKFmbEQ5cxA6O9B5klrDaWxLqFrYVIlO52yWrJzJ9IPN0qtZsXBwIU
         n5uD50rpYRcwaRZhA0hXXG674w/yZtxWx7+bvI61FFUjNn1baPUpFarx8mBgrCIAaLba
         V4oBbaGZEpLAq0HAhvw1Z44AfL5IWRCKrvhdqtvpKvZxx0qcV6YOnFPb5hID6La/sLQr
         ACzfLsoqzkHEXGCM1vIDAlxz1fQtAT0Sg7D42rb5/ekva1a5sGXSUmmpKzKKnZ8r5XdP
         5igUwI+wHg6UKKWRrkwUrOl7zxheGFyjsvzg1VhBowmp0CjPAxxWbomiF6vGpxpFOdcV
         h/hA==
X-Gm-Message-State: AOAM530+5dmzXEhXWd2IekoUqrgzVKILlxxSx9YE1up4UAGTByewLWaC
        oyt0Xw+O3Wd9rg+kKqf9ww==
X-Google-Smtp-Source: ABdhPJzqqUOlROE6QNgLDNsYLJE7mDKFz+Rj/PCMmRAgmYWBZ0pIHza6Yt12DxC/pBZV9DVcY7uGfA==
X-Received: by 2002:a92:da52:: with SMTP id p18mr3320934ilq.173.1590678814533;
        Thu, 28 May 2020 08:13:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g4sm3279566ilj.45.2020.05.28.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:13:33 -0700 (PDT)
Received: (nullmailer pid 80747 invoked by uid 1000);
        Thu, 28 May 2020 15:13:32 -0000
Date:   Thu, 28 May 2020 09:13:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        enric.balletbo@collabora.com, kernel@collabora.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200528151332.GA80583@bogus>
References: <20200514101235.7290-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514101235.7290-1-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 14 May 2020 12:12:35 +0200, Ricardo Cañuelo wrote:
> This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> definitions and descriptions were expanded, apart from that it's a
> direct translation from the original binding.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes in v4:
>   - Make interrupts and gpios optional (Enric Balletbo)
>   - Make hpd-gpios deprecated (Rob Herring)
>   - Remove maxItems from dvdd10-supply
> 
> Changes in v3 (suggested by Sam Ravnborg):
>   - Rename example node i2c0 to i2c.
> 
> Changes in v2 (suggested by Enric Balletbo):
>   - File name change: use full compatible string.
>   - Binding description removed.
>   - #address-cells and #size-cells properties removed from ports node.
>   - Example node renamed: anx7814 -> bridge.
> 
> Tested with:
> make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>
> make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>
> 
>  .../display/bridge/analogix,anx7814.yaml      | 119 ++++++++++++++++++
>  .../bindings/display/bridge/anx7814.txt       |  42 -------
>  2 files changed, 119 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7814.txt
> 

Applied, thanks!
