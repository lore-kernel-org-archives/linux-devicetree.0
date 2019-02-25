Return-Path: <SRS0=cWXf=RA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40914 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbfBYOgn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Feb 2019 09:36:43 -0500
Date: Mon, 25 Feb 2019 06:36:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices
 AD741x
Message-ID: <20190225143639.GA5781@roeck-us.net>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128210637.22323-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 28, 2019 at 10:06:36PM +0100, Linus Walleij wrote:
> This adds device tree bindings for Analog Devices AD741x
> as found in Gateway routers.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ad741x.txt b/Documentation/devicetree/bindings/hwmon/ad741x.txt
> new file mode 100644
> index 000000000000..9102152c8410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ad741x.txt
> @@ -0,0 +1,15 @@
> +* AD7416/AD7417/AD7418 Temperature Sensor Device Tree Bindings
> +
> +Required properties:
> +- compatible: one of
> +		"adi,ad7416"
> +		"adi,ad7417"
> +		"adi,ad7418"
> +- reg: I2C address
> +
> +Example:
> +
> +hwmon@28 {
> +	compatible = "adi,ad7418";
> +	reg = <0x28>;
> +};
