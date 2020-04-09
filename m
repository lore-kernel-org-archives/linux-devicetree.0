Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25075C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E65692082D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586449856;
	bh=B18mPX1uM//7QoBX6QwnKG2xUFmgNecd/gi+xQTxY3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yx5WRfmN1r7V8nhkw29QBWqaozUkKgwf+iPzuubC5VMH9qJ1DkRM2dBxwTBVrW5Br
	 AN0i/+65ReUgfdRZHoaEcaAiJ1R7dHW9qACJOJvARync3dQDXXF4AWDxuzx3jP03Qx
	 R9yPabnrT7nnV0UcTtRkPqE/6fjwfRa4Yobn18KQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgDIQay (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 12:30:54 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43392 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQay (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 12:30:54 -0400
Received: by mail-io1-f68.google.com with SMTP id u2so145725iop.10;
        Thu, 09 Apr 2020 09:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RWUxvoUxpNdpEBLR3q2r5Gi0t41VFf4ogeCthurKpk4=;
        b=ulEZ6i84ZC4XxICcvH1XN9VPC09M429jFEK4xknK82QBxw5eRH2Wlp5BaRFnw0bnIV
         RzrtEII6PXgaW+piQY8Xha7i66W5VMSTBaj2trsEI6GpqTOdBSBL6QXgLht2O+2tvSig
         JWWxEU153SxwJXB4I/Yxr5loRtch9aBT1fdoFBJGa77FlOomFl/cf4Xx8H9wdiKCHCvm
         Js2OEY3KYl/3cj9vl+5oeObLKe5Et3/MxAP8WrmYFO1ZAfDm26e5XlhpIbBt2NWbU3Vw
         /6d1ZHBHqax8uXK5Sms1KltzYtx40mu7eNXML+pcyN89oyq4o4tsYXY8bpr62Qb26x5d
         u8qA==
X-Gm-Message-State: AGi0PuZ16nu1ZmIi2t2qeYHpjx/uDmZgpudr7y0ZJdVDj1bPKDnbScjg
        sl5b9QnkRZ2OS7jZ4Q06PQ==
X-Google-Smtp-Source: APiQypJSfQPm8wWC1iQzXsaHdnennsJLZRayGxzkijI905UmklKydtot6yzfPbiHOKnexB5if46M7A==
X-Received: by 2002:a6b:b90b:: with SMTP id j11mr23216iof.116.1586449852402;
        Thu, 09 Apr 2020 09:30:52 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h13sm2935954iom.39.2020.04.09.09.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:30:51 -0700 (PDT)
Received: (nullmailer pid 31727 invoked by uid 1000);
        Thu, 09 Apr 2020 16:30:49 -0000
Date:   Thu, 9 Apr 2020 10:30:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: syscon-icst: Remove unneeded unit
 name
Message-ID: <20200409163049.GA31672@bogus>
References: <20200328185326.17948-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328185326.17948-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 28 Mar 2020 15:53:26 -0300, Fabio Estevam wrote:
> The following warnings are seen with 'make dt_binding_check':
> 
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_vs_reg): /example-0/clock@00: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_format): /example-0/clock@00: unit name should not have leading 0s
> 
> Fix them by removing the unneeded clock unit name.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Removed 'dac' from the Subject
> 
>  Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
