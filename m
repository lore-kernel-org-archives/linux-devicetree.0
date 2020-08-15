Return-Path: <SRS0=VFNs=BZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F35C433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 15 Aug 2020 21:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C84B223B24
	for <linux-devicetree@archiver.kernel.org>; Sat, 15 Aug 2020 21:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgHOVhV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 15 Aug 2020 17:37:21 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:52714 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbgHOVhU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 15 Aug 2020 17:37:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id D21A2FB06;
        Sat, 15 Aug 2020 23:28:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YqhX1GbzLJgS; Sat, 15 Aug 2020 23:28:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 8EE4B4576F; Sat, 15 Aug 2020 23:28:38 +0200 (CEST)
Date:   Sat, 15 Aug 2020 23:28:38 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200815212838.GC134339@bogon.m.sigxcpu.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,
On Thu, Aug 13, 2020 at 04:29:05AM +0300, Laurent Pinchart wrote:
> When the PCB routes the display data signals in an unconventional way,
> the output bus width may differ from the bus width of the connected
> panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> 
> Add a bus-width property to describe this data routing.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> index ec6533b1d4a3..d15bb8edc29f 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -58,6 +58,18 @@ properties:
>          type: object
>  
>          properties:
> +          data-shift:
Shouldn't that be bus-width ?
 -- Guido

> +            enum: [16, 18, 24]
> +            description: |
> +              The output bus width. This value overrides the configuration
> +              derived from the connected device (encoder or panel). It should
> +              only be specified when PCB routing of the data signals require a
> +              different bus width on the LCDIF and the connected device. For
> +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> +              LCD_DATA[17:12], bus-width should be set to 24.
> +
>            remote-endpoint:
>              $ref: /schemas/types.yaml#/definitions/phandle
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
