Return-Path: <SRS0=IkuC=QG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36581 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731048AbfA3PGm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Jan 2019 10:06:42 -0500
Date: Wed, 30 Jan 2019 16:06:40 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] Documentation: bindings: Add RV1805 to abracon,abx80x
 bindings
Message-ID: <20190130150640.GH19959@piout.net>
References: <20190129113950.18575-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190129113950.18575-1-marex@denx.de>
Sender: devicetree-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 29/01/2019 12:39:50+0100, Marek Vasut wrote:
> Add compatible string for Microcrystal RV1805 RTC, which is compatible
> with AB1805. The RV1805 uses smaller 10 pin package, while the AB1805
> uses larger 16pin package, however the die inside the chip is the same.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
