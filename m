Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5EEC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 12:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E09E20826
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 12:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgEUMCK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 08:02:10 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43723 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbgEUMCJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 08:02:09 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9272E1C000E;
        Thu, 21 May 2020 12:02:05 +0000 (UTC)
Date:   Thu, 21 May 2020 14:05:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Add missing clock domain description
Message-ID: <20200521120525.m7wskfvgrp572z7t@uno.localdomain>
References: <20200519074229.22308-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200519074229.22308-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

On Tue, May 19, 2020 at 09:42:29AM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>
>     arch/arm/boot/dts/r7s72100-genmai.dt.yaml: camera@e8210000: 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fix this by documenting the missing properties.
> Update the example to match reality.

Thanks for fixing this!

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
> Fixes: 58361eaa11d561f3 ("dt-bindings: media: renesas,ceu: Convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/media/renesas,ceu.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> index f2393458814ee08f..c7e1e4fe67e6696b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> @@ -27,6 +27,12 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
>    port:
>      type: object
>      additionalProperties: false
> @@ -57,6 +63,8 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
> +  - power-domains
>    - port
>
>  additionalProperties: false
> @@ -64,11 +72,14 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r7s72100-clock.h>
>
>      ceu: ceu@e8210000 {
>          reg = <0xe8210000 0x209c>;
>          compatible = "renesas,r7s72100-ceu";
>          interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp6_clks R7S72100_CLK_CEU>;
> +        power-domains = <&cpg_clocks>;
>
>          port {
>              ceu_in: endpoint {
> --
> 2.17.1
>
