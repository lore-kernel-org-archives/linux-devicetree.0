Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3333AC00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06985227BF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578090867;
	bh=uQHvl0hodbYb4DBcSe9ogT9gHBP/kHzrDkhP9lujX7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iYsTFUc9X8O0lKmH56ecDHfb28mrkL085PuQ0IIexTV0gRhlwk4HoJaQAWm9YyRpK
	 zs7er7RhuvIsIWqPwVXl6Dyb9p0+vMC3U9QNWNstiWKuzBxyjG+KeWAFVpMOxKZRPt
	 HC+5rSYxlSdJngugbZDANKAc70AOJspHKshtGEcQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgACWe0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:34:26 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:43737 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgACWeZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:34:25 -0500
Received: by mail-io1-f65.google.com with SMTP id n21so41363089ioo.10
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z/2Xg5vRSUumZDtJtIhcj+vGbHinC6E/xmYbVuQQYS8=;
        b=eoZbkd98xv0SwL9L2Z2Mjim+s0WK8GuBymy9fY3pBleZ84eruQ+V6doWjC/Tha6DVC
         dCLvF8pHrS8k2wdqTdUTGSUQa9PD8sJP3biXejYWcGEkxv6Ne4muaPXSOQNa+Dr62oLe
         B9s8YIMZ0zVmYYKtvR6WmXfbxEq24DG3fC1aIm+0kQCnBW7sJKTN2RznZq0Q851VYS6z
         VWMcDefscNucNhwZXGCIThPyh1CUIY+6piIjGaD7KJp/Do3v42qIN1BabIvKJ6RAwd6Q
         lUGjB5yZwkqaJyGX0iV1RYMpNKC3wDI2pLYy7p5azpNcEr6lAtgS4UpNbFntes9JCnUP
         Zi7A==
X-Gm-Message-State: APjAAAWqrEbbJUh3CsRtNlzNEKbi5Lq48MwahnXtCU/ekNKTIcVLznhZ
        vS3NG8aGDmIDPpNGIhyIL1JfrCA=
X-Google-Smtp-Source: APXvYqwUzTi1NZr4A46AJyYxtP5dixmBcyUnO96KOZLH4U0sCoZZt9A6t4yBISAoIzrXlJyHWbua2Q==
X-Received: by 2002:a05:6638:81:: with SMTP id v1mr71427626jao.143.1578090864815;
        Fri, 03 Jan 2020 14:34:24 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a7sm15185878iod.61.2020.01.03.14.34.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:34:23 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:34:21 -0700
Date:   Fri, 3 Jan 2020 15:34:21 -0700
From:   Rob Herring <robh@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
        Roger Quadros <rogerq@ti.com>, Jyri Sarha <jsarha@ti.com>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 13/14] dt-bindings: phy: Document WIZ (SERDES wrapper)
 bindings
Message-ID: <20200103223421.GA9017@bogus>
References: <20191216095712.13266-14-kishon@ti.com>
 <20200102095631.1165-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102095631.1165-1-kishon@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 2 Jan 2020 15:26:31 +0530, Kishon Vijay Abraham I wrote:
> Add DT binding documentation for WIZ (SERDES wrapper). WIZ is *NOT* a
> PHY but a wrapper used to configure some of the input signals to the
> SERDES. It is used with both Sierra(16G) and Torrent(10G) serdes.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> [jsarha@ti.com: Add separate compatible for Sierra(16G) and Torrent(10G)
>  SERDES]
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
> Changes from v4:
> *) Fixed the indentation as suggested by Rob v4
> 
>  .../bindings/phy/ti,phy-j721e-wiz.yaml        | 204 ++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
