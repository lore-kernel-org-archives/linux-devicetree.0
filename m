From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 08/18] arm64: dts: ulcb-kf: enable CAN0/1
Date: Thu, 7 Sep 2017 12:50:44 +0300
Message-ID: <26913428-fc25-99ba-318c-315ace63717c@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737368-23152-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737368-23152-1-git-send-email-vladimir.barinov@cogentembedded.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 9/7/2017 1:36 AM, Vladimir Barinov wrote:

> This supports CAN0/1 on ULCB Kingfisher board
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>   arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 2449915..ca8de1a 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -16,6 +16,22 @@
>   	};
>   };
>   
> +&can0 {
> +	pinctrl-0 = <&can0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	renesas,can-clock-select = <0x0>;
> +};
> +
> +&can1 {
> +	pinctrl-0 = <&can1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	renesas,can-clock-select = <0x0>;

    IIRC, you can omit these Renesas specific props -- the driver uses 0 if it 
doesn't find the prop.

[...]

MBR, Sergei
