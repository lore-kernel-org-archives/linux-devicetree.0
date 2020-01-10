Return-Path: <SRS0=Jntx=27=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494D1C33CA3
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 15:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1748220721
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jan 2020 15:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vRay9pvF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgAJPhC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jan 2020 10:37:02 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56044 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbgAJPhC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jan 2020 10:37:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so2460449wmj.5
        for <devicetree@vger.kernel.org>; Fri, 10 Jan 2020 07:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=pEddeOiXJFcjUAbR7H9RaoBSbQx3hSBx3dFhHIC3P9A=;
        b=vRay9pvF3Zmr+rpl6zT5EZiGH0qGpBk8haDxTuGjq30RxDXk29mHCiY/1I6BmPe/s0
         6oCiokpUOrptCo5UKbfe1R45I8H85IKWEa/krQUDtvQrVnyp3ThoHIMQmya/HxNjNhx9
         dyeLepzaVDmRjEFT4YjqE8RJj+jZVDRqU/KZ8IvcsjfvS+AIWgvOCysh/huOUmmhTdpA
         7WCsf9iN4DEc3UaCWGOn2Dg9HmvYl7g0r3QnorYAthcjA7ZgvWFhwhxWpESaMpdCz0Oz
         Z15wbsGKjP6FazqS3yuA/hoe1BbFenY98F9HnJAP4YWlbLnw/iMcH+Ef7cRXVXjwG/u+
         mKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=pEddeOiXJFcjUAbR7H9RaoBSbQx3hSBx3dFhHIC3P9A=;
        b=gXTZ6u+IjqPAEf79qWiMXEemDjtay3Oyjwr9VLObVUCSUAl9uEJ+EmeiSAsJqcOKLc
         DNbNwUXExGQZex3qA4+IXST9KV5gAyWCRswJ++H8N3LIoQyTJ7LT6sOE7GDF1SAXN2k9
         ZsnEQCQqT3zK6pB/s/ESxU54ofUyIjNxu7YidvEV/NMqVLEWOuNSitDKiQxNfVzEmkOq
         sY6pcYXF5kxqoTG/y65AVEPLRd9JJF4bWfGBXNC9t+divk9ov1f0F+HLXS7Af9QiDSrQ
         thsl9xypneVD9TFUOWhaQ2OmA7FYkdES6oIIhQMtaLgDxiF7GBYePXBc0JXVT8qOQkNa
         W+Nw==
X-Gm-Message-State: APjAAAVTO6IDFGEE8FBuoERTIXQ4+Y2vrNsuK1CaIEyEeIs3qSi9QDVv
        cPFB+0yMMaz3HpFea1lXCR6xtw==
X-Google-Smtp-Source: APXvYqzc2nGXd7108Ds+0oMWW/Y8cJyrznk+PHcBCjP73lPCIDH7xnnVC1cTGqjJbnfhtg//qCC3KQ==
X-Received: by 2002:a1c:4454:: with SMTP id r81mr4959259wma.117.1578670619718;
        Fri, 10 Jan 2020 07:36:59 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s16sm2586587wrn.78.2020.01.10.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 07:36:59 -0800 (PST)
References: <20191227094606.143637-1-jian.hu@amlogic.com> <20191227094606.143637-2-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: meson: add A1 PLL clock controller bindings
In-reply-to: <20191227094606.143637-2-jian.hu@amlogic.com>
Date:   Fri, 10 Jan 2020 16:36:58 +0100
Message-ID: <1jftgnz5k5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Fri 27 Dec 2019 at 10:46, Jian Hu <jian.hu@amlogic.com> wrote:

Please read Documentation/devicetree/writing-schema.rst, run the test and
make the necessary correction.

> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 54 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> new file mode 100644
> index 000000000000..7a327bb174b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-pll-clkc
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +clocks:
> +  maxItems: 2
> +  items:
> +   - description: Input xtal_fixpll
> +   - description: Input xtal_hifipll
> +
> +clock-names:
> +  maxItems: 2
> +  items:
> +     - const: xtal_fixpll
> +     - const: xtal_hifipll
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: pll-clock-controller@7c80 {
> +                compatible = "amlogic,a1-pll-clkc";
> +                reg = <0 0x7c80 0 0x18c>;
> +                #clock-cells = <1>;
> +                clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
> +                         <&clkc_periphs CLKID_XTAL_HIFIPLL>;
> +                clock-names = "xtal_fixpll", "xtal_hifipll";
> +    };
> diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h
> new file mode 100644
> index 000000000000..58eae237e503
> --- /dev/null
> +++ b/include/dt-bindings/clock/a1-pll-clkc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __A1_PLL_CLKC_H
> +#define __A1_PLL_CLKC_H
> +
> +#define CLKID_FIXED_PLL				1
> +#define CLKID_FCLK_DIV2				6
> +#define CLKID_FCLK_DIV3				7
> +#define CLKID_FCLK_DIV5				8
> +#define CLKID_FCLK_DIV7				9
> +#define CLKID_HIFI_PLL				10
> +
> +#endif /* __A1_PLL_CLKC_H */

