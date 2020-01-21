Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA1EC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 07:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 048C022522
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 07:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579591775;
	bh=qkBSjs+8ufPF7XL8qAf0QcnKCBadVCoM8RLnOVSXrZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bnN4uVO5U2jj4rjZ1jwjKuT4OknlpfizszUanOVvgve9SDCgSkp2Vp/tA1VC8bO54
	 HS7IPRBjy1IJft12KNb/6qJlG8JFFHmcn6whPazgTdwdMYfOR+34HfQ18hQN0Gh32C
	 Uy3cfPVdP4TFy5EIBbS+00yzqb3+g5efTctwTZms=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAUH3e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 02:29:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgAUH3e (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 02:29:34 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0F7721734;
        Tue, 21 Jan 2020 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579591773;
        bh=qkBSjs+8ufPF7XL8qAf0QcnKCBadVCoM8RLnOVSXrZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vbXWSGJ45x04Ff/ti+Nhqn8t0ktcaI5YlVLOxEifVfMoZYEWaJCM9ScZAc2NnWbyE
         9KCTjoQIA++zGPPZBK6MqLHdWeLh3U9zLb9+KWDt41vAsiYmVuxcLtfbQin9BsmGId
         GR56iSawr/BYN2hpAPT+s8Ab5f0KDVwcC/UW4AE8=
Date:   Tue, 21 Jan 2020 08:29:30 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Message-ID: <20200121072930.6qk2ylrb3p4qjfqz@gilmour.lan>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120200641.15047-2-sam@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jan 20, 2020 at 09:06:39PM +0100, Sam Ravnborg wrote:
> Add meta-schema variant of panel-timing and
> reference it from panel-common.yaml.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/panel-common.yaml  |   7 +-
>  .../bindings/display/panel/panel-timing.yaml  | 253 ++++++++++++++++++
>  2 files changed, 256 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-timing.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ef8d8cdfcede..8070c439adbd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -54,13 +54,12 @@ properties:
>
>    # Display Timings
>    panel-timing:
> -    type: object
>      description:
>        Most display panels are restricted to a single resolution and
>        require specific display timings. The panel-timing subnode expresses those
> -      timings as specified in the timing subnode section of the display timing
> -      bindings defined in
> -      Documentation/devicetree/bindings/display/panel/display-timing.txt.
> +      timings.
> +    allOf:
> +      - $ref: panel-timing.yaml#
>
>    # Connectivity
>    port:
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> new file mode 100644
> index 000000000000..59891c7a58ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> @@ -0,0 +1,253 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-timing.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: panel timing bindings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  There are different ways of describing the timing data data of a panel. The
> +  devicetree representation corresponds to the one commonly found in datasheets
> +  for panels. If a panel supports multiple signal timings, the native-mode
> +  can be specified.
> +
> +  The parameters are defined as seen in the following illustration.
> +
> +  +----------+-------------------------------------+----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vback_porch                 |          |       |
> +  |          |        v                            |          |       |
> +  +----------#######################################----------+-------+
> +  |          #        ^                            #          |       |
> +  |          #        |                            #          |       |
> +  |  hback   #        |                            #  hfront  | hsync |
> +  |   porch  #        |       hactive              #  porch   |  len  |
> +  |<-------->#<-------+--------------------------->#<-------->|<----->|
> +  |          #        |                            #          |       |
> +  |          #        |vactive                     #          |       |
> +  |          #        |                            #          |       |
> +  |          #        v                            #          |       |
> +  +----------#######################################----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vfront_porch                |          |       |
> +  |          |        v                            |          |       |
> +  +----------+-------------------------------------+----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vsync_len                   |          |       |
> +  |          |        v                            |          |       |
> +  +----------+-------------------------------------+----------+-------+
> +
> +
> +  The following is the panel timings shown with time on the x-axis.
> +  This matches the timing diagrams often found in data sheets.
> +
> +              Active                 Front           Sync           Back
> +              Region                 Porch                          Porch
> +  <-----------------------><----------------><-------------><-------------->
> +    //////////////////////|
> +   ////////////////////// |
> +  //////////////////////  |..................               ................
> +                                             _______________
> +
> +  Timing can be specified either as a typical value or as a tuple
> +  of min, typ, max values.
> +
> +properties:
> +
> +  clock-frequency:
> +   $ref: /schemas/types.yaml#/definitions/uint32
> +   description: |
> +     Panel clock in Hz
> +
> +  hactive:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +       Horizontal panel resolution in pixels
> +
> +  vactive:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Verical panel resolution in pixels
> +
> +  hfront-porch:
> +    description: |
> +      Horizontal front porch panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of pixels

You have that on a number of occasions, but that could just be an
uint32, right?

> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of pixels

When minItems and maxitems are equal, you can just set one, the other
one will be filled by the DT schemas tools.

> +  hsync-active:
> +    description: |
> +      Horizontal sync pulse.
> +      If omitted then it is not used by the hardware
> +    oneOf:
> +      - const: 0
> +        description: active low
> +      - const: 1
> +        description: active high

You probably should use an enum here (and in other similar
places). oneOf / anyOf / allOF errors are pretty cryptic, while it
will it's really better with an enum.

Thanks!
Maxime
