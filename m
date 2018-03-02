From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey: Enable HS200 mode on eMMC
Date: Fri, 2 Mar 2018 16:02:49 +0000
Message-ID: <5A9975A9.6050409@hisilicon.com>
References: <20180117203531.17152-1-ryan@edited.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117203531.17152-1-ryan@edited.us>
Sender: linux-kernel-owner@vger.kernel.org
To: oscardagrach <ryan@edited.us>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ryan,

On 2018/1/17 20:35, oscardagrach wrote:
> According to the hi6220 datasheet, the MMC controller is JEDEC eMMC 4.5
> compliant, in addition to supporting a clock of up to 150MHz. The Hikey
> schematic also indicates the device utilizes 1.8v signaling. Define these
> parameters in the device tree to enable HS200 mode.
> 
> Signed-off-by: Ryan Grachek <ryan@edited.us>
> ---

Applied into hisilicon dt tree.
Thanks!

BR,
Wei

>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index 3aee6123d161..964e43e05ac6 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -299,7 +299,9 @@
>  		/* GPIO blocks 16 thru 19 do not appear to be routed to pins */
>  
>  		dwmmc_0: dwmmc0@f723d000 {
> +			max-frequency = <150000000>;
>  			cap-mmc-highspeed;
> +			mmc-hs200-1_8v;
>  			non-removable;
>  			bus-width = <0x8>;
>  			vmmc-supply = <&ldo19>;
> 
