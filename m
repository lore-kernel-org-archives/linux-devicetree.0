Return-Path: <SRS0=dP36=WL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46905 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfHOFgY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2019 01:36:24 -0400
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au> <20190807003629.2974-2-andrew@aj.id.au>
In-Reply-To: <20190807003629.2974-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Aug 2019 05:36:11 +0000
Message-ID: <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Document Aspeed SD controller
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, adrian.hunter@intel.com, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ryan Chen <ryanchen.aspeed@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> data bus if only a single slot is enabled.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Two minor comments below.

> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later

No "Copyright IBM" ?

> +%YAML 1.2
> +---

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2500-sd-controller";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges = <0 0x1e740000 0x10000>;

According to the datasheet this could be 0x20000. It does not matter
though, as there's nothing in it past 0x300.

Cheers,

Joel
