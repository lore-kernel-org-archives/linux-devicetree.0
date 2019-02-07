Return-Path: <SRS0=K5hT=QO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42541 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfBGUmR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Feb 2019 15:42:17 -0500
Date: Thu, 7 Feb 2019 21:42:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] rtx: x1205: Add DT bindings
Message-ID: <20190207204214.GI4719@piout.net>
References: <20190131150642.26289-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131150642.26289-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 31/01/2019 16:06:41+0100, Linus Walleij wrote:
> This adds device tree bindings for the Xircom X1205 RTC found
> in the Linksys NSLU2.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/rtc/xircom,x1205.txt         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/xircom,x1205.txt
> 

I chose to not apply that one and instead amend your following patch to
add the compatible with the trivial RTCs in rtc.txt

> diff --git a/Documentation/devicetree/bindings/rtc/xircom,x1205.txt b/Documentation/devicetree/bindings/rtc/xircom,x1205.txt
> new file mode 100644
> index 000000000000..3e3102a32728
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/xircom,x1205.txt
> @@ -0,0 +1,12 @@
> +* Xircom X1205 I2C RTC
> +
> +Required properties:
> +- compatible: Should be "xircom,x1205"
> +- reg: I2C address
> +
> +Example:
> +
> +rtc@6f {
> +	compatible = "xicor,x1205";
> +	reg = <0x6f>;
> +};
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
