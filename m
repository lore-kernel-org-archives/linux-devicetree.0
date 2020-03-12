Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A1AC10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 13:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD02220663
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584019170;
	bh=+MMUU8Xne5+2eAsxkj1dA3qRhr6aXsgwB+rUXSYPzE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=M5aa7goaihM4O8XwFhI8SYJ+Da5pTccSc+0JbyroHBGxllg1pvAo1zi2guW9BO0k1
	 RVwFzyN+GXFKagXhZ7QnoqK9jmGt00ShqfcBLbv/zoqYZpZ6RkXJpD1vU30jnEd15o
	 achQqM5MfBAEzSeH0zfwLsm+Rfo2Mm5Y9y6GzvB0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCLNTa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 09:19:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgCLNTa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 09:19:30 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E518E206FA
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584019169;
        bh=+MMUU8Xne5+2eAsxkj1dA3qRhr6aXsgwB+rUXSYPzE0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oBuxXTK+sOvN9xmpujdNIlPjbN6NqPJXk69SVa3NDAaf0FLoROg6xTNK5zAlm/mUZ
         EitYitoXQEaQ2Q8iluxS4/D6etYlloiHcUKqBho2dEyI9YGo7UGXuFSTU5CcyQ8JP+
         GB/KQk4RCmU037Rs58FLIATLrm38aCfCQZkw5tdE=
Received: by mail-qk1-f175.google.com with SMTP id u25so6063723qkk.3
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 06:19:28 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1+CWsjSceK/YIjn71IqiPGAnRVlsb4OkOdMvcc3sZQ62K4VZWp
        iEDyle5kH+J9d8JEBpXmDRmm0ET7PetWi97zaA==
X-Google-Smtp-Source: ADFU+vvNInz9AlidtVdZ0P289xaWlWPKA9exqV+sPaM3Dd1PlNwUy5fkfYtGWYhui8BnHxUJyQeSQb/1xHXWoohpI+Q=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr6952437qke.119.1584019168038;
 Thu, 12 Mar 2020 06:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org> <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Mar 2020 08:19:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL75eu49C9cB4pSekXxow8oFPcPAjTQ8GRhjEH8zkA2jw@mail.gmail.com>
Message-ID: <CAL_JsqL75eu49C9cB4pSekXxow8oFPcPAjTQ8GRhjEH8zkA2jw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 8, 2020 at 6:50 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Fix following type af warnings in the panel bindings:
>
> Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
>
> Removing the "@xxx" from the node name fixed first warning.
> Adding a missing reg property fixed the second warning
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/panel/elida,kd35t133.yaml     | 2 +-
>  .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 2 +-
>  .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 ++--
>  .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
>  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 2 +-
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 2 +-
>  .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
>  .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> index 4bd74eaa61be..aa761f697b7a 100644
> --- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    dsi@ff450000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
>          panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> index 4ebcea7d0c63..2c9b8aa34815 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    dsi@ff450000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
>          panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> index 791fc9daa68b..73d2ff3baaff 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -40,10 +40,10 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>
> -    dsi@a0351000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        panel {
> +        panel@0 {
>              compatible = "hydis,hva40wv1", "novatek,nt35510";
>              reg = <0>;
>              vdd-supply = <&ab8500_ldo_aux4_reg>;
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> index 6e6ac995c27b..4b6dda6dbc0f 100644
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -39,7 +39,7 @@ required:
>
>  examples:
>    - |
> -    dsi@0 {
> +    dsi {
>        #address-cells = <1>;
>        #size-cells = <0>;
>        panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 5275d350f8cb..f63870384c00 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -48,7 +48,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    panel@0 {
> +    panel {
>          compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>          label = "osddisplay";
>          power-supply = <&vcc_supply>;
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 8b60368a2425..cefe19b6bf44 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -50,7 +50,7 @@ required:
>
>  examples:
>    - |
> -    mdss_dsi@fd922800 {
> +    mdss_dsi {

dsi {

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
