Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A50CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 15:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E0C920882
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571670436;
	bh=wGl7QATquLIDX5n6R2hAKc0RLh9u/hVz6Kqsfh5Gz9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gyfB2o98iFMroafehCdZC3WG3KPMLcoK/H788ZPPc4uKUpJ9NNACrdZ0afFd/3MyN
	 +GRtGeUJ/biZWP+UwPA9T5gDbmHyRYK9VVlZpwARX5riK+H3/zyq+DXx5kUsNcL6T+
	 jg0QhukwZT+rC7tTbctptJxwhmWrlQLli2i6D08A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJUPHP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 11:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfJUPHP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 11:07:15 -0400
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com [209.85.161.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B8E320B7C
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571670434;
        bh=wGl7QATquLIDX5n6R2hAKc0RLh9u/hVz6Kqsfh5Gz9I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uJMNvHbzITZ3npFpBBSqaLLSSqfMB765OnPSwxFkm8J16b6SyZ63bhoygKxQWXkeW
         y9FXVWq1730CbiO3l3oC5oqbpAI/wdJbGSOf8LJbXw5NuifZHtigaNbxkf/3jQzEtN
         uAjRXYzxxIYaXKUuX7/KWHMFo4gFv6xDlQ07t//8=
Received: by mail-yw1-f50.google.com with SMTP id k127so3852328ywc.6
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 08:07:14 -0700 (PDT)
X-Gm-Message-State: APjAAAWCyOW8mRCBVwLLFY5dyq4h/uU2leeGQtT8iIwrS6zmTNblnSOk
        +E2np1JFRkVFjeDpQ9tEUOx4AjPAkg2N+3Q5Dw==
X-Google-Smtp-Source: APXvYqwsxYZX+HMgB0QE0XULNxxKwsdXLNUHL6ZzkOsrIIH8XJAQ91DQ5epoTezoMWIkY+do9t8vrEWB3CW1r84c1eM=
X-Received: by 2002:a0d:cac2:: with SMTP id m185mr5127238ywd.386.1571670433271;
 Mon, 21 Oct 2019 08:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191018182446.26131-1-linus.walleij@linaro.org>
In-Reply-To: <20191018182446.26131-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 21 Oct 2019 10:07:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ0Zcqsymqs7W4gZszx60_L7xaQYqoGSDMVxYNB+4kkgQ@mail.gmail.com>
Message-ID: <CAL_JsqJ0Zcqsymqs7W4gZszx60_L7xaQYqoGSDMVxYNB+4kkgQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] drm/panel: Add generic DSI panel YAML bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 18, 2019 at 1:24 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds a starting point for processing and defining generic
> bindings used by DSI panels. We just define one single bool
> property to force the panel into video mode for now.
>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Make a more complete DSI panel binding including the controller
>   and its address-cells and size-cells and a pattern for the panel
>   nodes. The panel is one per DSI master, the reg property is
>   compulsory but should always be 0 (as far as I can tell) as
>   only one panel can be connected. The bus doesn't really have
>   any addresses for the panel, the address/reg notation seems
>   to be cargo-culted from the port graphs and is not necessary
>   to parse some device trees, it is used to tell whether the
>   node is a panel or not rather than any addressing.
> - I have no idea how many displays you can daisychain on a single
>   DSI master, I just guess 15 will be enough. The MIPI-specs
>   are memberwalled. Someone who knows can tell perhaps?
> ChangeLog v1->v2:
> - New patch after feedback.
> ---
>  .../display/panel/panel-dsi-common.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml

Perhaps should be display/dsi-controller.yaml now?

>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml
> new file mode 100644
> index 000000000000..d63f597eff9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-common.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dsi-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for DSI Display Panels
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  This document defines device tree properties common to DSI, Display
> +  Serial Interface panels. It doesn't constitute a device tree binding
> +  specification by itself but is meant to be referenced by device tree
> +  bindings.
> +
> +  When referenced from panel device tree bindings the properties defined in
> +  this document are defined as follows. The panel device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +  Notice: this binding concerns DSI panels connected directly to a master
> +  without any intermediate port graph to the panel. Each DSI master
> +  can control exactly one panel. They should all just have a node "panel"
> +  for their panel with their reg-property set to 0.
> +
> +properties:
> +  $nodename:
> +    pattern: "^dsi-controller(@[0-9a-f]+)?$"

You're assuming a certain unit-address format when a dsi-controller
could be on any bus. So use '^dsi-controller(@.*)?$

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^panel$":

But here we want to define the unit-address format. The address is the
virtual channel # which can be 0-3:

^panel@[0-3]$

> +    type: object
> +
> +    properties:
> +      reg:
> +        const: 0

minimum: 0
maximum: 3

> +        description:
> +          Only one panel can be connected to each DSI controller, but for

I thought it was up to 4 virtual channels?

> +          historical reasons, the reg property must be specified, as the
> +          DSI controller can contain other child nodes, and operating
> +          systems will identify which child node is the panel by looking
> +          for the reg property. It should however always be set to 0.
> +
> +      enforce-video-mode:
> +        type: boolean
> +        description:
> +          The best option is usually to run a panel in command mode, as this
> +          gives better control over the panel hardware. However for different
> +          reasons like broken hardware, missing features or testing, it may be
> +          useful to be able to force a command mode-capable panel into video
> +          mode.

'reg' should be required?

Rob
