Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Feb 2019 08:28:24 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices
 AD741x
Message-ID: <20190225142824.GA29617@bogus>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128210637.22323-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 28 Jan 2019 22:06:36 +0100, Linus Walleij wrote:
> This adds device tree bindings for Analog Devices AD741x
> as found in Gateway routers.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
