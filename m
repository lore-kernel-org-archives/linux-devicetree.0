Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B796C2D0CF
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 07:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2736A20733
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 07:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ha9L17WA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfLPHQv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 02:16:51 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:33243 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfLPHQu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 02:16:50 -0500
Received: by mail-il1-f196.google.com with SMTP id r81so4656153ilk.0
        for <devicetree@vger.kernel.org>; Sun, 15 Dec 2019 23:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DdW2X0TaM/Yjl1cs8WJAfaWb8b937afv0ai4eAXIEbQ=;
        b=ha9L17WAZBqCDEiESxhWvrNiQOpHmRyoVhTON48lus8d3oYRR3rIxvfPGWw1YPCSrl
         wYa2PqtQQIyQ65YCU6knRNnaLZxgn8GLNj4kMLfTA/FhkTmPaZPvLA9hUUNHoEk3G9As
         09om+raRs1ka5EgN3yL7DTjgKQLTiYDsNjVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DdW2X0TaM/Yjl1cs8WJAfaWb8b937afv0ai4eAXIEbQ=;
        b=uBxBeakza3eBgGHy/CoRPzFBBvSfK3Di6Q/kwb7BiHG4L7Nxuq955t/XIt+toaSJ+t
         m7oExpxPlcQNGPuo3SMtDCEFqrsZ0LaT2/fmc7Jypu1OjreS8rf08yrOtAvqOiYlK1Sb
         qZMMNdw/CgySfsXxbOHkjEHJTTbfOUIekmaNrBEL09IR6Nu1Ynh8qHpXl5PNN07ECbN8
         k8dLAlGa4jk118qxPliuBv85CPaMMs3A00bbBmOBLzZ1KMYmlSG+mCrn8bsqZj7W5ZNr
         GUdtsLj52BVH8YL9l/8V73eeFHYs1rsY7lOACogiqDNXUe9wcCvOVqBkwv+ZVSKdNdqQ
         ezzg==
X-Gm-Message-State: APjAAAUafqZiOyVgL6DwjbP9BRHu7ExRWKrWsW/NqGRjPEPXspvY5BNt
        44O158U39/oLWlQIWA5Q0JvQHcz42MeXuiayHaleOQ==
X-Google-Smtp-Source: APXvYqx3LVRZM6HCeLKsjVRJpN93LQNOQCxa7ygHr779jDj9jz6qFUfOmbd97fsgpcFQeRAI55T1yDrqMsqHtxzf2MY=
X-Received: by 2002:a92:5d88:: with SMTP id e8mr11295212ilg.106.1576480608958;
 Sun, 15 Dec 2019 23:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org> <20191211061911.238393-4-hsinyi@chromium.org>
 <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 16 Dec 2019 15:16:23 +0800
Message-ID: <CAJMQK-iwF78=2PDMxp=cvS3sotNi7kjj1ZoVO9q_axejUPdLYA@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux binding
To:     Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

On Sat, Dec 14, 2019 at 5:29 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Dec 11, 2019 at 12:19 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Add bindings for Generic GPIO mux driver.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change from RFC to v1:
> > - txt to yaml
> > ---
> >  .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > new file mode 100644
> > index 000000000000..cef098749066
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic display mux (1 input, 2 outputs)
>
> What makes it generic? Doesn't the mux chip have power supply,
> possibly a reset line or not, etc.? What about a mux where the GPIO
> controls the mux?
>
> Generally, we avoid 'generic' bindings because h/w is rarely generic.
> You can have a generic driver which works on multiple devices.
>
Then how about making it mt8173-oak-gpio-mux? Since this is currently
only used in this board.

> > +
> > +maintainers:
> > +  - Nicolas Boichat <drinkcat@chromium.org>
> > +
> > +description: |
> > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > +  its status is read back using a GPIO.
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-display-mux
> > +
> > +  detect-gpios:
> > +    maxItems: 1
> > +    description: GPIO that indicates the active output
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: |
> > +          Video port for input.
> > +
> > +      port@1:
> > +        type: object
> > +        description: |
> > +          2 video ports for output.
> > +          The reg value in the endpoints matches the GPIO status: when
> > +          GPIO is asserted, endpoint with reg value <1> is selected.
>
> You should describe 'endpoint@0' and 'endpoint@1' here too.
Will add in next version, thanks
>
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - detect-gpios
> > +  - ports
> > +
> > +examples:
> > +  - |
> > +    hdmi_mux: hdmi_mux {
> > +      compatible = "gpio-display-mux";
> > +      status = "okay";
>
> Don't show status in examples.
>
> > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > +      pinctrl-names = "default";
> > +      pinctrl-0 = <&hdmi_mux_pins>;
> > +      ddc-i2c-bus = <&hdmiddc0>;
>
> Not documented. Is the i2c bus muxed too? If not, then this is in the
> wrong place.
>
It's muxed, but this is required because of [1], so it should be
removed in this example.

[1]https://elixir.bootlin.com/linux/v5.5-rc2/source/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt#L24
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 { /* input */
> > +          reg = <0>;
> > +
> > +          hdmi_mux_in: endpoint {
> > +            remote-endpoint = <&hdmi0_out>;
> > +          };
> > +        };
> > +
> > +        port@1 { /* output */
> > +          reg = <1>;
> > +
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          hdmi_mux_out_anx: endpoint@0 {
> > +            reg = <0>;
> > +            remote-endpoint = <&anx7688_in>;
> > +          };
> > +
> > +          hdmi_mux_out_hdmi: endpoint@1 {
> > +            reg = <1>;
> > +            remote-endpoint = <&hdmi_connector_in>;
> > +          };
> > +        };
> > +      };
> > +    };
> > --
> > 2.24.0.525.g8f36a354ae-goog
> >
