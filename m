Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2446C34031
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 23:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 671E52173E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582067155;
	bh=GWDdxJI5nq5NR5ET/jFt3RN5BiH5/qsg5PajLuLzbhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BLjMMfc28shcf2fcqJXDb12/rYVP2ZU2vVUWEFREfdr4XbaqqVjSBHo5qV744Afve
	 Su0Lkm1eLSOi076uzm3AszbB4xc0X9T0bVl0rNDXSYd5e7wFURJvWVlgZe2puZ7dkG
	 YIM0yny7PyZx0czFfBU/4bdc9toQotl/LIdbLSTU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgBRXFz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 18:05:55 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34302 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgBRXFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 18:05:54 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so21928926oig.1
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 15:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YBc22ibS/f5NdUYtHpt1goigjX9wJQGgMTv7A78YKKU=;
        b=YgPpYqpcLD85RF7B6URZyHakntg73epfd3tDhtNr3PS84yaSA9rN8q6crcKC8W7I+S
         6fo7kv4lIaFHKcc6DsLKuA9evL3YcXMIsqaNXsTkKFcV1cs/G4SciRbg4AakNFNaYKfc
         KocG7jL9lziqvI5IDq8DR18E4J8ceT4U0qVvBUcBe7OYmp7+ouPmQ44G7+ldAtztdRku
         l7X8ARzstch+QXYNHnyK1ysspg6UZN2Fblis0S1nDz58v3KaMQmFF1inbVU6v7dFbgxn
         1MOIKYAatfD+eHFy/mCILsmdGeZNTlJjj1bZgOUXiiwM0g4KlWuqwfC7XaWni7pVIVzp
         Wuow==
X-Gm-Message-State: APjAAAWZWCMJu6KISvg3doRwkhspP2OgEGz/rZnvkEuDWANzdkHFEYwZ
        KikXpN9BlMY5AvRNVsEwxQ==
X-Google-Smtp-Source: APXvYqwBbePK/9QhmCJoARaCJy0zyodtUKCm3LyZdC3LEyvEHvQgMMFxQgZCyg7mrLWqrGDWTEPv5Q==
X-Received: by 2002:aca:e084:: with SMTP id x126mr2735185oig.97.1582067154017;
        Tue, 18 Feb 2020 15:05:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j5sm1836683otl.71.2020.02.18.15.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:05:53 -0800 (PST)
Received: (nullmailer pid 14924 invoked by uid 1000);
        Tue, 18 Feb 2020 23:05:52 -0000
Date:   Tue, 18 Feb 2020 17:05:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nikolay Borisov <nborisov@suse.com>
Cc:     mripard@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, wens@csie.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nikolay Borisov <nborisov@suse.com>
Subject: Re: [PATCH v3] dt-bindings: hwlock: Document A64 hwspinlock bindings
Message-ID: <20200218230552.GA14873@bogus>
References: <20200211122624.16484-4-nborisov@suse.com>
 <20200212115419.29038-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212115419.29038-1-nborisov@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 12 Feb 2020 13:54:19 +0200, Nikolay Borisov wrote:
> Add binding for the hwspinlock found on Allwinner A64 SoC.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
> 
> V3: Added #include directive. This makes the patch pass schema validation.
> 
>  .../allwinner,sun50i-a64-hwspinlock.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/allwinner,sun50i-a64-hwspinlock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
