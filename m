Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB0C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30559217BA
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580492472;
	bh=j9L7YS1IMIUGvccZ1rHyQK+UVEwcZiYe0s6TbTpWVhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hWV842ra8Il/ddPMn9lf+156iM7AHh0vfhVKuFmWhn8XJl/LmoCzinox2enzTz01a
	 3eT7MTbtJfyAXwly9EVzZXtRBlwpGUt2BZA3q8VZXl5JJ0uD5kKsvrECjTv5fUHVXS
	 oSLkHFfYajj388lDodlCAW7LSgpj7V4R9dnlQDb8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgAaRlL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 12:41:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:50642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbgAaRlL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jan 2020 12:41:11 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D639F22522
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580492471;
        bh=j9L7YS1IMIUGvccZ1rHyQK+UVEwcZiYe0s6TbTpWVhY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gx7l5bnlji7EjZCMKzo5sJTAnC0ZbVzJDWJ05Hj8lgPMhgeKFWWq9mRKriCS4n8Qr
         oevClOc1Olg5m73sbKsISlWUbu+/sGeDeQlnPH9X2rbDwE27SXltHsxNUxJo50r5n2
         Cv+B/OgjoSsnx0l8vVo6+lGlxeXFHluvx2KtPRV0=
Received: by mail-qk1-f180.google.com with SMTP id g195so7298741qke.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 09:41:10 -0800 (PST)
X-Gm-Message-State: APjAAAU0+vfOJsY+Bd8V2NRKkjFWUnu9TLrZ+feA3VwNp4N3lBwp1/yA
        f/H5wkidogcevth5BMN8i1XOlMC77IiAQgMu6A==
X-Google-Smtp-Source: APXvYqzcPXwNiM+WNCqBCrr2x5w5fdp61dkW1RPVkzEgStdAcfM6ZkFVm5E4Ii+5LeuvmrEOYFBEWfJnzrVzsu+chtk=
X-Received: by 2002:a05:620a:9c7:: with SMTP id y7mr11820586qky.393.1580492470023;
 Fri, 31 Jan 2020 09:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20200125203454.7450-1-sam@ravnborg.org> <20200125203454.7450-3-sam@ravnborg.org>
In-Reply-To: <20200125203454.7450-3-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 31 Jan 2020 11:40:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgWaqJCxtsD02DsTu=p=Q2=ZzWNZ5bf_atmbbD9N6JQQ@mail.gmail.com>
Message-ID: <CAL_JsqKgWaqJCxtsD02DsTu=p=Q2=ZzWNZ5bf_atmbbD9N6JQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: convert display-timings to
 DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jan 25, 2020 at 2:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add display-timings.yaml - that references panel-timings.yaml.
> display-timings.yaml will be used for display bindings
> when they are converted to meta-schema format.
>
> For now the old display-timing.txt points to the new
> display-timings.yaml - and all users are left as-is.
>
> v2:
>   - Updated native-mode description
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/display-timing.txt | 124 +-----------------
>  .../display/panel/display-timings.yaml        |  68 ++++++++++
>  2 files changed, 69 insertions(+), 123 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/display-timings.yaml


> diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> new file mode 100644
> index 000000000000..508302cd307a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: display timing bindings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +properties:
> +  $nodename:
> +    const: display-timings
> +
> +  native-mode:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The default dispaly timing is the one specified as native-mode.
> +      If no native-mode is specified then the first node is assume the
> +      native mode.
> +
> +patternProperties:
> +  "^timing.*$":

'.*$' can be omitted.

Probably should have a 'type: object' here too.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>


> +    allOf:
> +      - $ref: panel-timing.yaml#
