From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: dts: enable hdmi for exynos5800 based peach-pi
 board
Date: Wed, 14 May 2014 21:56:36 +0200
Message-ID: <5373CA74.8080500@gmail.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com> <1400035562-16832-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1400035562-16832-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Rahul,

On 14.05.2014 04:46, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable hdmi for peach-pi board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 742655b..2a6f23b8 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -134,6 +134,25 @@
>  	};
>  };
>  
> +&i2c_2 {
> +	status = "okay";
> +	samsung,i2c-sda-delay = <100>;
> +	samsung,i2c-max-bus-freq = <66000>;
> +	samsung,i2c-slave-addr = <0x50>;
> +
> +	hdmiddc@50 {
> +		reg = <0x50>;
> +	};
> +};
> +
> +&hdmi {
> +	status = "okay";
> +	hpd-gpio = <&gpx3 7 2>;

What is the 2 flag? I don't see any value other than 0 and 1 defined in
include/dt-bindings/gpio/gpio.h. Also it would be better to use
preprocessor macros instead of magic numbers for flags like this.

Best regards,
Tomasz
