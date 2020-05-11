Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D42C54E8D
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 18:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 493EC206B9
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 18:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpJuRmcM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbgEKSDQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 14:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgEKSDQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 14:03:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8075BC061A0C
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 11:03:16 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so4913214pgg.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/jPx7d5YFfc5M+Mr+WNJnLgo3PuhOfEnoDi6uZrGsrM=;
        b=OpJuRmcMB0DgL3hzu/cuiSn0WW/UQ/LPhbl0q3dFBw0Wuq8LnYg9k/jbgwAFqXT9HK
         yqgWEVlgJz7R7vvryCgeK4e4Hxz+94F3/S/O3NRbPq1xfNupdGLTEnpan5w7SNZff5Uc
         dH+ty9Loxy4loUE4WK5QkmQQU9MjOT+e2QTm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/jPx7d5YFfc5M+Mr+WNJnLgo3PuhOfEnoDi6uZrGsrM=;
        b=equHAiKkx3Xb0h9EzBTZsS9N3NFF7bPdqeE2/pnESlo8tu94r59Q0aS0Vusat7VoVJ
         cvAf4GSYjDTPLETyTpEzhI4VtjjXIoYyFL6NR1JoMprzKcQsw4rmL1tjK905ih7Q6Q0S
         RZtHbLpIW/uwBz8iLi5et4dgoiXJNLIqhCb+3x5l02Lc7ECBsu3FgU5+fRsmTjQFi34U
         bjj81jMP1a6dvjf4d2na7uT6t4TyHvVDyUygPCtK+oMM2RD441RmORI4wPVde+gQkqNC
         WUxNuaBn5q73ilL4lU9Bq7C4IsaQupkSIIWu1F3ZyTZwU/3B/hrl0MEHwS4PMBxInXj2
         2HkA==
X-Gm-Message-State: AGi0PuavQ0tCi0oy9AGa3RcPaaVoeDO6DSfKpQH/ldBAeU0YF3iiWVTB
        ji+HK3IkQcicbaessQV28ChlQA==
X-Google-Smtp-Source: APiQypJB3+AdtLqNBDqCsWafhHB0i1Y8hjzyptCsRfDfXoYQ1l+FQr/oo1RnZOI92VrJlGqoY4OGXA==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr14354179pgj.2.1589220195927;
        Mon, 11 May 2020 11:03:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id p62sm9685470pfb.93.2020.05.11.11.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:03:14 -0700 (PDT)
Date:   Mon, 11 May 2020 11:03:13 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, twawrzynczak@chromium.org,
        Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Message-ID: <20200511180313.GB136540@google.com>
References: <20200422222242.241699-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422222242.241699-1-pmalani@chromium.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Apologies in case you've already looked at this, but could you kindly review this patch?

Thanks,

-Prashant

On Wed, Apr 22, 2020 at 03:22:39PM -0700, Prashant Malani wrote:
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
