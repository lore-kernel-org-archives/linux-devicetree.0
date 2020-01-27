Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873D8C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 15:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E23D21739
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580139571;
	bh=7OD6ZxlaYOCCiS8YDPzG7UImCuEXqN/v5vy+e0WsTlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xA4Vh+SX0S5B4Z/rtiYUZjFiWIdzmsTN66pryAbFiYNhSe+5ANfPVg3o+ETy0gUTy
	 yQw6ZEgRemNeRj9VYvhx4KyMC129hxIcHnrW4jP8rLqxZTb/ydfS2XMvm6jlW26Joq
	 EUUi03IsqHCjKnPLC8IcqkaCw++IlDaT+5N+WeR8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbgA0Pja (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 10:39:30 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34277 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgA0Pj3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 10:39:29 -0500
Received: by mail-ot1-f68.google.com with SMTP id a15so8766715otf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 07:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EBD6M+xr/YPO88cJtsIa6Ug0pqwut1eElHk7vtXakf0=;
        b=kXEhIZuxh7ktNtDP27T+cU18ZNfSup0golD7Xnfs/wcBdKk7XITHf6WXtp31O/UGXL
         UFRz/cZ9pAKmnlAxWwQnqb8J9w1H4FU9BvhwfZZnTWtEL0X7bDvH1BiiopHfewxu2kcg
         /grgvI58nOHsT7EvTDTtoKLgrChMfyP+CHTf4/R9/4MwfPeWO7AhJz+dIPQ86JIaRju7
         5OP7q3M5xQexlrOKGi3Z+bMUze0b9RkPytDsOsXlpVs9JcyENGtMSlIBeTxA9FWV1rRf
         YuswFgq0d2S/dr6cVaQE+ucSc/P0zeBNONmOlXpI3MjjRA3tWk2dzRKiB8r1jbeggZvf
         rF0w==
X-Gm-Message-State: APjAAAW2sjHnVozWhtTIfLHaN+HxAv5h7sUlpDSUfNz7h52DKkA5VzYO
        atqOOcl1hOqWY6GRHkiAAA==
X-Google-Smtp-Source: APXvYqyrytH//FFyEpbASQFRXqGKhY2g1B0JjSVzAXcSlavAhpNASn79x/8LpmfrZ3Yg8Y9FFMagFA==
X-Received: by 2002:a9d:472:: with SMTP id 105mr11861944otc.150.1580139569354;
        Mon, 27 Jan 2020 07:39:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p83sm4879498oia.51.2020.01.27.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 07:39:28 -0800 (PST)
Received: (nullmailer pid 4318 invoked by uid 1000);
        Mon, 27 Jan 2020 15:39:27 -0000
Date:   Mon, 27 Jan 2020 09:39:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Sam Ravnborg <sam@ravnborg.org>,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v9 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new  bus-width prop
Message-ID: <20200127153927.GA4282@bogus>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
 <20200127110043.2731697-10-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127110043.2731697-10-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 27 Jan 2020 12:00:40 +0100, Boris Brezillon wrote:
> Add the bus-width property to describe the input bus format.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v7:
> * Rebase on top of lvds-codec changes
> * Drop the data-mapping property
> 
> Changes in v3:
> * New patch
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
