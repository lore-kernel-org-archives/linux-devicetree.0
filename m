Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0C5C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 535542070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578501588;
	bh=ruuzExV/WTi+BrYKewR74kS7+Oa/N/k38qdbcAPzcrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OMLxW+w/E5bsE8YZLLL/VeDqs2vR0D28iDp87oznjRuqG/K0fcD6ADQLRo4FVH/7z
	 iQhCsTD035C+u6BYsgfrC3XB87Ul+TVx1N6CXFul/u8jkX3UiD6h/149J31OqTIyKh
	 uB1nncHoYM8GoFRilEb9c3soYCMv453eWXye9HxY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgAHQjr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:39:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42965 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgAHQjr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:39:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so4162710otd.9
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7YuLu/5ssx5qi8ML+jSjpakNJXIUPRCs4C4ET7aw5Z8=;
        b=JnD20b65NO24QC7/dIrXcg18dV4/S7EqiCfHh/AIt2uJf0/yvpjZVOA1IuEG+SV3Mk
         yZ2WXzqTdmAY7aKsvPFNupUV1Kv+MEECaQH9ek+W6CHwhTFYOWpBOedqOtVvftXNUnxY
         nxNlgdTiFE5rVcNe2YSBrs5++hhCVCD8ruvhkKFb5g1nYaie3kHBMIydTLYxOrEWMfaR
         cdSG336j5bHnicsOOfSw3aauFIxIoW9fQE+AQbb5hSfzdBKx7rlgx53FLuYplvSqVLcL
         N68BKeKmGYKulXoBg7GxpcrCS/EvQ37vh6mjFNkPMdlTlmaeGB2m6TqHX0BusJ+NLjKK
         sxBA==
X-Gm-Message-State: APjAAAVwqxtMrOxA9ocq+G9bKx1lxwReKgVat60vV3DXTIJV6uI+N1RR
        QP0cKqXS4uKDmEelAgXZt2kSpXw=
X-Google-Smtp-Source: APXvYqxlnwuzZZPN7FoPjzaNZuoEy12eD5BiM/0kLo5H2570EjbQi+HsQKSAHS88RrQpvYZTb4If7w==
X-Received: by 2002:a05:6830:108a:: with SMTP id y10mr4858935oto.81.1578501585912;
        Wed, 08 Jan 2020 08:39:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm1233928ote.80.2020.01.08.08.39.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:39:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:39:43 -0600
Date:   Wed, 8 Jan 2020 10:39:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shyam Kumar Thella <sthella@codeaurora.org>
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: add binding for QTI SPMI SDAM
Message-ID: <20200108163943.GA26863@bogus>
References: <1577165532-28772-1-git-send-email-sthella@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577165532-28772-1-git-send-email-sthella@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 24, 2019 at 11:02:12AM +0530, Shyam Kumar Thella wrote:
> QTI SDAM allows PMIC peripherals to access the shared memory that is
> available on QTI PMICs. Add documentation for it.
> 
> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
> ---
>  .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> new file mode 100644
> index 0000000..8961a99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

Please spread the word in QCom. 

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/qcom,spmi-sdam.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SPMI SDAM DT bindings
> +
> +maintainers:
> +  - Shyam Kumar Thella <sthella@codeaurora.org>
> +
> +description: |
> +  The SDAM provides scratch register space for the PMIC clients. This
> +  memory can be used by software to store information or communicate
> +  to/from the PBUS.
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,spmi-sdam
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

ranges? The child addresses should be translateable I assume.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Offset and size in bytes within the storage device.
> +
> +      bits:

Needs a type reference. 

> +        maxItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              maximum: 7
> +              description:
> +                Offset in bit within the address range specified by reg.
> +            - minimum: 1

max is 7?

> +              description:
> +                Size in bit within the address range specified by reg.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +      sdam_1: nvram@b000 {
> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         compatible = "qcom,spmi-sdam";
> +          reg = <0xb000 0x100>;
> +
> +          /* Data cells */
> +          restart_reason: restart@50 {
> +              reg = <0x50 0x1>;
> +              bits = <7 2>;

How do you have bit 8 in a 1 byte register?

> +          };
> +      };
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
> 
