Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47EC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FC5F2080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578959106;
	bh=6djvCDEPb7FUU39NWACAo4NHVu8isK7Uf8/4dnKP2Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xw1qkebSHLqgCjgazRwOKqe4tEhb4MUGfW2XeSe+kRZg/fAH1I5NcKw3xUjQCGrWp
	 9nWPuyJ+7H0WgPdPFVVFDNcv1bgYxOiDvEmT9XA68KViqxqgWv6mPKge3/x+VmeQ/O
	 uW/KrRFanti+a+UgLeXYV4EtUXAS9sR1K1f74XQ8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgAMXpF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:45:05 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37515 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729067AbgAMXpF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:45:05 -0500
Received: by mail-oi1-f193.google.com with SMTP id z64so10119715oia.4
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T2alnzvz8KAPkt6TNZdOKsvg51Cv8nSh38BXX535N54=;
        b=nP1XfHFKhKXQ1nuOpUddvd+45LQvKGaqBDABGXtLRAJCZ6IavNQoDl/tAmjb223d1O
         Xv2AWB1xeD4hZcTiTN4D3g0FUOMVJcbrUTdNjdAg5hI7sdZgOUhKeVX58o8i8Jr5hW5O
         4bmRx18XYfRSOqzpo6mYv3ySLjv/rknzgf2Ihbxyke7qchBeV1MQeHcvqBpo5mfSDAZ2
         pnTbDGfTkUprrfRyb7ldDfp231RmHH3z42k5Ga6juFzOfA7vu3KCL/hADJWUBfcErchN
         Rr7H5iV6+0bjYxE2+2yBO0KoQhK+Sq984digwe5jptix2Jy9PgVO9PCOjNyXNm10QElK
         DqDg==
X-Gm-Message-State: APjAAAUUtHJP+3DkR8LXV+XXEg+6/NT8oK/JcmQUs1Z9+4MfZ2iGTh1r
        BkqHKIff+5mDd75xaQ0wVWu44eQ=
X-Google-Smtp-Source: APXvYqwGYI4YAqgpij8kaCBB2J/OkQVpHmNV59h5ES3OoOnVAlN2fP9mO3pWTF8BaNj0ZcaqJxrp9Q==
X-Received: by 2002:aca:1309:: with SMTP id e9mr14720195oii.7.1578959104890;
        Mon, 13 Jan 2020 15:45:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h1sm4691811otm.34.2020.01.13.15.45.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:45:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221ac9
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:25:02 -0600
Date:   Mon, 13 Jan 2020 17:25:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     mark.rutland@arm.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        vkoul@kernel.org, eugen.hristev@microchip.com, jic23@kernel.org,
        knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
        mchehab@kernel.org, lee.jones@linaro.org,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, wg@grandegger.com,
        mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 04/17] dt-bindings: atmel-tcb: add
 microchip,sam9x60-tcb
Message-ID: <20200113232502.GA31265@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 10, 2020 at 06:17:56PM +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-tcb to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> index c4a83e364cb6..cf0edf5381c9 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> @@ -1,6 +1,6 @@
>  * Device tree bindings for Atmel Timer Counter Blocks
> -- compatible: Should be "atmel,<chip>-tcb", "simple-mfd", "syscon".
> -  <chip> can be "at91rm9200" or "at91sam9x5"
> +- compatible: Should be "atmel,at91rm9200-tcb", "atmel,at91sam9x5-tcb",
> +  "microchip,sam9x60-tcb", "simple-mfd", "syscon".

How many valid combinations are there? 1 with 5 strings? List one valid 
combination per line.

>  - reg: Should contain registers location and length
>  - #address-cells: has to be 1
>  - #size-cells: has to be 0
> -- 
> 2.7.4
> 
