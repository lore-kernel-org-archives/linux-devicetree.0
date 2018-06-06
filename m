From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH] ARM: dts: cygnus: Add HWRNG node
Date: Wed, 6 Jun 2018 09:03:55 -0700
Message-ID: <c8836130-1d96-b813-4e87-5011db679ba8@broadcom.com>
References: <20180606093441.16483-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606093441.16483-1-peron.clem@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Clement,


On 18-06-06 02:34 AM, Clément Péron wrote:
> From: Clément Peron <clement.peron@devialet.com>
>
> There is a HWRNG in Broadcom Cygnus SoC, so enable it.
>
> Signed-off-by: Clément Peron <clement.peron@devialet.com>
Thanks for upstreaming some missing Cygnus components.

But, the problem is the tarball release from Broadcom you are extracting 
these changes from does not contain git history; so, you are missing the 
original authors and signed-off's.
I checked our internal git repository and for this commit the author is:
Mohamed Ismail Abdul Packir Mohamed <mohamed-ismail.abdul@broadcom.com>

Please adjust author and signed-off appropriately.  If there are other 
changes you are extracting from the source tarballs you have please 
contact me so we can construct patch appropriately.

Regards,
Scott
> ---
>   arch/arm/boot/dts/bcm-cygnus.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
> index 1cee40ac4613..b7178e84d56d 100644
> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> @@ -452,6 +452,11 @@
>   			status = "disabled";
>   		};
>   
> +		hwrng: hwrng@18032000 {
> +			compatible = "brcm,iproc-rng200";
> +			reg = <0x18032000 0x28>;
> +		};
> +
>   		sdhci0: sdhci@18041000 {
>   			compatible = "brcm,sdhci-iproc-cygnus";
>   			reg = <0x18041000 0x100>;
