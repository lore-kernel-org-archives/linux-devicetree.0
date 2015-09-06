From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH]  ARM: dts: vfxxx: Add iio_hwmon node for ADC temperature
 channel
Date: Sun, 6 Sep 2015 12:35:51 +0800
Message-ID: <20150906043551.GE30746@tiger>
References: <b639ca620369d196491a4af8739b87d580e71bf6.1438876380.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b639ca620369d196491a4af8739b87d580e71bf6.1438876380.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sanchayan Maity <maitysanchayan@gmail.com>
Cc: stefan@agner.ch, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 06, 2015 at 09:28:22PM +0530, Sanchayan Maity wrote:
> Add iio_hwmon node to expose the temperature channel on Vybrid
> as hardware monitor device using the iio_hwmon driver.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 39173bb..0993d66 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -597,5 +597,10 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		iio_hwmon {
> +			compatible = "iio-hwmon";
> +			io-channels = <&adc0 16>;
> +		};

Also, what's the reason that the node is being put under
aips-bus@40080000 (aips1)?

Shawn

>  	};
>  };
> -- 
> 2.5.0
> 
