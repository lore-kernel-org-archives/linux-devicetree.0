Return-Path: <SRS0=rSv0=RZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:38599 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbfCVGXw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Mar 2019 02:23:52 -0400
Date: Fri, 22 Mar 2019 07:23:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2 v2] rtc: x1205: Add DT bindings
Message-ID: <20190322062343.GW29054@piout.net>
References: <20190319074014.20616-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319074014.20616-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 19/03/2019 08:40:13+0100, Linus Walleij wrote:
> This adds device tree bindings for the Xircom X1205 RTC found
> in the Linksys NSLU2.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebase on v5.1-rc1
> - Resend
> ---
>  .../devicetree/bindings/rtc/xircom,x1205.txt         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xircom,x1205.txt
> 

Both applied (this time), thanks!

I've moved the doc to rtc.txt as this is a trivial rtc.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
