From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 11/13] ARM: dts: rv1108: Add internal timer support
Date: Mon, 26 Nov 2018 09:57:13 +0100
Message-ID: <1767362.WRXMBNmjv7@phil>
References: <20181125211907.9895-1-otavio@ossystems.com.br> <20181125211907.9895-11-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-11-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

Am Sonntag, 25. November 2018, 22:19:05 CET schrieb Otavio Salvador:
> Add support for the internal timer peripheral on RV1108.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  arch/arm/boot/dts/rv1108.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
> index 7ef6d965871c..42566adadc83 100644
> --- a/arch/arm/boot/dts/rv1108.dtsi
> +++ b/arch/arm/boot/dts/rv1108.dtsi
> @@ -291,6 +291,14 @@
>  		};
>  	};
>  
> +	timer: timer@10350000 {
> +		compatible = "rockchip,rv1108-timer", "rockchip,rk3288-timer";

please also document that new compatible string in
Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt


Heiko
