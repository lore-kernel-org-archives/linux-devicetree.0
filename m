From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [RFC PATCH v3 05/17] ARM: dts: at91: cpus/cpu node dts updates
Date: Mon, 29 Apr 2013 11:54:46 +0200
Message-ID: <517E4366.4040209@atmel.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-6-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366824502-19729-6-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Sekhar Nori <nsekhar@ti.com>, devicetree-discuss@lists.ozlabs.o
List-Id: devicetree@vger.kernel.org

On 04/24/2013 07:28 PM, Lorenzo Pieralisi :
> This patch updates the in-kernel dts files according to the latest cpus
> and cpu bindings updates for ARM.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

With changes in compatible string... ok then.

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  arch/arm/boot/dts/at91rm9200.dtsi  | 6 +++++-
>  arch/arm/boot/dts/at91sam9260.dtsi | 8 ++++++--
>  arch/arm/boot/dts/at91sam9263.dtsi | 8 ++++++--
>  arch/arm/boot/dts/at91sam9g45.dtsi | 8 ++++++--
>  arch/arm/boot/dts/at91sam9n12.dtsi | 8 ++++++--
>  arch/arm/boot/dts/at91sam9x5.dtsi  | 8 ++++++--
>  6 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
> index b0268a5..f16b3d4 100644
> --- a/arch/arm/boot/dts/at91rm9200.dtsi
> +++ b/arch/arm/boot/dts/at91rm9200.dtsi
> @@ -34,8 +34,12 @@
>  		ssc2 = &ssc2;
>  	};
>  	cpus {
> -		cpu@0 {
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
>  			compatible = "arm,arm920t";
> +			device_type = "cpu";
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
> index cb7bcc5..c4eeef7 100644
> --- a/arch/arm/boot/dts/at91sam9260.dtsi
> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> @@ -32,8 +32,12 @@
>  		ssc0 = &ssc0;
>  	};
>  	cpus {
> -		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
> index 271d4de..f3b5c2a 100644
> --- a/arch/arm/boot/dts/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
> @@ -29,8 +29,12 @@
>  		ssc1 = &ssc1;
>  	};
>  	cpus {
> -		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
> index 6b1d4ca..6c18bd3 100644
> --- a/arch/arm/boot/dts/at91sam9g45.dtsi
> +++ b/arch/arm/boot/dts/at91sam9g45.dtsi
> @@ -35,8 +35,12 @@
>  		ssc1 = &ssc1;
>  	};
>  	cpus {
> -		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
> index 7750f98..c3b11af 100644
> --- a/arch/arm/boot/dts/at91sam9n12.dtsi
> +++ b/arch/arm/boot/dts/at91sam9n12.dtsi
> @@ -31,8 +31,12 @@
>  		ssc0 = &ssc0;
>  	};
>  	cpus {
> -		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
> index aa98e64..6c39d0f 100644
> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> @@ -33,8 +33,12 @@
>  		ssc0 = &ssc0;
>  	};
>  	cpus {
> -		cpu@0 {
> -			compatible = "arm,arm926ejs";
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
>  		};
>  	};
>  
> 


-- 
Nicolas Ferre
