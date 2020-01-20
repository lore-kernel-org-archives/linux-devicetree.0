Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3E5C33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2108207E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwUeFiFN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgATIj3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 03:39:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54964 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgATIj3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 03:39:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id b19so13476078wmj.4
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 00:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N6VJsg9JGv0fWHa76rwtqQjIJNMz7B1e6cCi7vAeucA=;
        b=PwUeFiFN8eOJcQnhMLJYdsdPj3CeRSd/gW5H86PcPvm1KR4SfbDZUB6/AQX94a0/5D
         ysX2N/IqhLZcndErFds2W27uTP6ySMYUghJA0BVtdLud3IHwTN+OxKTTs+LW0KzpdlXa
         w1zilTyN3Es0wz8+yg0U6xx3pI4MyBsDhpDPGx8cp+OjR5IpClecxVFTN25RvQ3AbHsB
         wtK653Bl/lx7QSDRKzMQ2lSyt6IO07uJ0fATmCLktwkPjIY2nPJR6FjR6zh7Y+phaYIp
         VhAlnNaLnadKcrV0qAmVesq+3qqQKRTLEjjn6A3hI0YMGG1c6XOUKcD+I82pleShTrrG
         tJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=N6VJsg9JGv0fWHa76rwtqQjIJNMz7B1e6cCi7vAeucA=;
        b=LC59UisDCQmviWtyYNKpXKqeb9nkjYos9EsjtsSa+vBDCFXTc3TV/PQWPQf6XESbQf
         rUI95zA6XMfVH4hKNs6hbzYX9Ll0vbxvOA6M15zNg0Xth8HzNiykE3b0rLmfKg2yw3gf
         Ssumjm775SCRNDJtJGnjFueaY53IZvNyCot6wxzQ0RzZO7STgjcMOQaotj6ko6pHQdW0
         73KaE6Nquqh2Uc6guEeJgLdaKOL4iMMGV8iotenoUS63cFhuafINp2YHnji7JebAtRk9
         frVu3pgB2ufKi72MJRgBw7ND81l/u6PI4gxWpHoaWReIeYNsAut83LnCAkfIlkAF67r/
         JkAw==
X-Gm-Message-State: APjAAAXeKqIVsehkBmWbT3UfxhSHjjeu6J6xzG6/4Ox6Kt38dvHDF/rK
        Vc7NxSreOezs7wtHNLl4Hc87+w==
X-Google-Smtp-Source: APXvYqwBiZckfKEkp4aViCq3tFu0Cz1H/cPbVVqcv9Qv0c5leul2EQuYFA96NpchRLKeNAJc/p99+g==
X-Received: by 2002:a05:600c:1007:: with SMTP id c7mr17644273wmc.158.1579509566950;
        Mon, 20 Jan 2020 00:39:26 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id s1sm22441787wmc.23.2020.01.20.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:39:26 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:39:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: atmel-usart: add
 microchip,sam9x60-{usart, dbgu}
Message-ID: <20200120083942.GU15507@dell>
References: <1579262309-6542-1-git-send-email-claudiu.beznea@microchip.com>
 <1579262309-6542-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579262309-6542-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 17 Jan 2020, Claudiu Beznea wrote:

> Add microchip,sam9x60-usart and add microchip,sam9x60-dbgu to DT
> bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> 
> Hi Lee,
> 
> Between version 3 (that you Acked-for-MFD-by) and this one, there is a
> new line introduced in this patch:
> 
> +       - "microchip,sam9x60-usart"
> 
> I kept your Acked-for-MFD-by in this version (with the extra line).
> Tell me if you consider otherwise.
> 
> Thank you,
> Claudiu Beznea
> 
>  Documentation/devicetree/bindings/mfd/atmel-usart.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
