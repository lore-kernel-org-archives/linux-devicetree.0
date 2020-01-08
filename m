Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2338C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B975A214D8
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578502697;
	bh=8kstCzcaZmd+YgRdW1aDqr4GzCRDQW1ZYslQh7akxw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JA+uhl268TD+s8G+gyw2JDWBSPUPiD59j5+P3Aea3Hy9alpkb6ckM5P+NtZOXM2P2
	 3xlyxqODXujcZVD++lFlRN7wUo7QeOmM5zUyYSxlRoD0mjKlsJ7tkle13hhFoazDEN
	 oWxqY3AYhqOtmr1nTXPqKRf1VDFFQWnKM7De7P0E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbgAHQ6R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:58:17 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44959 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgAHQ6Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:58:16 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so3207245oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AWmgSsfRzvwSL0sYtWV5JPk31n0xrdke8dXDCuRYCJA=;
        b=NYsB1b91KAv1o2xegW8dZNXC8sqt9zh/GS+O5fKQDiK91b7F5fDyPB+tGA0ksg74Wo
         aPlWq8BSfJfHoZsFMo9ez7ev6dnXEQ1/2UJh0iX6Qn0A/jtfPToTf2DwWwYp12yuIlpe
         oJHqnH5K5rrv6oxevquF7+zjvwssN7nscWgYk05QLjs3mfLAK6tFDll8Qh1u06AE+2TV
         p0uFGwJxZqmsshj8nPRJRxRSBpJ8mLq+dLTY3UxTpmdzMAORpg9f7T0UiG4cVEyB5Irk
         7K4vmZb6QOj1DJqsHqBFlvFMODV8+iWDMHGGXm8lQ2/Vk4wuuigezUpiG7N3lbbPyW5+
         xauA==
X-Gm-Message-State: APjAAAUHygJDiJcOUAO04bJxPJ1qus1zIJilYPO1DlLN3YH8m6cZq8mY
        P9tnJ0o3Rwm1Ag8jpL3Q4Vda8j8=
X-Google-Smtp-Source: APXvYqxg8az9lUKrlNnxtuUjyZqnx3WpNQ1zOuMBvbotBEMBeBoDDY5Kqi5i4uZd+qSe1e84lKaCPA==
X-Received: by 2002:aca:2109:: with SMTP id 9mr3620353oiz.119.1578502695451;
        Wed, 08 Jan 2020 08:58:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm1322650ota.27.2020.01.08.08.58.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:58:14 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:58:13 -0600
Date:   Wed, 8 Jan 2020 10:58:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas Klinger <ak@it-klinger.de>
Cc:     jic23@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, rpi-receiver@htl-steyr.ac.at,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: devantech-srf04.yaml: add pm feature
Message-ID: <20200108165813.GA4472@bogus>
References: <20200102172749.v7ufupd32ytf7jda@arbad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102172749.v7ufupd32ytf7jda@arbad>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 02, 2020 at 06:27:51PM +0100, Andreas Klinger wrote:
> Add GPIO line and startup time for usage of power management
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../bindings/iio/proximity/devantech-srf04.yaml          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
> index 4e80ea7c1475..b3fcb3b79485 100644
> --- a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
> +++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml
> @@ -51,6 +51,22 @@ properties:
>        the time between two interrupts is measured in the driver.
>      maxItems: 1
>  
> +  power-gpios:
> +    description:
> +      Definition of the GPIO for power management of connected peripheral
> +      (output).
> +      This GPIO can be used by the external hardware for power management.
> +      When the device gets suspended it's switched off and when it resumes
> +      it's switched on again. After some period of inactivity the driver
> +      get suspended automatically (autosuspend feature).
> +    maxItems: 1
> +
> +  startup-time-ms:

Why isn't this implied by the compatible string? 

> +    $ref: /schemas/types.yaml#/definitions/uint32

You can drop this for standard units. 

0-2^32 is valid?

> +    description:
> +      This is the startup time the device needs after a resume to be up and
> +      running.
> +
>  required:
>    - compatible
>    - trig-gpios
> -- 
> 2.11.0
