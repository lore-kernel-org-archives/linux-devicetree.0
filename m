Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43807C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:44:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 163C82075B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579099493;
	bh=qwGEufKzybnRhT8XA8djABPrGjtINY1pB1c3/1QICg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ofoVVZQLHErytTLQMm1aevdResJYfQhEoniW2divOXM9q0Lux7NYiJH7Yg645QNiV
	 KbrhWU+RGsBIjcg5dvhBQghUJuLgrsaUNeg8PCJPL7nQrNZ/F+bYMIsw6Vm4CyaQxA
	 OwuAQj+OCpZvB52YiFStreOQBrB5KJseUrzlPU1o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAOOow (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:44:52 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42378 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgAOOow (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:44:52 -0500
Received: by mail-oi1-f195.google.com with SMTP id 18so15568112oin.9
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ky4RIbVWy7rBgUBCjlLOjE84AfoKdzvyQIgA25sSC+w=;
        b=dmQPlfEDiBrUwXWZjqz6FmteFCckQhD36QvC6It9z/dua3lCuku91s6LktIaGgAEYa
         T5MRVeNVN9Iyt97oMSPryXy9VgbtZFJdnKO1wPKWNmyx0oQlHI/K03hOYgCwuHrT2g95
         rf260r0ZWZPQulYqsbHG0Kki2FNmqq2iTE73GIWCUO+/O2ekWW8NMn8UgdcN7k/e1kTq
         bhFJiyS6qWf57YPpCj2jf+Kwy3OViSdRGt3Amp0aR8XkUfCsXIW+InHJfXIdbhH/Eswq
         b0cciP25AhgxXigclmsilt2PXje2tIDHYoxdhCqUUum11IVgndGJ5bd5U+uxhXMzaNl/
         QDhA==
X-Gm-Message-State: APjAAAWRpyH20uu0eH6LgIiKyO90SC9A2hnWEhCPrS3Z/mhEPsG4M0xr
        uoPk/U1trirAgIWN0I3yH1oYlWM=
X-Google-Smtp-Source: APXvYqyu0PsZ80uJV9BA89FBrocNkmC3K+mF9/y1YGY2oNRR5WDh3Ub4mwve+WxlzJjEp7mJO1qFgw==
X-Received: by 2002:a05:6808:244:: with SMTP id m4mr33858oie.125.1579099491449;
        Wed, 15 Jan 2020 06:44:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o101sm6603509ota.69.2020.01.15.06.44.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:44:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:44:49 -0600
Date:   Wed, 15 Jan 2020 08:44:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Dai <daidavid1@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: interconnect: Add YAML schemas for
 QCOM bcm-voter
Message-ID: <20200115144449.GA5371@bogus>
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org>
 <1578630784-962-3-git-send-email-daidavid1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578630784-962-3-git-send-email-daidavid1@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 09, 2020 at 08:33:00PM -0800, David Dai wrote:
> Add YAML schemas for interconnect bcm-voters found on QCOM RPMh-based
> SoCs.
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,bcm-voter.yaml      | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> new file mode 100644
> index 0000000..a6bdf6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,bcm-voter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm BCM-Voter Interconnect
> +
> +maintainers:
> +  - David Dai <daidavid1@codeaurora.org>
> +
> +description: |

Don't need '|' unless you need formatting preserved.

> +    The Bus Clock Manager (BCM) is a dedicated hardware accelerator
> +    that manages shared system resources by aggregating requests
> +    from multiple Resource State Coordinators (RSC). Interconnect
> +    providers are able to vote for aggregated thresholds values from
> +    consumers by communicating through their respective RSCs.

Indent should be 2 spaces.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sdm845-bcm-voter
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apps_rsc: interconnect@179c0000 {

Unit-address should also have 'reg' property.

> +        compatible = "qcom,rpmh-rsc";

Note that once this has a schema, it will be checked, so make sure it's 
complete.

> +
> +        apps_bcm_voter: bcm_voter {
> +            compatible = "qcom,sdm845-bcm-voter";
> +        };
> +    };
> +
> +    disp_rsc: interconnect@179d0000 {
> +        compatible = "qcom,rpmh-rsc";
> +
> +        disp_bcm_voter: bcm_voter {
> +            compatible = "qcom,sdm845-bcm-voter";
> +        };
> +    };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
