Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D4C32767
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 460C324655
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578097474;
	bh=EGp+TvV6PwfbirwSPv1b1DDAEdNU47BRsj035pCBmZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V0mSWBl9m03GEO8Bsyg78u1FC3t9NYLkRtInlo5DLxMyqN7xANBshhBV0hIWz0ODP
	 RZfiah4zUKOt64NORspcCZEUuHoTDjIrV41VrlAw0uDeTAq+W4g9LRA7OLLf1Pdx/i
	 XNtXIIMymPwUR92Rutq46ls4j3LZ/NXs4+VjVJFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgADAYd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:24:33 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34827 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgADAYd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:24:33 -0500
Received: by mail-io1-f67.google.com with SMTP id v18so43133540iol.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RHzS3lmjvqBu923Z3jA1u6CAnoZKf0aTLGdAiWMkzuM=;
        b=aCN7Vkzo/OZgoymeyp2foQafhuz1WPZl7/M+YxNd1IiyGLfHrmfXr1fRbI+VOKH40J
         5Aia16v0eNGNu2nIW1DXYMldxrY/+3XJw6gHzt94qvUtwTpl/IC555uTX9Y1UPoRqoke
         Q8AT9XprAfSLyzHhfloDD/aX6GwlcgKEL2TW/0DvsjPldqnToGEQqyk0X1gR3QsH9n2y
         10/XLmq5H45bkDkdEWvhOQFU1E6jR+NyLbbzrqlHUKnA6ZjRgDR8rBtplW78FSEirVB7
         jOF3w5SjiuqvDekft+2JvMnAOZot2VDo2mcXKBy/bqfH/hsLrpBh7Z1o+xp0xSBbOXYp
         nKUQ==
X-Gm-Message-State: APjAAAUFEK0MAZIWD8fjSA1hYaNwTxz+LovD1eqvbPY1SgGP2hvSD/1f
        7e57BqhFMELp07BoVf5XCbmxEjE=
X-Google-Smtp-Source: APXvYqxbZFzhkk8Vkwg9E350a6LzbGrDauGNRV4Jr5s3OnNZgKAmKhrzRvYfWMpLFFzwO1dscXGGAg==
X-Received: by 2002:a02:2446:: with SMTP id q6mr68782110jae.78.1578097472797;
        Fri, 03 Jan 2020 16:24:32 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z15sm21383740ill.20.2020.01.03.16.24.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:24:31 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:24:29 -0700
Date:   Fri, 3 Jan 2020 17:24:29 -0700
From:   Rob Herring <robh@kernel.org>
To:     Remi Pommarel <repk@triplefau.lt>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yue Wang <yue.wang@Amlogic.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: Add AXG PCIE PHY bindings
Message-ID: <20200104002429.GA18966@bogus>
References: <20191224173942.18160-1-repk@triplefau.lt>
 <20191224173942.18160-6-repk@triplefau.lt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224173942.18160-6-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 24, 2019 at 06:39:42PM +0100, Remi Pommarel wrote:
> Add documentation for PCIE PHYs found in AXG SoCs.
> 
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> new file mode 100644
> index 000000000000..c622a1b38ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-axg-pcie.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic AXG PCIE PHY
> +
> +maintainers:
> +  - Remi Pommarel <repk@triplefau.lt>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-pcie-phy

Do you expect another compatible? If not, use 'const' instead.

> +
> +  reg:
> +    maxItems: 1
> +
> +  aml,hhi-gpr:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy

You don't need *-names when there's only one entry.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - aml,hhi-gpr
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +examples:
> +  - |
> +    pcie_phy: pcie-phy@ff644000 {
> +          compatible = "amlogic,axg-pcie-phy";
> +          reg = <0x0 0xff644000 0x0 0x2000>;
> +          aml,hhi-gpr = <&sysctrl>;
> +          resets = <&reset RESET_PCIE_PHY>;
> +          reset-names = "phy";
> +          #phy-cells = <0>;
> +    };
> -- 
> 2.24.0
> 
