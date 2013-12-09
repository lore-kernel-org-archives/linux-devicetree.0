From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH] ARM64: dts: Add clock-frequency to model cpu nodes
Date: Mon, 09 Dec 2013 17:56:05 +0000
Message-ID: <1386611765.3380.70.camel@linaro1.home>
References: <1386335683-11405-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386335683-11405-1-git-send-email-broonie@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2013-12-06 at 13:14 +0000, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> The clock-frequency property is meaningless for the models but it's a
> mandatory property so claim that all the cores run at 1MHz.

Is it a mandatory property? I know we seem to get ugly warnings if it's
missing but I see no mention of it at all in
Documentation/devicetree/bindings/arm/cpus.txt (am I looking in the
wrong place?)

I think this attribute got merged into the kernel with the early power
related scheduling efforts, but given the state of all that at the
moment I was guessing it might be obsolete.

-- Tixy

> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm64/boot/dts/foundation-v8.dts  | 4 ++++
>  arch/arm64/boot/dts/rtsm_ve-aemv8a.dts | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/foundation-v8.dts b/arch/arm64/boot/dts/foundation-v8.dts
> index 4a060906809d..f91b2fa41fb3 100644
> --- a/arch/arm64/boot/dts/foundation-v8.dts
> +++ b/arch/arm64/boot/dts/foundation-v8.dts
> @@ -34,6 +34,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@1 {
>  			device_type = "cpu";
> @@ -41,6 +42,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@2 {
>  			device_type = "cpu";
> @@ -48,6 +50,7 @@
>  			reg = <0x0 0x2>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@3 {
>  			device_type = "cpu";
> @@ -55,6 +58,7 @@
>  			reg = <0x0 0x3>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> index 572005ea2217..d7debfe79d9f 100644
> --- a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> +++ b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> @@ -37,6 +37,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@1 {
>  			device_type = "cpu";
> @@ -44,6 +45,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@2 {
>  			device_type = "cpu";
> @@ -51,6 +53,7 @@
>  			reg = <0x0 0x2>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  		cpu@3 {
>  			device_type = "cpu";
> @@ -58,6 +61,7 @@
>  			reg = <0x0 0x3>;
>  			enable-method = "spin-table";
>  			cpu-release-addr = <0x0 0x8000fff8>;
> +			clock-frequency = <1000000>;
>  		};
>  	};
>  
