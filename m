From: agajjar <Akash_Gajjar@mentor.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: rockpro64 fix video output
 chain
Date: Wed, 5 Dec 2018 18:33:29 +0530
Message-ID: <09287391-d541-cddb-4168-55ca6fee3f16@mentor.com>
References: <20181201100817.20688-1-oskari@lemmela.net>
 <20181201100817.20688-3-oskari@lemmela.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201100817.20688-3-oskari@lemmela.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oskari Lemmela <oskari@lemmela.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/1/2018 3:38 PM, Oskari Lemmela wrote:
> Rockpro64 is not able boot if kernel is compiled with
> CONFIG_DRM_ROCKCHIP=m
>
> Enable Rockpro64 board HDMI output to fix issue.

Hi Oskari,

Could you please describe this issue in detail.

I am not able to reproduce this issue if CONFIG_DRM_ROCKCHIP is compile 
in or as a loadable module at the same time hdmi node is present or not.

> Signed-off-by: Oskari Lemmela <oskari@lemmela.net>
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> index 5bd4d69914bd..be78172abc09 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> @@ -205,6 +205,13 @@
>   	status = "okay";
>   };
>   
> +&hdmi {
> +	ddc-i2c-bus = <&i2c3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_cec>;
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	clock-frequency = <400000>;
>   	i2c-scl-rising-time-ns = <168>;
