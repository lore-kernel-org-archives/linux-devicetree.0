Return-Path: <SRS0=rl0j=YT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B1CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 00:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 351A620679
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572049038;
	bh=7wVhwAfjY4O+5UrVzY16K+OCu/F7C8hJgiP7wDzGwV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VNeO3g/QNZE7c7xB5x6mJcxV26iTsPL/H9HgHAABp+yeQovYHOQBRT9HpEE8vaxSt
	 Z90yRRH1gG6qHcAWdWKs1tVKSCwx8M7bpq8ON5EfQ1UHA90D7xpaG2xSCaCalEtJzq
	 JouYoL/NeakE80FtG6lYlg610k8sa55vgrl5yen8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfJZARR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 20:17:17 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33002 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfJZARR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 20:17:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id a15so2771025oic.0;
        Fri, 25 Oct 2019 17:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hOjPJa1yemSBeswP+tAkd60Q1n8Cz2I13yekyg60bMs=;
        b=mb+8tRkUsqhexkPkDDIHWwxX17qLe7G1euBsUJi1yZu1CZ/1uu20/DZhfWcS60+Dcb
         8BtvDwgnj0Yry6+ZCQhuSowSzClUpPHZJlqSX+O8gF6Df3UstphPOnS1k/4PoITHgBay
         ZTPHsLoIvhzfz/rgcGFyQZsB2PJF0jxNdzogJuXNsN5V2Xje5XAIDr8JbVLBm3oJAxhq
         7eEIyOJn9nazJtlt6pvM+Z4CLdmcpZI4FG8Df2Ot4yTIglr+G3o8D+f4BHBuE/P5210D
         hYIcdZ7Zsn92boKK1Cn/zYJlLrgxvFdLaukhPMpUwpYSJiNLwLSG+KShz0T+tvVoWfZz
         FJyA==
X-Gm-Message-State: APjAAAVbQlMgybtB7bC63GjRwAurOBk9Hvdur/QiL9mI+2zhFX5vXnIS
        JuPrDTU6MdMZOdhscHV7oEaV+IQ=
X-Google-Smtp-Source: APXvYqxd4vKbJn9lsrGOqXR83eEuUycJBvh2/M5MZg+CzayStyy9jDWnKKzdUVTCR1NP6qxJRVlvLQ==
X-Received: by 2002:aca:448:: with SMTP id 69mr5087878oie.2.1572049036409;
        Fri, 25 Oct 2019 17:17:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm1002948oii.48.2019.10.25.17.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:17:15 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:17:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: renesas: Document R-Car M3-W+
 SoC DT bindings
Message-ID: <20191026001715.GA6299@bogus>
References: <20191023122911.12166-1-geert+renesas@glider.be>
 <20191023122911.12166-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122911.12166-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 23 Oct 2019 14:29:07 +0200, Geert Uytterhoeven wrote:
> Add device tree binding documentation for the Renesas R-Car M3-W+
> (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
