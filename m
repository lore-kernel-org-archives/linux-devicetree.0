Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4592C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 10:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9CEB2243F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 10:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDYB8Bd/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfKTK1e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 05:27:34 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45008 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfKTK1e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 05:27:34 -0500
Received: by mail-ua1-f66.google.com with SMTP id r22so7590942uam.11
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 02:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iPPl+dieWmwwl5vclo4eycxw3/3RIJ5/bVbsRxQY9fg=;
        b=cDYB8Bd/9XV0BpnQ5A/BVa8N7CSLhRXNha/+ozOLuZ0ti/xAJMxWBF/n+373T53553
         61ARehzgYwuxH8lCICdiBYJDRiCYlQYtg+hh6DIilDevFzomryjjIm+kXsuIvBGNgrgx
         N6VR3Ui0/jj6DcZzLxG87/9pdgN3Jo+3efXMmqaECPiEW8JY0jHOqosJen1A6JvVkSiS
         9JNQhOsBG9eCu5lFGgY1SxHNpVxqf6zaTc9rwPWEDaGaPUATNpWw74J88QL6aIy6jcNh
         tlGKDgD4Fr06GeoS9kWNvD9uv8PTeaMiRkYePDsuQPPPchtb6ufXZP0A9ZyOHLJfWh/M
         M63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iPPl+dieWmwwl5vclo4eycxw3/3RIJ5/bVbsRxQY9fg=;
        b=uaXQv5+rs/vX335bgUb0g/1YKCjZFksp/4GSX5lGNXbb1XAT0jwfRyASqIDGwj7g42
         1aItxcSpsND5KVg4oHkTBHzlXKuQySTMomnY+m+DzRdFRWjBBVi5NKp+hBxC1Ryq78l9
         D/LRhCHELpPToE2X4Ym3PykaCQxidwXX3Olkq6jow+lt+kH49/iiMY9boWU7eTeueO0x
         5UgO3XZn73K6p1Q85rY+3ZobrcF10U74lBdbU7Y/Cjxshu3oV9KRMNEkWZLMtcT+fjzg
         kehvBIq/x/GnU7K81WIcAJVmFPSa3leKeflPgt5v8O5eDCdqesyseoQmzRgsCUO7KWEG
         bfUg==
X-Gm-Message-State: APjAAAV41f4VN0qBivMd4PFRU8XbNqOAJw37dJ20y4I5wtLBW8Ii0LFC
        x1ohBCMNcBjZ7WKLcLQzLSitar9pTfybu8PSCnj9pA==
X-Google-Smtp-Source: APXvYqz54Zeg8KbbWUdNshHqcWaCOGq8jgGO9qGY0g5PgtU6Hs76XawRjWx7E0migoK0Q+phAd/zNlaNrZ7pNwlmXcE=
X-Received: by 2002:ab0:61cc:: with SMTP id m12mr1127845uan.129.1574245652878;
 Wed, 20 Nov 2019 02:27:32 -0800 (PST)
MIME-Version: 1.0
References: <1574236796-25016-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1574236796-25016-1-git-send-email-krzk@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Nov 2019 11:26:55 +0100
Message-ID: <CAPDyKFo-Y8zctjLw0F5RibO9gogQTkf1Xbc-ODLySAJ_9r_jAw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: power: Rename back power_domain.txt
 bindings to fix references
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 20 Nov 2019 at 09:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> With split of power domain controller bindings to power-domain.yaml,
> the consumer part was renamed to power-domain.txt breaking the
> references.  Undo the renaming.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: ea312b90857d ("dt-bindings: power: Convert Generic Power Domain bindings to json-schema")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> ---
>
> Changes since v2:
> 1. Simplify pattern in Maintainers as Geert suggested,
> 2. Add Reviewed-by.
>
> Changes since v1:
> 1. Undo the renaming.
> ---
>  .../devicetree/bindings/power/{power-domain.txt => power_domain.txt}    | 0
>  MAINTAINERS                                                             | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/power/{power-domain.txt => power_domain.txt} (100%)
>
> diff --git a/Documentation/devicetree/bindings/power/power-domain.txt b/Documentation/devicetree/bindings/power/power_domain.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/power/power-domain.txt
> rename to Documentation/devicetree/bindings/power/power_domain.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7126d3e079a4..0aff4bebed78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6953,7 +6953,7 @@ L:        linux-pm@vger.kernel.org
>  S:     Supported
>  F:     drivers/base/power/domain*.c
>  F:     include/linux/pm_domain.h
> -F:     Documentation/devicetree/bindings/power/power-domain*
> +F:     Documentation/devicetree/bindings/power/power?domain*
>
>  GENERIC RESISTIVE TOUCHSCREEN ADC DRIVER
>  M:     Eugen Hristev <eugen.hristev@microchip.com>
> --
> 2.7.4
>
