From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey960: Define wl1837 power capabilities
Date: Thu, 28 Jun 2018 21:26:41 +0100
Message-ID: <5B354481.5080207@hisilicon.com>
References: <20180613180321.16745-1-ryan@edited.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180613180321.16745-1-ryan@edited.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Grachek <ryan@edited.us>
Cc: valentin.schneider@arm.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ryan,

On 2018/6/13 19:03, Ryan Grachek wrote:
> These properties are required for compatibility with runtime PM.
> Without these properties, MMC host controller will not be aware
> of power capabilities. When the wlcore driver attempts to power
> on the device, it will erroneously fail with -EACCES. This fixes
> a regression found here: https://lkml.org/lkml/2018/6/12/930
> 
> Signed-off-by: Ryan Grachek <ryan@edited.us>
> ---

Applied to hisilicon fix tree.
Thanks!

Best Regards,
Wei

>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index c6999624ed8a..68c5a6c819ae 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -585,6 +585,8 @@
>  	vmmc-supply = <&wlan_en>;
>  	ti,non-removable;
>  	non-removable;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
>  	#address-cells = <0x1>;
>  	#size-cells = <0x0>;
>  	status = "ok";
> 
