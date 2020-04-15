Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30D4C2BB55
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 15:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 951E42078B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586964284;
	bh=pe4mUZoSClmSOdJbx5BRqCfcV9Bl4p2V6l2UGqLg5pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YudDDvehg0ZzurwFfVKLaC8sTuTRHxZNvM6qT0xhMhoX/ZDBTtqDAitF2iQK0kNov
	 Cp5W4xOZ4skd2jZZsCAp9YX7K2uHVz3cTUzhO7Mg0hXz4hDsVjmIgU1v+qnBu9ZylG
	 zTh23tMtG3WqPJseJBZ8Eq6g7YK91607tJEE+fso=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506430AbgDOPYn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 11:24:43 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43319 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505511AbgDOPYm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 11:24:42 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so13776881oih.10;
        Wed, 15 Apr 2020 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jhBF/0NDo7VWagdd1bbsqqHnNKZNs8SZkRbVtCJaHvo=;
        b=qE6cFqBzL9Y0TlEtOgt9XHYqzKx8UNpBYvk53CeOGCjBqm41rm1SskfTQT5gN3QIvM
         zkpTHTMjjm4sTEMWV30edO2yqaBa1O5dDpF6D7vDT0bGuyApAn/cMWP3VtxwwDVSCoQD
         /dS74/FNTJXvJqUZN9scaHKnzhWT45RZyVbJ5OF/Z5diuxQgLjg2JYBz6blCmOQAohWx
         7d4zy3Oelxe3/HO/BtHzeSfBOpAHhH1c5lyKa225yz27XLnPeB6mhkSjzZBUc79p1Iim
         s8KSFz69r7DsOwfsl928YAtKnCIVOukBrrBJI4uAapVSOgcKATU/W0a3AuEv5eOu69FO
         Vgnw==
X-Gm-Message-State: AGi0PuYR0ZJ0UDAQQdMZ8N526kohM1Mq37z1eg8NN9BD63ArFKLR8g+4
        olsLxxlVFk50TeW7+ReDiQ==
X-Google-Smtp-Source: APiQypK60RgLEmAsFyOZF/N+fWwAL92n4oq7mY6wF7D/JLdoeMdx6S6XMdXiReUTulsqlMeSpxJPaw==
X-Received: by 2002:aca:dd55:: with SMTP id u82mr19163342oig.27.1586964280896;
        Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w6sm402075ooa.6.2020.04.15.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: (nullmailer pid 14651 invoked by uid 1000);
        Wed, 15 Apr 2020 15:24:39 -0000
Date:   Wed, 15 Apr 2020 10:24:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        aravindh@codeaurora.org, varar@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO
 bindings
Message-ID: <20200415152439.GA9882@bogus>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 07, 2020 at 03:48:28PM -0700, Tanmay Shah wrote:
> Add Display Port HPD GPIO description in bindings
> 
> This Patch depends on:
> 	https://patchwork.kernel.org/patch/11468505/

This belongs below the '---' and probably means you should send all this 
as one series.

> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> index 761a01d..003f5f7 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -155,6 +155,11 @@ properties:
>       data-lanes:
>         description: Maximum number of lanes that can be used for Display port.
>  
> +     dp-hpd-gpio:

We already have a standard property for this. Use it. 

It belongs in the connector node as HPD is part of the connector.

> +       maxItems: 1
> +       description: Specifies HPD gpio for DP connector without
> +                    USB PHY or AUX switch.
> +
>       usbplug-cc-gpio:

Note that this too should be in a connector node.

>         maxItems: 1
>         description: Specifies the usbplug orientation gpio.
> @@ -282,6 +287,8 @@ examples:
>          aux-sel-gpio = <&msmgpio 110 1>;
>          usbplug-cc-gpio = <&msmgpio 90 1>;
>  
> +        dp-hpd-gpio = <&msmgpio 117 0>;
> +
>          ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
