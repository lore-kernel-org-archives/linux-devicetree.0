Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9BEC43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 03:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2A7F2467F
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 03:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JJtfIKZ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfLTDvg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 22:51:36 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39697 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbfLTDvg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 22:51:36 -0500
Received: by mail-il1-f195.google.com with SMTP id x5so6771985ila.6
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 19:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6r/8NIk3RYdI6wFY0dB/seZoz3Q74hZA4zM4nK3WDAo=;
        b=JJtfIKZ6x/JIgDR5/VOL2xi9eryZpZ3n8J+MQt9kquUUhFoqUm+r5CrtZlMdpJ/FXD
         yzcNGtFI5asTB3gRXgoea+0JTHZydQYywtTjAa5gneKcM9z78vYFIu0dIRfto9WEi4U5
         fu4iXF/1vyRYlSjH6UEr0B9THzWR0RgYdMBEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6r/8NIk3RYdI6wFY0dB/seZoz3Q74hZA4zM4nK3WDAo=;
        b=GigWAES43deveSFB1YqQCQm91qnTU7l+QneOp+s7VaZy5/8YqP3IETjXKM209QdUSB
         55SIRQA7sBgJ7dMBnoeSzPIS6h5LTkcT/8dsCai+5NmchthcNXV3sAn4DM0Br8sFLIjM
         sERdLf78mHabUWVaduR1MsZI2ghPDXdvAEgCoIVO5xyBAqIZR4c5UFF8f1cSoLBAWO9O
         +WL2+vG9nLzbPvBgdGXomt0q4q5qQwagncyJ6crVSsJwkQR+foy2l4ff8yRCdcxS88ek
         1qUltyVTo7rE+Ih0yiuuh3bHMNDwxh3aGIXAJTaM3R5OuSnmPdQpzR6l+sPdKGROHOCg
         ZyXw==
X-Gm-Message-State: APjAAAWdcCB7FVx1LYymH/G90Th0XH3dEbkg1/vuv0Z4hCuDtrBi5ppB
        UfK/9NX9i6G2bmsfxYA6JnpqiMoI251BWhyDKkObLA==
X-Google-Smtp-Source: APXvYqyndRV+iEzKuq/l9AzfCSdSOFPEKgF32LyHvX4lpMzRKalBaQGQ9YDmLQzKVfLdX3rry9VxuHbcThX6Zg70M4A=
X-Received: by 2002:a92:d610:: with SMTP id w16mr10176825ilm.283.1576813895178;
 Thu, 19 Dec 2019 19:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org> <20191211061911.238393-2-hsinyi@chromium.org>
 <20191219204524.GA7841@bogus> <CAJMQK-gYFJ-F9_rkPsxXS+qc40OwU-di2tdLLbL7x=smbRNujw@mail.gmail.com>
 <20191220032238.GA5342@pendragon.ideasonboard.com>
In-Reply-To: <20191220032238.GA5342@pendragon.ideasonboard.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 20 Dec 2019 11:51:09 +0800
Message-ID: <CAJMQK-j1GPxipMkba1VO3xCEOiLJi4ibotKFeRSGZ0e6nOG3Ng@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 20, 2019 at 11:22 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi,
>
> On Fri, Dec 20, 2019 at 11:20:13AM +0800, Hsin-Yi Wang wrote:
> > On Fri, Dec 20, 2019 at 4:45 AM Rob Herring wrote:
> > > On Wed, Dec 11, 2019 at 02:19:08PM +0800, Hsin-Yi Wang wrote:
> > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > >
> > > > Add support for analogix,anx7688
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > > Change from RFC to v1:
> > > > - txt to yaml
> > > > ---
> > > >  .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
> > > >  1 file changed, 60 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > > new file mode 100644
> > > > index 000000000000..cf79f7cf8fdf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
> > > > +
> > > > +maintainers:
> > > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > > +
> > > > +description: |
> > > > +  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
> > > > +  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
> > > > +  resolution from a smartphone or tablet with full function USB-C.
> > > > +
> > > > +  This binding only describes the HDMI to DP display bridge.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: analogix,anx7688
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +    description: I2C address of the device
> > > > +
> > > > +  ports:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        type: object
> > > > +        description: |
> > > > +          Video port for HDMI input
> > > > +
> > > > +      port@1:
> > > > +        type: object
> > > > +        description: |
> > > > +          Video port for eDP output
> > > > +
> > > > +    required:
> > > > +      - port@0
> > >
> > > Sometimes you have no output?
> >
> > Yes, only input is required.
>
> But what happens in that case ? What's the use of a bridge with a
> non-connected output ? :-)
>
There's output connected, but doesn't need a driver. For example, in
our use case it's connected to a usb-c connector. We don't need to
state it in dts.
I also checked https://elixir.bootlin.com/linux/v5.5-rc2/source/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
and thought that output could be optional. Also
https://elixir.bootlin.com/linux/v5.5-rc2/source/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts#L116
Or maybe we can add output in example as anx6345?
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - ports
> > >
> > > The example will have errors because it is missing 'ports'. Run 'make
> > > dt_binding_check'.
> > >
> > > Add:
> > >
> > > additionalProperties: false
> > >
> >
> > Ack, will fix this. Thanks
> >
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    anx7688: anx7688@2c {
> > > > +      compatible = "analogix,anx7688";
> > > > +      reg = <0x2c>;
> > > > +
> > > > +      port {
> > > > +        anx7688_in: endpoint {
> > > > +          remote-endpoint = <&hdmi0_out>;
> > > > +        };
> > > > +      };
> > > > +    };
>
> --
> Regards,
>
> Laurent Pinchart
