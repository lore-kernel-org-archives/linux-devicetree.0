Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAF8C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 17:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 751372074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598289917;
	bh=IHIpapSYA3VlsqIZcvOGa5prbOHAmg7d2h2hXr+W2xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hYTrLWludnY4tefwKM/+iE5afS00jhmntqHXxbzNYTigaauf/evj7hIIHEFtsFjMu
	 ZIJkU7DikxNZewAdYKU7y1vedWpA2c0hFtXSidrqcNWxFaEwT7937tj0Bz97FhIqCY
	 N/2WWTov11nCjmRPeYnHqqGMUT/9U7WjCW+0bvi0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHXRZO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 13:25:14 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43600 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgHXRZA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 13:25:00 -0400
Received: by mail-io1-f66.google.com with SMTP id s1so9500942iot.10
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 10:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8lTTj/jmM6acdQm8/e8F2732+IJ43OBKaVG2UWzljck=;
        b=eV4VPg/Qg1/pUd9QjuCfoJXoqJEWs2IBlsMDlCHLqUCGlnewrr9ZBW+uS2xzcD+caU
         G1Zvm/pVj6e2m5aoFVI1Z65Da/6jBeLyhg5uQ6Kr2FBT8ZgWeUjkB5j7lNdZCqv9H3hY
         O4u6IhPjajmnUSWy1qOQpvlMXyyxC+0H4W8doL+GXv8XOijW5uGmbboOphDTHal1UGE/
         FSksSOP558JvUVic1620jRGO9SvdqfcDlP3Sm2hHTpJAhn3Ssu6lM11NYZcKqWWl29+W
         doE1Y0pUlCcY0fBHeU7b1iXY5hgTLZE49+8UIpJVkqqFumrCwFw7jjOTg2xkq93APE3X
         TRUw==
X-Gm-Message-State: AOAM530ufiEfq0wLT/UwrOA3OyEPLVbG9ZfsnWBoNcVh+iowuVuwuYpj
        qJuP97aaCUBRrC6+QkDbSQ==
X-Google-Smtp-Source: ABdhPJyTBX3p/wehrALXgNAMThV85kOSRDteKPInM12uyjqGIejIB3rM+0JIUP9uewe8zY9koeq3tQ==
X-Received: by 2002:a02:cf36:: with SMTP id s22mr6745606jar.80.1598289899733;
        Mon, 24 Aug 2020 10:24:59 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c88sm7669699ilg.5.2020.08.24.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 10:24:59 -0700 (PDT)
Received: (nullmailer pid 2928413 invoked by uid 1000);
        Mon, 24 Aug 2020 17:24:56 -0000
Date:   Mon, 24 Aug 2020 11:24:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200824172456.GA2926958@bogus>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 10:51:48PM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the | for the description
> - Drop the "default-on" property, we're not using it.
> - Drop the minimum 0 for unsigned u32:s
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
