Return-Path: <SRS0=JYCW=6X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7E4C28CBC
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 May 2020 16:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25D2321775
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 May 2020 16:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LGrU9PG0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgEIQ50 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 9 May 2020 12:57:26 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:51108 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727863AbgEIQ50 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 9 May 2020 12:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FP6k8ixj7mph1KU11W2u01gg1q9cnvCDF31U5pD63w4=; b=LGrU9PG0eYkavfrr4m6SIJ2yl9
        RcD5uFrum5Qprex85cnXTKhH5j9jzK0MkaOTBO6T6ddCSaZAJbJJVTkKblg7uHxc/VZPsADUDANAX
        GluOAHSCeLK80GICVz91swR7sb8eoSdG0ruaQu8OjC5xbcLwsZE226UI3Gkd1Xw/qiQ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jXSmx-001WWA-99; Sat, 09 May 2020 18:57:23 +0200
Date:   Sat, 9 May 2020 18:57:23 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     netdev@vger.kernel.org, f.fainelli@gmail.com, davem@davemloft.net,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: net: dsa: document additional
 Microchip KSZ8863/8873 switch
Message-ID: <20200509165723.GC362499@lunn.ch>
References: <20200508154343.6074-1-m.grzeschik@pengutronix.de>
 <20200508154343.6074-6-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508154343.6074-6-m.grzeschik@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 08, 2020 at 05:43:43PM +0200, Michael Grzeschik wrote:
> It is a 3-Port 10/100 Ethernet Switch. One CPU-Port and two
> Switch-Ports.
> 
> Cc: devicetree@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
