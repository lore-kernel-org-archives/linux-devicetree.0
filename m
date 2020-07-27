Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D12EC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 14:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 496A52173E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595860778;
	bh=0tcQc6v/QlJyZg+hGewPPKPn+f8w/hfFvbSyN+QFJiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=RKt4b7uvEMCYc628VpMwSwxbGPBOIm6hsrw8e8rBQEA+C4xfiuGV7pdjAP9SikMjG
	 LTiQm3B1a7YGXZ15Un05HH2picCxaLN3WB3dgbVD9nF2Ynrq0giJfzUzRzt86pGsun
	 wZ6B8b9NHjhm99IwxMMoCMCPlcSQoE492DUG6Nck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732997AbgG0Ojh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 10:39:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729378AbgG0Ojg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 10:39:36 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BE9120719
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595860775;
        bh=0tcQc6v/QlJyZg+hGewPPKPn+f8w/hfFvbSyN+QFJiA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=opp5jJ8pUTUb6VUN4tMPebTbj1NJk5inpkBFtIBfGR+WeyR2p13yNEBKt45mun4sm
         XYyYl7Jn0+TYXdgLwZUP5+S88hiCK+eLytbu/aEowH4Qakckf2Js3NAQp9WT3us157
         EHK2OwoigCShGwxTjwkxbhptrmwQ7nih6kbM8Qt4=
Received: by mail-oi1-f173.google.com with SMTP id s144so4588346oie.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 07:39:35 -0700 (PDT)
X-Gm-Message-State: AOAM532yP1/FAs00x1UMVrxMEtKBQw3SUOXZ4otOfvkRmZd/M8eOoK8D
        Pr/5QPARJyALtTGEa467t2buC77XWDkFIdcTgA==
X-Google-Smtp-Source: ABdhPJw/KLY1oHcWXCeR/axtLDZ8I3twNAIJ3ivC+q4hzvELMfd1+No9etzMfUkzezXN6uA5bdsso7Z16g5ZFyLQi0g=
X-Received: by 2002:aca:30d2:: with SMTP id w201mr18677353oiw.147.1595860774591;
 Mon, 27 Jul 2020 07:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Jul 2020 08:39:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
Message-ID: <CAL_JsqJ8PyuZLXj4bLwyConb+GdH83hjPPj2mHbqNy=w9m-joA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 15, 2020 at 6:31 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switches from .txt base to .yaml base Document.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/87mu4cxlo2.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87o8pf3923.wl-kuninori.morimoto.gx@renesas.com
> ---
> v2 -> v3
>         - add Reviewd-by
>         - add Link
>         - use generic node name on examples
>
>  .../devicetree/bindings/sound/ak4613.txt      | 27 --------
>  .../devicetree/bindings/sound/ak4613.yaml     | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4613.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4613.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/ak4613.txt b/Documentation/devicetree/bindings/sound/ak4613.txt
> deleted file mode 100644
> index 49a2e74fd9cb..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak4613.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -AK4613 I2C transmitter
> -
> -This device supports I2C mode only.
> -
> -Required properties:
> -
> -- compatible : "asahi-kasei,ak4613"
> -- reg : The chip select number on the I2C bus
> -
> -Optional properties:
> -- asahi-kasei,in1-single-end   : Boolean. Indicate input / output pins are single-ended.
> -- asahi-kasei,in2-single-end     rather than differential.
> -- asahi-kasei,out1-single-end
> -- asahi-kasei,out2-single-end
> -- asahi-kasei,out3-single-end
> -- asahi-kasei,out4-single-end
> -- asahi-kasei,out5-single-end
> -- asahi-kasei,out6-single-end
> -
> -Example:
> -
> -&i2c {
> -       ak4613: ak4613@10 {
> -               compatible = "asahi-kasei,ak4613";
> -               reg = <0x10>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/ak4613.yaml
> new file mode 100644
> index 000000000000..5aae6126c540
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ak4613.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ak4613.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK4613 I2C transmitter Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    const: asahi-kasei,ak4613
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  # for OF-graph
> +  port:
> +    $ref: "audio-graph-card.yaml#definitions/port"

This patch is dependent on audio-graph-card.yaml which doesn't exist
and breaks linux-next now.

I haven't seen any follow-up to my audio-graph-card.yaml comments, so
please revert this.

Rob
