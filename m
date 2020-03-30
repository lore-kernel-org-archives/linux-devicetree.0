Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DA3C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 06:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 742DA20658
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 06:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byT58HNq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbgC3Gjl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 02:39:41 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42790 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgC3Gjl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 02:39:41 -0400
Received: by mail-io1-f65.google.com with SMTP id q128so16478180iof.9;
        Sun, 29 Mar 2020 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+mJEjSfvlZ8eVkOaUf8bdXaxlPzn5EXb7TwUHOw3sE=;
        b=byT58HNqv/UmMLjhy8Lje7GGwT6k1BATM9vdYVxqklq8KNwM5gpRiaFPgeKpLDSxX7
         xYDsNU+1egnAeELdEgjHMKknMFSk6xmoTbTWGRlUHnJW6g+awkBAx0vw8DPpAWmnINUY
         AeNQZgwrE+Y54Du17o7rsd7wuxTxIXRVh8RTFC3lDloW5CEvN+o4d5kGvoZRtyCNZIxr
         ZZcujOCMVHbJRkhzdtaz/E94i+79dqktH1ONqHBx6h9NhF5sjfOy9BpPx310BKVWFv+q
         Z/BFVB9CbYqwxe9TdHiWRxAeY51bwjbOi3E00kp+QlKsDoo95ZGC35pAv2nZcPxRoHCv
         8Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+mJEjSfvlZ8eVkOaUf8bdXaxlPzn5EXb7TwUHOw3sE=;
        b=Qc/Jg0/9DGaa2gH6/zwZTN6nAHe/ptXy6uATpC7HV8yQGZLcqTlJvgD56nkrdEnxA6
         Xyy+Zt2EcNeDR32sLU4/x823Pn5tdfGnFRUY706aEnlIciTTh2TyzZpmbTjNmYMt+Ixo
         2dLPr4n5ZtqBJCDf5Frl3HauLavtRTnwljss2LumH7icVaIUcnXPKIAobiYJuCaFKWtt
         q85JI5H/Zz6XYi48AQY4ZCM7oIKCgaTXQjWlXRdJ2JYb30ByVrZve61JG7AqVyVDNMeH
         kOTZvHepcsIH/b8Tsw4+O4OjKGUlO2WGNhjGZpOo/vZJSqIJMQn7tMZc9XAN6tah17Lh
         +Vgw==
X-Gm-Message-State: ANhLgQ1NFakV9tXgawMaTNPhTw+5JHxg+ktO2GJ3yRTZJTJyVOxGPY9N
        3sJ/G7UrFioL592fLjhYwDeae2+S/bY8Z3FAf7Nz9w==
X-Google-Smtp-Source: ADFU+vtTKfKSpGioxrZp10waa2K1Q/h65CWU+rx0AAwGswXwD7LmfS9EMe9t45crVH2mOH0Mug2oxl9z+HcQ+kRTO/I=
X-Received: by 2002:a5d:8d89:: with SMTP id b9mr9550859ioj.156.1585550378973;
 Sun, 29 Mar 2020 23:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200324071030.19801-1-peter.chen@nxp.com> <20200324071030.19801-2-peter.chen@nxp.com>
In-Reply-To: <20200324071030.19801-2-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 30 Mar 2020 14:39:28 +0800
Message-ID: <CAL411-oMsKDFjtcwMSKURuHgPYjPoHVzdHdaue_v+JTcNayBxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, "ABRAHAM, KISHON VIJAY" <kishon@ti.com>,
        devicetree@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        jun.li@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Fix more schema errors
>
>  .../bindings/phy/cdns,salvo-phy.yaml          | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> new file mode 100644
> index 000000000000..a36e21e1808c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/cdns,salvo-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence SALVO PHY
> +
> +maintainers:
> +  - Peter Chen <peter.chen@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,salvo-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: salvo_phy_clk
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    usb3phy: usb3-phy@5B160000 {
> +        compatible = "nxp,salvo-phy";
> +        reg = <0x5B160000 0x40000>;
> +        clocks = <&usb3_lpcg 4>;
> +        clock-names = "salvo_phy_clk";
> +        power-domains = <&pd IMX_SC_R_USB_2_PHY>;
> +        #phy-cells = <0>;
> +    };
> --
> 2.17.1
>

A gental ping :)

Peter
