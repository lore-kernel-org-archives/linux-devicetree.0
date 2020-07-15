Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B053AC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 20:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E1B20657
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594845201;
	bh=JG2Fbg21KXPsktezLoC4v8PVtNmqnVl0RIMRNNKNApI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vC+KGfiVAOrccERl5J2WMq2Qx5fYybpTMGqhtKpKfnZahR0o23GNtbO+27RSv+rkF
	 mXhGIAkB2/9patPrxZm8NlzJbV4C8w6cYkRZBWN7a5M1zWyCCfOQhg/yaQNTO4yixd
	 3LaM+SXwsvwI8WUZe5WWHLTPcRA4MvToFT2RY+Uc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgGOUdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 16:33:21 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34496 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgGOUdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 16:33:20 -0400
Received: by mail-il1-f196.google.com with SMTP id t4so3191177iln.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 13:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NPt2KeQYDXGkZsSqox7LHPtD+7egq3qQpWTNfD1EIQk=;
        b=jypImH5BjQ5kW5KgFKDN1tBrLsbvV2Pnns/QoTpajuhhwOeIxEINbm/tUgM5u1rl9X
         2hUrOE5twBpm1zFNFyT+vvuct/udkXdycCoGrkilhTq6NAvqfSS+fWV04abXXNaQNai+
         SEC/LtZEy0RSw0XfwnFQwUzfNuDP+hVuE93qa8UflXMaIbKgXJSadrH63bI+BJFuOI4j
         rSBwLQJWz5Zc6n6+w1EtvNteEkiFn9R7Oi2cJOpRhPAp6x1nN5ii0VLO9FMJOuJYip3+
         dQGKg68mYuoynP+MNA5rKQXMYaAg8Vi16zzNB6nhrKZl/MVyUOa182sqmCUsu+IL5lNv
         e9kw==
X-Gm-Message-State: AOAM532lGcOeUuuJznuiPsbyC9y0rhkKTCkdPGU5z24FS7EGdO5gRV82
        He0hIW9E0LcRQ7ihTZHd0Q==
X-Google-Smtp-Source: ABdhPJyfD+4g///X6MtLs6+EvtduWqbz4u5i879+rc4E03esR9ePDUxUxPIZPT2I+r0WjR5aWWB+Dw==
X-Received: by 2002:a92:40d1:: with SMTP id d78mr1305137ill.14.1594845199561;
        Wed, 15 Jul 2020 13:33:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s17sm1692774ioj.10.2020.07.15.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:33:18 -0700 (PDT)
Received: (nullmailer pid 771217 invoked by uid 1000);
        Wed, 15 Jul 2020 20:33:17 -0000
Date:   Wed, 15 Jul 2020 14:33:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Jason Cooper <jason@lakedaemon.net>, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] dt: update Marvell Armada 38x COMPHY binding
Message-ID: <20200715203317.GA771166@bogus>
References: <E1jqIlJ-0007rM-Oe@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jqIlJ-0007rM-Oe@rmk-PC.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 30 Jun 2020 17:05:33 +0100, Russell King wrote:
> Update the Marvell Armada 38x COMPHY binding with an additional
> optional register pair describing the location of an undocumented
> system register controlling something to do with the Gigabit Ethernet
> and COMPHY.  There is one bit for each COMPHY lane that may be using
> the serdes, but exactly what this register does is completely unknown.
> 
> This register only appears to exist on Armada 38x devices, and not
> other SoCs using the NETA ethernet block, so it seems logical that it
> should be part of the COMPHY.
> 
> This is also how u-boot groups this register; it is dealt with as part
> of the COMPHY initialisation there.
> 
> However, at the end of the day, due to the undocumented nature of this
> register, we can only guess.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/phy/phy-armada38x-comphy.txt   | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
