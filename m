Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73CBC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 20:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A34A820702
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 20:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ygubjHAP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgF3Uu6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 16:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgF3Uu5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 16:50:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F9CC03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 13:50:57 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id o4so12223243lfi.7
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
        b=ygubjHAPA2xihW55H/lrsfxhJ7YRK+8V2z95+KKu23NmjT3r2C2ytcRIPxJCHV8vIV
         5EXZT2UMg41NZbHmJu/gu9o4UwlZQKtqE+1pr1uqr6XV8Bs9b68R+pCob0T+x+8ooIak
         hQ48b+wmyrx/DWhySyDYw9YqkbcWnwi2ZDehMnLWLyOSPSW1odzw4VHD6LfHytYjYicM
         guYmRaLhxZuEUU2sMI+jZJAprGcdQd0zhCa+2m8ablHEy1e0K9yjaSI1baAWjIjQcNa+
         vGvMjrPDDToArlSE86kxZg7RmxlkFywYtS+46fZ2U2WRuo/YmeIRQpVpDExjxu0ggUJX
         lESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
        b=R9mPHHRb2R1ygIe4J1epzvRUqoMrHwgHcZhVKAy9XN/JcYbKTpAvGmMTDlpAJW3zwe
         u49OQpYF3CwEAC6La3kMlk22BW42Li5yNIuXQKJo8xjrmz2WjZ1uQriMLXl6q5RQNEHi
         xtAbzQ1wNQLkvPF9POoowLKIiLZTy79+omtbbvQwAFqgQUVpVgpUOpgWDoEL6MMNTCyW
         h4EDDLRDiFwj978tYHlf8LL7ceXlwnWmhT2BXcpIQ5ClywCkUXl1hr2LGC3jLz0D92b3
         2EL45K6eHm7BTk+szopmS6cX5RjFqPsH9W6FiNTyVRASkIr70T3yHnOm/k1zXCTXW4qn
         xwbQ==
X-Gm-Message-State: AOAM532+pM8BRI2hRKrHM7JbU9N6svD2DNfYl6srJrD/wETlM8r0uefZ
        G/x3XQT5mw2aK88SMc1dtppbCQ==
X-Google-Smtp-Source: ABdhPJzECkfv/Dr04bhv1EGQNZ89O+WfwWATDN2K2b2mRDhSKfE+HFv2STbKXGDJdhAX+HsKGj3nhg==
X-Received: by 2002:a05:6512:10ca:: with SMTP id k10mr2279919lfg.177.1593550254384;
        Tue, 30 Jun 2020 13:50:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g2sm1222424ljj.90.2020.06.30.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:50:53 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:50:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: renesas,fcp: Add resets and
 iommus properties
Message-ID: <20200630205053.GC2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:29 +0300, Laurent Pinchart wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index eeca7e255420..b6cf2958e6c9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -31,14 +31,21 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  iommus:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>  
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - power-domains
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -53,5 +60,7 @@ examples:
>          reg = <0xfea2f000 0x200>;
>          clocks = <&cpg CPG_MOD 602>;
>          power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +        resets = <&cpg 602>;
> +        iommus = <&ipmmu_vi0 9>;
>      };
>  ...
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
