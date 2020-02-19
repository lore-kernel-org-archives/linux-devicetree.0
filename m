Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D1DC5ACC4
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 22:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81D4A24670
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582150835;
	bh=j/kDchP7t9DXAdwc9IHiI7B1syUba3MpJi/hktTSLQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RDs+LZDa1BNPh09kcx3zNEhv91BQBBA9qQDUctlFYyivtlf+qCscLwlLq7/lNj99l
	 h64vL5RZ7kpOpib/Ea3D154hPEX6h4MNUUrrE3phhMm+jvtkfNwKeZrifoszHSVPMF
	 HgiKHnFNyBHtuI9Gf0rcqaJwicOelysMgRJuH/GA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgBSWUf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 17:20:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46825 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSWUf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 17:20:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id a22so25456249oid.13;
        Wed, 19 Feb 2020 14:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iip05+wmNV/hSoOFaUFJkyHAnC9zAQqJnti8cfv1Pfc=;
        b=VHDpxUr+zJPHzhY7YzyzHa5nZb25N06QpKm8sYe0urTMh6rxLMN1eUvtw6M3NAQymL
         ATjeIJXY09IHEi/gJRoDL7U48RufAOUsS08MSWovJtveBfZtyURJheOaPOTo2AQLSHWj
         U+vY3SnjgxI4RrhKkaSXAE4JUT/sG8TVOhMDpDAU4AlOp2BXXb7DChTCOVAcWh+I31m0
         os7Tr2Wdb1/Gg50tJTZjXmA7Fy1NanDmCBn1S8CvES0Yr8Mm2/hFhEz/E5YUTmYf/pcC
         TihikY8H6NOxBO2VsZ8+1V6zrLn+K3sTVfmY+gxyHEbyNJCSBcodw14LyqX8Zr2u7jp9
         1X4A==
X-Gm-Message-State: APjAAAWxRGml+SmxhhPZsgE0x2E0/XCswz+AWj0y91mV/wlVSzyjbk+4
        X4oPkn+Zl5m0QVEz374Ozg==
X-Google-Smtp-Source: APXvYqylLNU6ksjyveYy5SgH/d1j9k+4NzYK5oEqXUDpK0EqbWHgJYR3odqDU4zhYCzU6jfHUKhg7w==
X-Received: by 2002:aca:5303:: with SMTP id h3mr5863314oib.109.1582150833839;
        Wed, 19 Feb 2020 14:20:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r80sm423780oie.41.2020.02.19.14.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:20:33 -0800 (PST)
Received: (nullmailer pid 9446 invoked by uid 1000);
        Wed, 19 Feb 2020 22:20:32 -0000
Date:   Wed, 19 Feb 2020 16:20:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: Add vendor prefix for Xiaomi
Message-ID: <20200219222032.GA9388@bogus>
References: <20200212170916.7494-1-alexey.min@gmail.com>
 <20200212170916.7494-2-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212170916.7494-2-alexey.min@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 12 Feb 2020 20:09:12 +0300, Alexey Minnekhanov wrote:
> Xiaomi Corporation is a Chinese electronics company.
> 
> Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
