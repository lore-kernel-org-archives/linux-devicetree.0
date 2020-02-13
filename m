Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055E6C352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1225218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581625932;
	bh=s6hNakGk8DlI2Hml+xfexVBE89u4vI8XO7PqrZIAoig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=KZtUKLDdAV4aggIQ0fta6hoEuU5mkRSYOWqOW3ami5gmVFejQKygCvO97Oh20TTTG
	 sMrcJilYXdHnJmDj/FU7+TTweQDdge1JJetD4IkyWf5gwZYBUsgbGRpLxZeubKc7GN
	 KeH95NHTLVao3nAMSvASefEaI3JIebosCS1VMYtY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgBMUcM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 15:32:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:43658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgBMUcM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 15:32:12 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6226218AC
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625930;
        bh=s6hNakGk8DlI2Hml+xfexVBE89u4vI8XO7PqrZIAoig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K8y1sJoJ2C3Y/W9TThaditY5B63QrEG502WAiXETkhOFCE8/66YUW6EUCOg3vXInU
         H0d8YQ51jYewfRoF9TcGvNDP+G9jHRe7XQrizH6XZXuvN5QBST9gvJq1w9pdeh56Un
         ZF8SqnxlfS69ew0gJ/7b5bOk0Pwx7iR3CEUbEJUQ=
Received: by mail-qk1-f169.google.com with SMTP id w25so7054092qki.3
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 12:32:10 -0800 (PST)
X-Gm-Message-State: APjAAAVzfN1fkvnARhEy4nmMyU0cu1/acOu6W8WqIRL30b08Rq+DDVZy
        Ih94C7zEv7a35eaTR2CO5sMHya9JH0tprRa+RA==
X-Google-Smtp-Source: APXvYqy6UPBCM+/cAO8IS299fsQ6zI91H9yLFW9wXNsDzsB5RIzaiAPn6ppjU4UuYJwys2PBtMGp1gyUFULWWr55CeA=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr17727937qkd.223.1581625929896;
 Thu, 13 Feb 2020 12:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20200213124620.34982-1-linus.walleij@linaro.org>
In-Reply-To: <20200213124620.34982-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 13 Feb 2020 14:31:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJqP=DfTBQsshgZBwLaOk1uYtXOvb796Ya1K-UCyG3bCg@mail.gmail.com>
Message-ID: <CAL_JsqJqP=DfTBQsshgZBwLaOk1uYtXOvb796Ya1K-UCyG3bCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: Add DT bindings for Integrator/AP logical modules
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 6:46 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds YAML device tree bindings for the Integrator/AP
> logical modules. These are plug-in tiles used typically for
> FPGA prototyping.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/bus/arm,integrator-ap-lm.yaml    | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
>
> diff --git a/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> new file mode 100644
> index 000000000000..dfabfa466c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/arm,integrator-ap-lm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Integrator/AP Logical Module extension bus
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: The Integrator/AP is a prototyping platform and as such has a
> +  site for stacking up to four logical modules (LM) designed specifically for
> +  use with this platform. A special system controller register can be read to
> +  determine if a logical module is connected at index 0, 1, 2 or 3. The logical
> +  module connector is described in this binding. The logical modules per se
> +  then have their own specific per-module bindings and they will be described
> +  as subnodes under this logical module extension bus.
> +
> +properties:
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  compatible:
> +    items:
> +      - const: arm,integrator-ap-lm
> +
> +  ranges: true
> +  dma-ranges: true
> +
> +patternProperties:
> +  "^.*@[0-3],[0-9a-f]+$":
> +    description: Nodes on the Logical Module bus represent logical modules
> +      and are named with index,relative-address. The first module is at
> +      0x00000000, the second at 0x10000000 and so on until the top of the
> +      memory of the system at 0xffffffff.

What's the point of the index if the address alone is enough?

> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible

'reg' should be required given a unit address is.

> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    external-bus@c0000000 {

Node names should be generic:

bus@...

> +      compatible = "arm,integrator-ap-lm";
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <0 0x0 0xc0000000 0x10000000>,
> +               <1 0x0 0xd0000000 0x10000000>,
> +               <2 0x0 0xe0000000 0x10000000>,
> +               <3 0x0 0xf0000000 0x10000000>;
> +      dma-ranges = <0 0x0 0xc0000000 0x10000000>,
> +               <1 0x0 0xd0000000 0x10000000>,
> +               <2 0x0 0xe0000000 0x10000000>,
> +               <3 0x0 0xf0000000 0x10000000>;
> +      im-pd1@0,0 {

bus@...

> +        compatible = "simple-bus";
> +        ranges = <0 0 0 0x10000000>;
> +        dma-ranges = <0 0 0 0x10000000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        uart@c0100000 {

serial@100000

> +          compatible = "arm,pl011", "arm,primecell";
> +          reg = <0x00100000 0x1000>;
> +          interrupts-extended = <&impd1_vic 1>;
> +        };
> +
> +        impd1_vic: interrupt-controller@c3000000 {
> +          compatible = "arm,pl192-vic";
> +          interrupt-controller;
> +          #interrupt-cells = <1>;
> +          reg = <0x03000000 0x1000>;
> +          valid-mask = <0x00000bff>;
> +          interrupts-extended = <&pic 9>;
> +        };
> +      };
> +    };
> +
> +additionalProperties: false
> --
> 2.23.0
>
