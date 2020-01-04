Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F0FC32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C0A222B48
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578173892;
	bh=C0qle1HFxNQq4FdSx+/f7tXhPZ4F4pASUrtMdTKgyME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F3dcBod0naKquJQwtKs4NNigz6QqiePol3h9C/b0jBAcdoY/a8IQzEZ4R0IWbK42C
	 Bp/8PFJ5a+FHXvF0ztCQf8zBkXLaHP/+ecco9zh27nuKw7fAQEEW8tVS0GTd2mCtcV
	 3SePopqAZ48n+Nt3wNpBhjXqZEZXKxoIYprAjgp0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgADViI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:38:08 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40231 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgADViI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:38:08 -0500
Received: by mail-io1-f68.google.com with SMTP id x1so44757461iop.7
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pI5QObJXdfMTKTGYOW6wMFE3eyq81zBt90YlzThMeA=;
        b=WgN9BDHRXcvV3DFZ9qJx45xFV30FrC5HV3Ccm6jT57hfivIP0YAb3LjQ4vokIkP48f
         dlycvmmIA4iP7v0BjwsFVrYkdZzZxqwWRoApW1WQ6e2qoo5kXN+v3kRVSENe6VHt7OJE
         SfDnHyXgAtJyeBJI8Hcwx/v6XpatLA0shKT0luX0e/PBmgK7bD2k41/PKClkeZ7awjz/
         VBD5aX0x2xXxhnwciVSVgcMuS+0YaYHMXLZt8EvDfAteBtnv4/isXpSzPuxb3BC6C3Kl
         NMUk4qfBlWDiPyLTU8x7kO1X12s6XtgcQzvBYrti9cPWz6urCCtgokJDSS5ZUevpVhja
         NTww==
X-Gm-Message-State: APjAAAUjXA4Tcn1CATgqGTjA8/Oicb//z5sqwjst78sU+f6fqxoY4WtY
        C4J/NDEctaW2t4wx5cahZo5y8zE=
X-Google-Smtp-Source: APXvYqzcEbkq0S2Tu6P6GF15XC+qeezRU1XA+GqoSnRhDkPjsHorVys6v8oGf2wdBIWNnMuCMOZpOA==
X-Received: by 2002:a5d:884c:: with SMTP id t12mr64780591ios.171.1578173887356;
        Sat, 04 Jan 2020 13:38:07 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e13sm5288410iol.16.2020.01.04.13.38.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:38:06 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:38:05 -0700
Date:   Sat, 4 Jan 2020 14:38:05 -0700
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200104213804.GA30385@bogus>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227053215.423811-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 26, 2019 at 09:32:08PM -0800, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm periperal image loader
> relocation info region found in the IMEM.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..715945c683ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +description:
> +  This document defines the binding for describing the Qualcomm peripheral
> +  image loader relocation memory region, in IMEM, which is used for post mortem
> +  debugging of remoteprocs.
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the memory region

Why not use 'reg' instead?

> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible = "syscon", "simple-mfd";
> +      reg = <0 0x146bf000 0 0x1000>;
> +
> +      pil-reloc {
> +        compatible ="qcom,pil-reloc-info";
> +        offset = <0x94c>;
> +      };
> +    };
> -- 
> 2.24.0
> 
