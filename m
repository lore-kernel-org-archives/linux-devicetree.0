From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] ARM: dts: vf: Fix memory node duplication
Date: Mon, 03 Dec 2018 14:40:38 +0100
Message-ID: <d055ad83728d3fe5f7d7cd4403158987@agner.ch>
References: <1543625092-24498-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1543625092-24498-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01.12.2018 01:44, Fabio Estevam wrote:
> Boards based on vf500/vf600 have duplicate memory nodes:
> 
> - One coming from the board dts file: memory@
> 
> - One coming from the vf500.dtsi/vf610m4.dtsi files.
> 
> Fix the duplication by removing the memory node from the dtsi file
> and by adding 'device_type = "memory";' in the board dts.

Looks good to me:

Reviewed-by: Stefan Agner <stefan@agner.ch>

> 
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm/boot/dts/vf500-colibri.dtsi      | 1 +
>  arch/arm/boot/dts/vf500.dtsi              | 1 -
>  arch/arm/boot/dts/vf610-bk4.dts           | 1 +
>  arch/arm/boot/dts/vf610-colibri.dtsi      | 1 +
>  arch/arm/boot/dts/vf610-cosmic.dts        | 1 +
>  arch/arm/boot/dts/vf610-twr.dts           | 1 +
>  arch/arm/boot/dts/vf610-zii-cfu1.dts      | 1 +
>  arch/arm/boot/dts/vf610-zii-dev.dtsi      | 1 +
>  arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts | 1 +
>  arch/arm/boot/dts/vf610m4-colibri.dts     | 1 +
>  arch/arm/boot/dts/vf610m4.dtsi            | 1 -
>  11 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vf500-colibri.dtsi
> b/arch/arm/boot/dts/vf500-colibri.dtsi
> index 2e7e3ce..237b024 100644
> --- a/arch/arm/boot/dts/vf500-colibri.dtsi
> +++ b/arch/arm/boot/dts/vf500-colibri.dtsi
> @@ -47,6 +47,7 @@
>  	compatible = "toradex,vf610-colibri_vf50", "fsl,vf500";
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x8000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf500.dtsi b/arch/arm/boot/dts/vf500.dtsi
> index 76a0949..b0ec475 100644
> --- a/arch/arm/boot/dts/vf500.dtsi
> +++ b/arch/arm/boot/dts/vf500.dtsi
> @@ -10,7 +10,6 @@
>  	#size-cells = <1>;
>  	chosen { };
>  	aliases { };
> -	memory { device_type = "memory"; };
>  
>  	cpus {
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/vf610-bk4.dts b/arch/arm/boot/dts/vf610-bk4.dts
> index cab9571..689c893 100644
> --- a/arch/arm/boot/dts/vf610-bk4.dts
> +++ b/arch/arm/boot/dts/vf610-bk4.dts
> @@ -16,6 +16,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x8000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610-colibri.dtsi
> b/arch/arm/boot/dts/vf610-colibri.dtsi
> index aeaf99f..05c9a39 100644
> --- a/arch/arm/boot/dts/vf610-colibri.dtsi
> +++ b/arch/arm/boot/dts/vf610-colibri.dtsi
> @@ -47,6 +47,7 @@
>  	compatible = "toradex,vf610-colibri_vf61", "fsl,vf610";
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/vf610-cosmic.dts
> b/arch/arm/boot/dts/vf610-cosmic.dts
> index a3014e8..ea1b996 100644
> --- a/arch/arm/boot/dts/vf610-cosmic.dts
> +++ b/arch/arm/boot/dts/vf610-cosmic.dts
> @@ -20,6 +20,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
> index 59fceea..dbb5ffc 100644
> --- a/arch/arm/boot/dts/vf610-twr.dts
> +++ b/arch/arm/boot/dts/vf610-twr.dts
> @@ -14,6 +14,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x8000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610-zii-cfu1.dts
> b/arch/arm/boot/dts/vf610-zii-cfu1.dts
> index b76c3d04..7cdcc5f 100644
> --- a/arch/arm/boot/dts/vf610-zii-cfu1.dts
> +++ b/arch/arm/boot/dts/vf610-zii-cfu1.dts
> @@ -16,6 +16,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610-zii-dev.dtsi
> b/arch/arm/boot/dts/vf610-zii-dev.dtsi
> index 5ae5abf..19eb4a8 100644
> --- a/arch/arm/boot/dts/vf610-zii-dev.dtsi
> +++ b/arch/arm/boot/dts/vf610-zii-dev.dtsi
> @@ -50,6 +50,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts
> b/arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts
> index fe35766..757af56 100644
> --- a/arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts
> +++ b/arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts
> @@ -24,6 +24,7 @@
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/vf610m4-colibri.dts
> b/arch/arm/boot/dts/vf610m4-colibri.dts
> index ca62495..d4bc0e3 100644
> --- a/arch/arm/boot/dts/vf610m4-colibri.dts
> +++ b/arch/arm/boot/dts/vf610m4-colibri.dts
> @@ -55,6 +55,7 @@
>  	};
>  
>  	memory@8c000000 {
> +		device_type = "memory";
>  		reg = <0x8c000000 0x3000000>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/vf610m4.dtsi b/arch/arm/boot/dts/vf610m4.dtsi
> index 8293276..76bbfd5 100644
> --- a/arch/arm/boot/dts/vf610m4.dtsi
> +++ b/arch/arm/boot/dts/vf610m4.dtsi
> @@ -50,7 +50,6 @@
>  	#size-cells = <1>;
>  	chosen { };
>  	aliases { };
> -	memory { device_type = "memory"; };
>  };
>  
>  &mscm_ir {
