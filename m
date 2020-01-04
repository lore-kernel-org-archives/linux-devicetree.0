Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAEDC3F68F
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 435CA24653
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578097811;
	bh=CsP96XdXWPhtHQSYoG9XjJe2AzYmGvUvwdXUhtDcf7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KeQ1Yb0yUAtO0Cbky8zFWmrD+D3HH73ivYZB57/LLakCG2Q9/yfbEWsZjqjPX60hT
	 l65VcjMkVqnVXOb+J2SULXiVE5hVUmPh3wNbEq1UCpUcP6dZGAvTiAuNhrTd6lRQcn
	 bGT8YyjYpXhLraHDbuVxV58+TgOiRlu98LJOIfL4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgADAaK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:30:10 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:42611 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgADAaK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:30:10 -0500
Received: by mail-io1-f65.google.com with SMTP id n11so36373238iom.9
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7In7Tco29iuCsOLy3g6JjgD5lKC+PYNDMM0DSnAitvg=;
        b=Jzuys1q/q4JvVZwAGUSMvPQNUrJLbf32Wx/EjIqam5juEEjzqcFMPSwBH1JDsVSdgI
         n6U3aGswzSAi8QcbUnsLQ0fm9K8SnJE1C/45KPMqUhkwZl0DKkHVNB4rAnCdvWUkwxvF
         RjHGt28jaebuhZEeIb3Nl6MkmL6DA8qToCmk3ut0Sz4wyofEZgjoFO2fzsQ1RIxhpeLA
         0/DqmQhWZWny0Z/6Idc42gXbEequQ1uszBCHyplede7FoIZOkiPUfUicH6fadidpJU4w
         ALOMloF/U7IssMuYX6ng0Yyc31KzHNaFwBPblp+bdmLtn6rqQimpbjJ38EhtbYC0djhz
         llNA==
X-Gm-Message-State: APjAAAWwfUvDG1tUTpq1DPf4HTjRfFjS7SADB5hLSpePPT2IYz62F55/
        aZdvJRYN0VCMhVfS+eLNmpKJBQY=
X-Google-Smtp-Source: APXvYqxj/u2IpwVnmdTz84Y0VxgXyCTgeoxHufIb9ZNzHwD7akUW8O52sp8hNPyvDY5GeAEk3eYodg==
X-Received: by 2002:a5d:814f:: with SMTP id f15mr60206992ioo.275.1578097809297;
        Fri, 03 Jan 2020 16:30:09 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id l83sm21538907ild.34.2020.01.03.16.30.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:30:09 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:28:06 -0700
Date:   Fri, 3 Jan 2020 17:28:06 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Message-ID: <20200104002806.GA24214@bogus>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 27, 2019 at 02:36:41PM +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> new file mode 100644
> index 00000000..2b2c526
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Amlogic, Inc
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic A1 USB2 PHY
> +
> +maintainers:
> +  - Yue Wang <yue.wang@amlogic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-usb2-phy

Use 'const' if there's only 1.

> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy

Don't need *-names when there's a single entry.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +     maxItems: 1
> +     description:
> +       a phandle to respective power domain node as described by generic
> +       PM domain bindings (see power/power_domain.txt for more information).

Drop the generic description. No need to duplicate everywhere.

> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +  - power-domains
> +
> +examples:
> +  - |
> +    usb2_phy1: phy@40000 {
> +      status = "okay";
> +      compatible = "amlogic,a1-usb2-phy";
> +      reg = <0x0 0x40000 0x0 0x2000>;
> +      resets = <&reset RESET_USBPHY>;
> +      reset-names = "phy";
> +      #phy-cells = <0>;
> +      power-domains = <&pwrc PWRC_USB_ID>;
> +    };
> -- 
> 2.7.4
> 
