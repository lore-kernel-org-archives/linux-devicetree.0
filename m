Return-Path: <SRS0=4wOv=AI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8EFC433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 27 Jun 2020 10:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51DB220724
	for <linux-devicetree@archiver.kernel.org>; Sat, 27 Jun 2020 10:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgF0KuT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 27 Jun 2020 06:50:19 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:39912 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgF0KuT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 27 Jun 2020 06:50:19 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4D14F2005F;
        Sat, 27 Jun 2020 12:50:11 +0200 (CEST)
Date:   Sat, 27 Jun 2020 12:50:10 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: vc4: dpi: Fix panel warning
Message-ID: <20200627105010.GA1960474@ravnborg.org>
References: <20200626121131.127192-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626121131.127192-1-maxime@cerno.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=OlaJlmAoxkmIKoYBwpAA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
        a=nt3jZW36AmriUCFCBwmW:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 02:11:31PM +0200, Maxime Ripard wrote:
> The example used in the DPI binding before the conversion to YAML had a
> simple-panel example that got carried over to the YAML binding.
> 
> However, that example doesn't match the simple-panel binding and results in
> validation errors. Since it's only marginally helpful, let's remove that
> part of the example entirely.
> 
> Fixes: 094536003e06 ("dt-bindings: display: Convert VC4 bindings to schemas")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/brcm,bcm2835-dpi.yaml  | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> index 58213c564e03..5c1024bbc1b3 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> @@ -45,16 +45,6 @@ examples:
>    - |
>      #include <dt-bindings/clock/bcm2835.h>
>  
> -    panel: panel {
> -        compatible = "ontat,yx700wv03", "simple-panel";
> -
> -        port {
> -            panel_in: endpoint {
> -                remote-endpoint = <&dpi_out>;
> -            };
> -        };
> -    };
> -
>      dpi: dpi@7e208000 {
>          compatible = "brcm,bcm2835-dpi";
>          reg = <0x7e208000 0x8c>;
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
