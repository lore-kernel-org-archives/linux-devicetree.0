Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9222BC10F25
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 20:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CF1220409
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583786331;
	bh=uKIKyE2aDLigjVLzzpTPvrwTJrITxL3fQ1PGUSn/J5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2tlnqsHmo+NzcsJy1mk2354b3XC6uggaAmHHP8taP7AErs2a+X//oz9j3X2Kw4CXo
	 6xuBmRpxcP9ZUP0TBepYs8nzUHPiCqL9u9HL/OyPktwL6T9PvcPS2/ypsgHPvlFE0U
	 zDt6prCORNZiZ21GQEGx8Q7rsR2v1PaW2SlLiDfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgCIUiu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 16:38:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34653 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgCIUiu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 16:38:50 -0400
Received: by mail-ot1-f67.google.com with SMTP id j16so11019992otl.1
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 13:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=movXecPtcFCRJBwb8EpVb7ysHOpf27xnptRbhixi3a4=;
        b=MHinwM4cyu3wNtB+DcsFcyfjRvluYncJ7JfqoMQHL2Im/pwojPp1tU5mofCCxZhpFO
         SsfEYOU5QhP/0J8rXaaX4nj94oDYZDHpDB0R8cgEzIhljcDMEBzq5lE0sqoh1g02UaYM
         sN0gRqdALGYevvhKUm1EqTFdHtGL2GG6EX2Tmgcl5J7rh9KMmCjL9qKUPXm9jNrQYrW8
         CknsdaKblHNLKjJCexuDgfyDuw1BNriZbNoapiL5QZc6lvKOqD4JWJWsIkapADI7+dAX
         WziOdrw9OWlQmCWqokWMWZjwUBPiWZ+ElcszDQ9O0d9MVyoikLsTXBMe/dw+ygKU+Apt
         i4rA==
X-Gm-Message-State: ANhLgQ3JeWVZNt8pQBSQZ2OTBf1+Rw9d1re/Wm71U4d6EPqlecuwlQtB
        Dra9cTcPaQqHAtPBHDWTAFWrbnU=
X-Google-Smtp-Source: ADFU+vvLY1vdTo+msfSic/K+4qibHlH1f0qTdVM2N2SfpTods148lywXntMcEmHDYFrgDcR2ILTnuw==
X-Received: by 2002:a9d:4001:: with SMTP id m1mr551258ote.57.1583786329894;
        Mon, 09 Mar 2020 13:38:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm3495874oij.18.2020.03.09.13.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 13:38:48 -0700 (PDT)
Received: (nullmailer pid 31750 invoked by uid 1000);
        Mon, 09 Mar 2020 20:38:47 -0000
Date:   Mon, 9 Mar 2020 15:38:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Charles-Antoine Couret <charles-antoine.couret@mind.be>
Cc:     alsa-devel@alsa-project.org,
        Charles-Antoine Couret <charles-antoine.couret@mind.be>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
Message-ID: <20200309203847.GA31358@bogus>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
 <20200308142509.27765-7-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200308142509.27765-7-charles-antoine.couret@mind.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun,  8 Mar 2020 15:25:09 +0100, Charles-Antoine Couret wrote:
> Document the bindings for the tas5756m driver.
> 
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/sound/tas5756m.example.dts:23.37-38 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1251057
Please check and re-submit.
