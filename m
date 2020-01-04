Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4273AC33C8C
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:01:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15853222C4
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578175307;
	bh=QAb3WwBRh8YfRR4KapHz3X/5kthUL4mmyhdgztQX2kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I3bkDOWweJnle7PRqqCt7ZQdqE0VZE4AN0+3KB+5H/o0J29m2sZaSC2oBDkQahLCs
	 Dyp8M1XsJV6fvBQEBiLQWQV1o2MG2CRO4FxRdKdyHHl+N1bW1M4gdCsW6/znrnG7ri
	 1nNubawnCnHOE+eeezoaOD+O4KSc+fTnSY+5Lxgo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADWBq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 17:01:46 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:34259 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgADWBq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 17:01:46 -0500
Received: by mail-io1-f65.google.com with SMTP id z193so44782130iof.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 14:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fnzuX2UXDHqVoWZIcnjy9706qM97ViaNzviNWp3fBBw=;
        b=TfVTBnplM7teZUN1d16EjZ5aXgJ3W8zvvJQCV5jHAOuPmFgT0gGTR+kqkjztaSuBQ5
         DK+a7iVXsViXx39//5N68PuKwX8CMs42d8FDfPbnkMnwxrzXVadXsc03CcLihp3mMRXQ
         usLpNLwwG0G0sd4Y3ZGMtWrX6n235wM/zUG+mc15Y309Jshi5/SX+HnB43JSReB0S/C4
         60j1eQ0VkhK3PN/u7i7aQQe9tE8MxhK9LTIre0pPjs1RLWDoro+1ywUsurzW4qSPZCLR
         IXec/XW2H7MDM6zXaIj/nRWdjboYWxkVbnX8w0BZQtTKuGu2NQMxpKxRh8XZSVRtNv4d
         aRvg==
X-Gm-Message-State: APjAAAXhg1KjXJTloVMNLtRtzoLh8mgm3WMrt/l/ziIazFfh8Yp1tN56
        dFKbD9TfPync/JspuP2YOpgN3NQ=
X-Google-Smtp-Source: APXvYqwZJJCqFkxHEW2Q2cUbokSZHv7FK+1pPzqPFDK5CsCGOWYyrCESLMcETKhhPCniHaenpZhYPg==
X-Received: by 2002:a6b:ea0e:: with SMTP id m14mr57293813ioc.284.1578175305044;
        Sat, 04 Jan 2020 14:01:45 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k11sm5559915ion.32.2020.01.04.14.01.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:01:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 15:01:42 -0700
Date:   Sat, 4 Jan 2020 15:01:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [V2, 1/3] dt-bindings: interconnect: Add Qualcomm SC7180 DT
 bindings
Message-ID: <20200104220142.GA28701@bogus>
References: <1577782737-32068-1-git-send-email-okukatla@codeaurora.org>
 <1577782737-32068-2-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577782737-32068-2-git-send-email-okukatla@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 31, 2019 at 02:28:55PM +0530, Odelu Kukatla wrote:
> The Qualcomm SC7180 platform has several bus fabrics that could be
> controlled and tuned dynamically according to the bandwidth demand.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,bcm-voter.yaml      |   1 +
>  .../bindings/interconnect/qcom,sc7180.yaml         | 155 ++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,sc7180.h     | 161 +++++++++++++++++++++
>  3 files changed, 317 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> index 74f0715..55c9f34 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.yaml
> @@ -19,6 +19,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sc7180-bcm-voter
>        - qcom,sdm845-bcm-voter
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
> new file mode 100644
> index 0000000..487da5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
