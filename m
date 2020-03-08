Return-Path: <SRS0=ZTIy=4Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7E7C10F28
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 16:26:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5364820866
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 16:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="WI2lBknG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCHQ0i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Mar 2020 12:26:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45364 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgCHQ0i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Mar 2020 12:26:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id b13so5623323lfb.12
        for <devicetree@vger.kernel.org>; Sun, 08 Mar 2020 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OxYUCpymTQKyh/Zbcj6rnN2cqzFH378GX45gA5Aa85c=;
        b=WI2lBknG1kB4QUIwRtAqQSF0FeqwrfWNQEX6PKrjPmBBkdEkE5XEz94twM/+Pkc2DJ
         7Z/gOBhyNZ0phrtxKil6xb6sMNbJGAX0oz6im9TK8yDISsikzFYa1h1GNDqNU1BRusXs
         op8vGT5TH9UWKqhzwXwk9s/f94TgAwMxvCzyD6HJlhjZnSqtZDIfq04RMT9UZkNwYOtZ
         q9yaVeDrlhtxPKn2rfciU/wG1shzSVot114jen77a4cbjBvKux+ZmrB3UOpVd3sqa0kb
         L940Ubg5DDOvmXS1uCFfamvDpMNivcyrQ75v92SgTw0t+OAt7hBXqpM1SjoA8jK7K+6W
         oMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OxYUCpymTQKyh/Zbcj6rnN2cqzFH378GX45gA5Aa85c=;
        b=mzY7qDN2y+GFQ4XabBhVYO4sRoW2b1NrrySohOfRDGOEcBwHu3swtRDBlVRcLbbkDm
         U2B+1qRX8cIUGgN3Chx/C8sPzNW672MkAVgduwKb94TZcqVeOf3qgYllJ2DCWdpYlg/a
         SetdO09/UUXxhHafcc/4j/sBMYyOcr1YmhtD6cF4oQXViSuf4RigZ1t64XJ+wlQKeqDo
         ylSrOXvoPcRMEFk4J4H0xF7Ig4N5Dy+OdQIudmMv9ErsWXokP3RhdI07lwYBIPTOEM8J
         1Rj76WsnzWQza30qPcttzkcDYZxp89sbP7nHzj5ilsBFUr4h59qOkF5JqWfpQ8nDlc/D
         HcFg==
X-Gm-Message-State: ANhLgQ3MGgzBcktE1xgkeZJuKhn7FZ7UU9o00kjqG1K8zXyrGK7tMuX3
        mtP3b/n1YsaS0RiJjUBa7tuPrA==
X-Google-Smtp-Source: ADFU+vvLj9947q2eq5NymLrmOdpYhDI4kv3dx/GK9iDq9j8U+KsaxvWNy3cVavNC8pPNW8aOpHZgNA==
X-Received: by 2002:a19:c70d:: with SMTP id x13mr3177936lff.204.1583684795775;
        Sun, 08 Mar 2020 09:26:35 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id 140sm7960803lfk.19.2020.03.08.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 09:26:34 -0700 (PDT)
Date:   Sun, 8 Mar 2020 17:26:34 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: Add
 r8a77961 support
Message-ID: <20200308162634.GB2975348@oden.dyn.berto.se>
References: <20200306105503.24267-1-geert+renesas@glider.be>
 <20200306105503.24267-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306105503.24267-2-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-03-06 11:55:02 +0100, Geert Uytterhoeven wrote:
> Document R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> index 12c740b975f78690..2993fa720195308f 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -11,6 +11,7 @@ Required properties:
>  			    - "renesas,r8a774b1-thermal" (RZ/G2N)
>  			    - "renesas,r8a7795-thermal" (R-Car H3)
>  			    - "renesas,r8a7796-thermal" (R-Car M3-W)
> +			    - "renesas,r8a77961-thermal" (R-Car M3-W+)
>  			    - "renesas,r8a77965-thermal" (R-Car M3-N)
>  			    - "renesas,r8a77980-thermal" (R-Car V3H)
>  - reg			: Address ranges of the thermal registers. Each sensor
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
