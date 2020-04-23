Return-Path: <SRS0=8VFN=6H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B00C55191
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 02:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E5822080D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 02:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BEm38iFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgDWC7S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 22:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgDWC7R (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 22:59:17 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E21C03C1AA
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 19:59:16 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 92so3725955qtg.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 19:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tiG4estVhkFDvM3fXIKf3Waa3WQxJTqbvQi4eb+IlFk=;
        b=BEm38iFuYJaWYHZu4YEtpMBohffRFeUHGf98irjkVIwRUruQ7r5/ohPVTNK3INRwJT
         lzarfHB7qxX+JuPKX7/k+n5nTH7KTloOr5Ycpyng8ugKdKQn5/PwLTu3P7MDvxZrYgwH
         PBvncRLWUzg8UvPrzZjeRSE8kPoygagwyj3u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tiG4estVhkFDvM3fXIKf3Waa3WQxJTqbvQi4eb+IlFk=;
        b=CWrolyxiQ82BnkDaSwyEDz75PzCC+P5WZPfn0UtbG3HulB5DL+bA/7AHocxZUi9wDB
         eJkTtUAMsisHOfB3MFajalsEHN9Ug0FDypYSNr+H65X3pVXZdoEAVK8VhLwyA1MFCAZW
         VUD4d8E00i8LxkPItJPsP0VNY03ylqRMEowcPYINmRbfYdA/1IcG4a5/6YyeWBopBqUM
         CuAen6wztyM6fo+ZCf5QRkzhoeXb8WjdZqNjn/WM4MnXPrEzIVdBz3rcfIP4Za9YARmF
         ENgNOTtorTIhhw5zEuFkOsUo/DIkceJi1B723CAENzvXYZoh9ofLlOt/fce06n2HYoRW
         bw6Q==
X-Gm-Message-State: AGi0PuaY5ViztTClfVv0K7x8tQvuei1GE6aLN1A9xKE7EMd12FrDJ/+K
        0QrjRsPC84cYt01CkJa4PopJNQsIY8tFV3FpUAWsjBkv
X-Google-Smtp-Source: APiQypIAUFOg7Ak/lvY1XuLcqJChSZ8dgwbs2Re9udPGxa0Shqlzpb6TpwP0syJrSX63ybgDig1CY85/8OMZzLuhG+0=
X-Received: by 2002:aed:2dc1:: with SMTP id i59mr1964615qtd.182.1587610755161;
 Wed, 22 Apr 2020 19:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200422222242.241699-1-pmalani@chromium.org>
In-Reply-To: <20200422222242.241699-1-pmalani@chromium.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 22 Apr 2020 19:59:03 -0700
Message-ID: <CACeCKadzxN7hz82n+hAwqat6pUzKWTVJ5_pqXuieDXK0UVXNNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tim Wawrzynczak <twawrzynczak@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

(Forgot to add swboyd to the email, so adding now)

On Wed, Apr 22, 2020 at 3:22 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Add properties for mode, orientation and USB data role switches for
> Type C connectors. When available, these will allow the Type C connector
> class port driver to configure the various switches according to USB PD
> information (like orientation, alt mode etc.) provided by the Chrome OS
> EC controller.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml | 27 ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 6d7396ab8bee..b5814640aa32 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -21,7 +21,21 @@ properties:
>      const: google,cros-ec-typec
>
>    connector:
> -    $ref: /schemas/connector/usb-connector.yaml#
> +    allOf:
> +      - $ref: /schemas/connector/usb-connector.yaml#
> +      - type: object
> +        properties:
> +          mode-switch:
> +            description: Reference to a DT node for the USB Type C Multiplexer
> +              controlling the data lines routing for this connector.
> +
> +          orientation-switch:
> +            description: Reference to a DT node for the USB Type C orientation
> +              switch for this connector.
> +
> +          usb-role-switch:
> +            description: Reference to a DT node for the USB Data role switch
> +              for this connector.
>
>  required:
>    - compatible
> @@ -49,6 +63,17 @@ examples:
>              data-role = "dual";
>              try-power-role = "source";
>            };
> +
> +          connector@1 {
> +            compatible = "usb-c-connector";
> +            reg = <1>;
> +            power-role = "dual";
> +            data-role = "host";
> +            try-power-role = "source";
> +            mode-switch = <&typec_mux>;
> +            orientation-switch = <&typec_orientation_switch>;
> +            usb-role-switch = <&typec_mux>;
> +          };
>          };
>        };
>      };
> --
> 2.26.1.301.g55bc3eb7cb9-goog
>
