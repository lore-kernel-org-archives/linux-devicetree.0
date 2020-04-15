Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3801C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 00:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CDD42076B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586909222;
	bh=d6uxhSulRF8TeLnRDNgidxYMiLjnB2MJe8dPiT5FhzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ebRY5JWuMeZwmH5UqH/7Zsg26v0tGQALpzvxosU5oAmQTRGzmsM4pdOpw6GFeuLj2
	 FHfhRHiN/eH5j2YcEpOvn5l8QunsKLpu9w2YsQZqmBQ2L4cSNUrdbb6KSmfZW8PIdE
	 52AjZoAeX6eQSXWbUaZve5qDPXAq3bdaA/xVPrdw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392241AbgDOAG7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 20:06:59 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38239 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392239AbgDOAGw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 20:06:52 -0400
Received: by mail-ot1-f66.google.com with SMTP id k21so1660006otl.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 17:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zzzsKz1aXq1FGxDkuAfWvlD6tFRvDkWAA3kCh2toeFc=;
        b=fmnIB2zIxuz0PUq6tfWBn/klOnN+4iuyBB4HA6aqkUkujVleJvsot7L14kvA4nOYKN
         eL9NWUpC3FnKKSyxrsC+H1kWXEtCq/SAAP8CYcpblZ/4Yjk+hjUPBOC6NeDI3oeHjf2s
         9RdSZi7uuBAycqL7LS8gLHkVVyZMqK+n3nc28MCsDgmkIcIYKOntv8+Jt9nNOVNnrq1M
         Excb/MC19hBSe/7r1RhGx36rnHNVk1Zg56rUhSTy/0E371qo+rnpxKqt/h9VoEBurriy
         kIBWCHnN783jaLelBjePHWRDQcfX6zleOTSEYXVAUlkk9DOQOSdQwI/o/SoH6GkBRVEx
         ND1A==
X-Gm-Message-State: AGi0PuYFwyePfnIrsMK5Sgcernf9aR6TH1BQYbuvEtEZKCcwsfSOX2Mn
        iiiwJ4sCyaKJMHEks4LkNg==
X-Google-Smtp-Source: APiQypKXBmIANTuzqAKXJR1+GcTctxVj4356oR1rWyrdLfaNvOjR94IF3xYVI+WWd5PezEcDkgPjKw==
X-Received: by 2002:a05:6830:1bdb:: with SMTP id v27mr16047181ota.218.1586909211644;
        Tue, 14 Apr 2020 17:06:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k13sm4756205oou.27.2020.04.14.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 17:06:50 -0700 (PDT)
Received: (nullmailer pid 19643 invoked by uid 1000);
        Wed, 15 Apr 2020 00:06:49 -0000
Date:   Tue, 14 Apr 2020 19:06:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kenneth Westfield <kwestfie@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Message-ID: <20200415000649.GA28504@bogus>
References: <20200406135608.126171-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406135608.126171-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 06, 2020 at 03:56:07PM +0200, Stephan Gerhold wrote:
> The lpass-cpu driver now allows configuring the MI2S SD lines
> by defining subnodes for one of the DAIs.
> 
> Document this in the device tree bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 21c648328be9..df53a10502f7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -30,6 +30,8 @@ Required properties:
>  - reg			: Must contain an address for each entry in reg-names.
>  - reg-names		: A list which must include the following entries:
>  				* "lpass-lpaif"
> +- #address-cells	: Must be 1
> +- #size-cells		: Must be 0
>  
>  
>  
> @@ -37,6 +39,18 @@ Optional properties:
>  
>  - qcom,adsp		: Phandle for the audio DSP node
>  
> +By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> +The SD lines to use can be configured by adding subnodes for each of the DAIs.
> +
> +Required properties for each DAI (represented by a subnode):
> +- reg			: Must be one of the DAI IDs
> +			  (usually part of dt-bindings header)
> +- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback

0-3 for the values or number of entries?

> +- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
> +
> +Note that adding a subnode changes the default to "no lines configured",
> +so both playback and capture lines should be configured when a subnode is added.
> +
>  Example:
>  
>  lpass@28100000 {
> @@ -51,4 +65,13 @@ lpass@28100000 {
>  	reg = <0x28100000 0x10000>;
>  	reg-names = "lpass-lpaif";
>  	qcom,adsp = <&adsp>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Optional to set different MI2S SD lines */
> +	mi2s-quaternary@3 {

Normally the node name reflects the class of device. IOW, all the child 
nodes should have the same name.

> +		reg = <MI2S_QUATERNARY>;
> +		qcom,playback-sd-lines = <0 1>;
> +	};
>  };
> -- 
> 2.26.0
> 
