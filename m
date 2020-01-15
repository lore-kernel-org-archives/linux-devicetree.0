Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8410C33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:49:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B86D9214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579099789;
	bh=60sOzP0xSDoq3RuFeWje/iUxHpy096wz+O8EnFB9oyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tYNNzCc2ejvIyNEXKxe5d9u0cpfRITsc95IJAlX02kITDMoOO9JxvhkaF79/2GIUp
	 rK0rjJdKV/1tYuI71mWx/Q9EhDDRPl3pQUv5TL28dTuYB0PJuYTNzdbroUH+GjtOBX
	 LymdC5PKl7pzxHPhznZQdplrds7qmcnxxUnZrVZQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgAOOtq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:49:46 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44530 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOOtq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:49:46 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so16252653otj.11
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H1ze89BBE7QI+NzTkr8tdkM1RIqde14fHEiBxrkkmaI=;
        b=oShSuLlkD3gMUeTQTAKsVAwCtvzeofNRvGlIODUHihnWQ5INoUqx9cbruOQcSBGp34
         OcFgoTAOY9CR1inM6VthQ+hYvDQNfwGsBKjTrlP5vMdJqEkecmRmoNZt5icAHhhRaFbB
         eNsFRtzE0TdsrxD7Xka8QJGTsxjKD/uETT9LmUcZ0oa6qyWfZM7UogfZA2317YTECtLB
         hyrVjSe7DSFiHPSW59KUxTHyblfaXh70EBEyViyXrBXZaKEA2kSNtvpYSw70Tg+rrdR8
         bFP2n5JCkt8PyOQoBJOcRD/YjXST0IUEJM0JbPuRS6dFGLOX4LmKBI/dgouYt2nvS82S
         Hjzw==
X-Gm-Message-State: APjAAAUaKKBlY6AEu+D7Lz+PqvSVpISMhFcx5/OJdFlo9J3qTSDX0/+q
        MRRUvDi+yrAqbFa47HYdxKIAjpk=
X-Google-Smtp-Source: APXvYqypduWZ0oRlrc3pAOb35dGu91jt5eLFMgyQOoC8JSYz9CIx1s93r2bJDz152BBSvGkdqfXAuw==
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr2980599oto.355.1579099785402;
        Wed, 15 Jan 2020 06:49:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t11sm6559963otk.50.2020.01.15.06.49.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:49:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:49:42 -0600
Date:   Wed, 15 Jan 2020 08:49:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Dai <daidavid1@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: interconnect: Update Qualcomm SDM845
 DT bindings
Message-ID: <20200115144942.GA15075@bogus>
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org>
 <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 09, 2020 at 08:33:01PM -0800, David Dai wrote:
> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,sdm845.yaml         | 49 ++++++++++++++++++----
>  1 file changed, 40 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> index 61e0097..6741a12 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> @@ -13,21 +13,44 @@ description: |
>     SDM845 interconnect providers support system bandwidth requirements through
>     RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>     able to communicate with the BCM through the Resource State Coordinator (RSC)
> -   associated with each execution environment. Provider nodes must reside within
> -   an RPMh device node pertaining to their RSC and each provider maps to a
> -   single RPMh resource.
> +   associated with each execution environment. Provider nodes must point to at
> +   least one RPMh device child node pertaining to their RSC and each provider
> +   can map to multiple RPMh resources.
>   
>  properties:
> +  reg:
> +    maxItems: 1
> +
>    compatible:
>      enum:
> -      - qcom,sdm845-rsc-hlos
> +      - qcom,sdm845-aggre1-noc
> +      - qcom,sdm845-aggre2-noc
> +      - qcom,sdm845-config-noc
> +      - qcom,sdm845-dc-noc
> +      - qcom,sdm845-gladiator-noc
> +      - qcom,sdm845-mem-noc
> +      - qcom,sdm845-mmss-noc
> +      - qcom,sdm845-system-noc
>  
>    '#interconnect-cells':
>      const: 1
>  
> +  qcom,bcm-voter-names:
> +    items:
> +      - const: apps
> +      - const: disp

If these are always the names, why do you need them?

> +
> +  qcom,bcm-voters:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      List of phandles to qcom,bcm-voter nodes that are required by
> +      this interconnect to send RPMh commands.

Is the max length 2?

> +
>  required:
>    - compatible
> +  - reg
>    - '#interconnect-cells'
> +  - qcom,bcm-voters
>  
>  additionalProperties: false
>  
> @@ -35,9 +58,17 @@ examples:
>    - |
>        #include <dt-bindings/interconnect/qcom,sdm845.h>
>  
> -      apps_rsc: rsc {
> -              rsc_hlos: interconnect {
> -                      compatible = "qcom,sdm845-rsc-hlos";
> -                      #interconnect-cells = <1>;
> -              };
> +      mem_noc: interconnect@1380000 {
> +             compatible = "qcom,sdm845-mem-noc";
> +             reg = <0 0x01380000 0 0x27200>;
> +             #interconnect-cells = <1>;
> +             qcom,bcm-voters = <&apps_bcm_voter>;
> +      };
> +
> +      mmss_noc: interconnect@1740000 {
> +             compatible = "qcom,sdm845-mmss-noc";
> +             reg = <0 0x01740000 0 0x1c1000>;
> +             #interconnect-cells = <1>;
> +             qcom,bcm-voter-names = "apps", "disp";
> +             qcom,bcm-voters = <&apps_bcm_voter>, <&disp_bcm_voter>;
>        };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
