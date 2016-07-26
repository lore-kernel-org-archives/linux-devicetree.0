From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/4] iio: adc: rockchip_saradc: reset saradc controller before programming it
Date: Tue, 26 Jul 2016 11:17:34 +0200
Message-ID: <12149198.2BnIdx96cc@diego>
References: <1469513510-1516-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469513510-1516-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: jic23@kernel.org, robh+dt@kernel.org, linux-iio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux@roeck-us.net, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 26. Juli 2016, 14:11:47 schrieb Caesar Wang:
> SARADC controller needs to be reset before programming it, otherwise
> it will not function properly.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-iio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
> 
>  .../bindings/iio/adc/rockchip-saradc.txt           |  5 +++++
>  drivers/iio/adc/Kconfig                            |  1 +
>  drivers/iio/adc/rockchip_saradc.c                  | 22
> ++++++++++++++++++++++ 3 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt index
> bf99e2f..d2258be 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> @@ -13,6 +13,9 @@ Required properties:
>  - clocks: Must contain an entry for each entry in clock-names.
>  - clock-names: Shall be "saradc" for the converter-clock, and "apb_pclk"
> for the peripheral clock.
> +- resets: Must contain an entry for each entry in reset-names.
> +	  See ../reset/reset.txt for details.
> +- reset-names: Must include the name "saradc-apb".

as pointed out by John, this should be an optional property, as it should work 
with old devicetrees as well.
