Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEB2C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 03:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8329C2054F
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 03:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589512574;
	bh=p6CA0ZufczCLly483wh9+bCQei4SMkscSEEDrrGtMrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cAXaDY430+00AWUGSR4MlFDuPXWhJeeuZJ2n1fgduylztffS8IXKlMDJiMOQixdhm
	 W8a7vj4DnmrQ8ZRBAxrOT204mKL5wMI2M7uLCfDOOruZ0bqifJaLmW+xF4JpnYQYIL
	 TPMatr0AWStW2nvCKCFVO9lortQ1+raAtehnr2s0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEODQO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 23:16:14 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44195 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgEODQN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 23:16:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id j4so794633otr.11
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 20:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QgDBRSIfDKSffvU3Ly32G5jTLXz9MN2w5S616tVyMLU=;
        b=Q26m49OZiJgwj+EW872ZECAdAT+KCDyZFBAiG06tRBG2PbGkrucxUs3ptnRBMz5UoL
         4oPwax/GmxTAXKSk05/MSZOrCttBwH5YSzGseC4v1zXsjl71dcYdSB+cW4HeEUqDEGQa
         a9CKarMade//c/Hcd/XVmOUuo6SO2EeOCp/6nZZqx39ePimYEjUvQgQg6mI5bs4NXVkL
         BNxUqUk3vv3QB/1PHEsUpcjVYUybbjdFI5eH7yR4o9JQ+hsT5KnQqSQV17mMQ7vQRR70
         7nmgNq/ll/bJg3156NhZbFePuDmWovKVkjsZiWTtqZka+l5vN3bqcPZcSkjQvkYmb7z/
         TU9Q==
X-Gm-Message-State: AOAM5313H0gAkUsrpckzc3XeDfXzCF5MXBZUAEhAafgFbyivNGnPtmUt
        ikbpUVmxsk0Q37UcPHQ6UA==
X-Google-Smtp-Source: ABdhPJx+6ePI0Wlmyprnwj0WCBtiFng+Cdgj8nqFHTl/IpFzGKFRD3I6mGeUX6CRzZ09lypHC5fZTg==
X-Received: by 2002:a05:6830:1353:: with SMTP id r19mr825668otq.248.1589512571587;
        Thu, 14 May 2020 20:16:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z75sm307134oia.22.2020.05.14.20.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:16:10 -0700 (PDT)
Received: (nullmailer pid 2805 invoked by uid 1000);
        Fri, 15 May 2020 03:16:10 -0000
Date:   Thu, 14 May 2020 22:16:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 01/20] dt-bindings: arm: gic: Allow combining arm,
 gic-400 compatible strings
Message-ID: <20200515031610.GA2750@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-2-andre.przywara@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 13 May 2020 11:29:57 +0100, Andre Przywara wrote:
> The arm,gic-400 compatible is probably the best matching string for the
> GIC in most modern SoCs, but was only introduced later into the kernel.
> For historic reasons and to keep compatibility, some SoC DTs were thus
> using a combination of this name and one of the older strings, which
> currently the binding denies.
> 
> Add a stanza to the DT binding to allow "arm,gic-400", followed by
> either "arm,cortex-a15-gic" or "arm,cortex-a7-gic". This fixes binding
> compliance for quite some SoC .dtsi files in the kernel tree.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
