Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC77AC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 01:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAB3320708
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 01:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FGO/koYG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgETBvp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 21:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgETBvp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 21:51:45 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84F0C061A0E
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 18:51:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci21so524338pjb.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 18:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lwNCB4Dsry2wZ58/xIrXOOv8YhkYu6cJrmOfJMlkcmo=;
        b=FGO/koYG5KrQ3cEFeVBk/aC5T5tsFvhsdPbYmeApeHsY1N86CXmNLZfCZRW/x7y5DW
         CQnPqHgiW5IjtF+sE1w2/7oI2K7WweQUdw+FSniShG8Q+SRER/2bxbIuNrdO28ov4Npn
         exgg+xPnAA6W8/iOdo1ApNTzOkzp85dDVUivc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lwNCB4Dsry2wZ58/xIrXOOv8YhkYu6cJrmOfJMlkcmo=;
        b=q/gkVu15lVlkb4hoUP/65ytFMUgnaU96Rd9UOAPBq/IHY3u7MiFhwKwdrpoS30notN
         xYkhXNSB0Vlyl/Z4Na2rcq8nYgYNVERB4h/o/raXf0+duja/9sMpI507rgJHkLRRaOlS
         2YMrSnVFVt+1Mq1javBi7DyMXtbO69Zt479NUSgXaX8Kj0FgUcqMgvrcNYtYYALal7l7
         rcOD1FTxNN5EnIh0FJNLxrJdVuvuErBpTPYAy3TCXcMmX1aspxyQWCFHu+Jm6vsWdLx8
         yAvd/T8tPlUHFklemYGY/MdeOJX3f8WzQqL4z2LB5SgXnrtVICE6cpk3tWT23v5lzW53
         v1BQ==
X-Gm-Message-State: AOAM533FOTJai7OvMEOOI9C+DEFGq71XdPulhCsDuJsXqytCitnNK5b/
        wlO3EVam9AoLZ5ZcJYFdkZ5V9ozNvns=
X-Google-Smtp-Source: ABdhPJzmKHgd0Qoj4GNZc0I5UDMFuWG/ClZ4fB0X/0cdU2j+BoKGw+eXgLGIu12XUE18/EZHtA399A==
X-Received: by 2002:a17:90a:7787:: with SMTP id v7mr2620624pjk.199.1589939504221;
        Tue, 19 May 2020 18:51:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id a16sm610238pff.41.2020.05.19.18.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 18:51:43 -0700 (PDT)
Date:   Tue, 19 May 2020 18:51:41 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com,
        Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Message-ID: <20200520015141.GA124149@google.com>
References: <20200518071707.161843-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518071707.161843-1-pmalani@chromium.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Mon, May 18, 2020 at 12:17:04AM -0700, Prashant Malani wrote:
> Add properties for mode, orientation and USB data role switches for
> Type C connectors. When available, these will allow the Type C connector
> class port driver to configure the various switches according to USB PD
> information (like orientation, alt mode etc.) provided by the Chrome OS
> EC controller.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Acked-By: Benson Leung <bleung@chromium.org>

Sorry, looks like I made a typo while adding the "Acked-by" from a
previous version.

I have uploaded v3 with this fixed.

Thanks,

> ---
> 
> Changes in v2:
> - Added more text to the switch descriptions, explaining their purpose,
>   and relation to the Type C connector class framework.
> 
>  .../bindings/chrome/google,cros-ec-typec.yaml | 40 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 6d7396ab8bee..800c005a0e44 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -21,7 +21,34 @@ properties:
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
> +              for this connector. This switch controls the data lines routing
> +              for this connector for various operation modes, including
> +              Alternate Modes. This switch is assumed registered with the Type C
> +              connector class framework by its driver. The Type C connector
> +              class framework assumes that the mode switch property uses this
> +              name.
> +
> +          orientation-switch:
> +            description: Reference to a DT node for the USB Type C orientation
> +              switch for this connector. This switch controls routing the
> +              correct data pairs depending on the cable plug orientation from
> +              this connector to the USB / Alternate Mode controllers. This
> +              switch is assumed registered with the Type C connector class
> +              framework by its driver. The Type C connector class framework
> +              assumes that the orientation switch property uses this name.
> +
> +          usb-role-switch:
> +            description: Reference to a DT node for the USB Data role switch
> +              for this connector. This switch is assumed registered with the
> +              Type C connector class framework by its driver. The Type C
> +              connector class framework assumes that the USB role switch
> +              property uses this name.
>  
>  required:
>    - compatible
> @@ -49,6 +76,17 @@ examples:
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
> 2.26.2.761.g0e0b3e54be-goog
> 
