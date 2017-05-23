From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: stm32: enable CRC32 on stm32429i-eval
 board
Date: Tue, 23 May 2017 15:59:39 +0200
Message-ID: <eb66d194-ffbb-bf99-8af4-591790a4d83c@st.com>
References: <cover.1495463449.git.cosardindar@gmail.com>
 <2819bf67e93e583229741b7f5f838fba85d41e33.1495463449.git.cosardindar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2819bf67e93e583229741b7f5f838fba85d41e33.1495463449.git.cosardindar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cosar Dindar <cosardindar@gmail.com>, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, fabien.dessenne@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/22/2017 04:35 PM, Cosar Dindar wrote:
> Enable the CRC32 crypto on stm32429i-eval board.
>
> Signed-off-by: Cosar Dindar <cosardindar@gmail.com>
> ---

Will be applied in STM32 branch for next pull request.

Thanks
Alex

>  arch/arm/boot/dts/stm32429i-eval.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index b633114..360fb19 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -141,6 +141,10 @@
>  	clock-frequency = <25000000>;
>  };
>
> +&crc {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	pinctrl-0 = <&i2c1_pins>;
>  	pinctrl-names = "default";
>
