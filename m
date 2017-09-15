From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH 2/3] ARM: dts: at91: usb_a9g20: fix rtc node
Date: Fri, 15 Sep 2017 09:08:31 +0200
Message-ID: <bf64c774-9057-d73e-8f39-7fcc5f32725c@microchip.com>
References: <20170915020004.24272-1-alexandre.belloni@free-electrons.com>
 <20170915020004.24272-2-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915020004.24272-2-alexandre.belloni@free-electrons.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15/09/2017 at 04:00, Alexandre Belloni wrote:
> The rv3029 compatible is missing its vendor string, add it.
> Also fix the node name to be a proper generic name.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>  arch/arm/boot/dts/usb_a9g20_common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/usb_a9g20_common.dtsi b/arch/arm/boot/dts/usb_a9g20_common.dtsi
> index 088c2c3685ab..81c3fe0465d9 100644
> --- a/arch/arm/boot/dts/usb_a9g20_common.dtsi
> +++ b/arch/arm/boot/dts/usb_a9g20_common.dtsi
> @@ -20,8 +20,8 @@
>  	};
>  
>  	i2c-gpio-0 {
> -		rv3029c2@56 {
> -			compatible = "rv3029c2";
> +		rtc@56 {
> +			compatible = "microcrystal,rv3029";
>  			reg = <0x56>;
>  		};
>  	};
> 


-- 
Nicolas Ferre
