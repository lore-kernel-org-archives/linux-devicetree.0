From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: dts: keystone: use common "ti,keystone" compatible
 instead of -evm
Date: Thu, 20 Mar 2014 16:58:34 -0400
Message-ID: <532B567A.5060508@ti.com>
References: <1395148354-22412-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1395148354-22412-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: olof@lixom.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grygorii.strashko@ti.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 March 2014 09:12 AM, Ivan Khoronzhuk wrote:
> As suggested by Olof Johansson at
> http://www.spinics.net/lists/arm-kernel/msg314009.html.
> It be better just keeping a "ti,keystone" top-level compatible and
> just using that to probe. If so we don't have to touch the file
> for new boards in the future.
> 
> So use common "ti,keystone" compatible in keystone.c for all boards.
> 
> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
> 
> Based on linux-next/master
> 
Applying it to for_3.15/fixes

>  Documentation/devicetree/bindings/arm/keystone/keystone.txt | 6 +++---
>  arch/arm/boot/dts/k2e-evm.dts                               | 2 +-
>  arch/arm/boot/dts/k2hk-evm.dts                              | 2 +-
>  arch/arm/boot/dts/k2l-evm.dts                               | 2 +-
>  arch/arm/mach-keystone/keystone.c                           | 5 +----
>  5 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
> index ad16e7a..59d7a46 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
> +++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
> @@ -11,10 +11,10 @@ Required properties:
>  
>  Boards:
>  -  Keystone 2 Hawking/Kepler EVM
> -   compatible = "ti,k2hk-evm"
> +   compatible = "ti,k2hk-evm","ti,keystone"
>  
>  -  Keystone 2 Lamarr EVM
> -   compatible = "ti,k2l-evm"
> +   compatible = "ti,k2l-evm","ti,keystone"
>  
>  -  Keystone 2 Edison EVM
> -   compatible = "ti,k2e-evm"
> +   compatible = "ti,k2e-evm","ti,keystone"
> diff --git a/arch/arm/boot/dts/k2e-evm.dts b/arch/arm/boot/dts/k2e-evm.dts
> index bb8faeb..74b3b63 100644
> --- a/arch/arm/boot/dts/k2e-evm.dts
> +++ b/arch/arm/boot/dts/k2e-evm.dts
> @@ -13,7 +13,7 @@
>  #include "k2e.dtsi"
>  
>  / {
> -	compatible =  "ti,k2e-evm";
> +	compatible =  "ti,k2e-evm","ti,keystone";
>  	model = "Texas Instruments Keystone 2 Edison EVM";
>  
>  	soc {
> diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
> index 1a1335b..f2a6658 100644
> --- a/arch/arm/boot/dts/k2hk-evm.dts
> +++ b/arch/arm/boot/dts/k2hk-evm.dts
> @@ -13,7 +13,7 @@
>  #include "k2hk.dtsi"
>  
>  / {
> -	compatible =  "ti,k2hk-evm";
> +	compatible =  "ti,k2hk-evm","ti,keystone";
>  	model = "Texas Instruments Keystone 2 Kepler/Hawking EVM";
>  
>  	soc {
> diff --git a/arch/arm/boot/dts/k2l-evm.dts b/arch/arm/boot/dts/k2l-evm.dts
> index ebf316a..50a7013 100644
> --- a/arch/arm/boot/dts/k2l-evm.dts
> +++ b/arch/arm/boot/dts/k2l-evm.dts
> @@ -13,7 +13,7 @@
>  #include "k2l.dtsi"
>  
>  / {
> -	compatible =  "ti,k2l-evm";
> +	compatible =  "ti,k2l-evm","ti,keystone";
>  	model = "Texas Instruments Keystone 2 Lamarr EVM";
>  
>  	soc {
> diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
> index aa0d212..e0b9e1b 100644
> --- a/arch/arm/mach-keystone/keystone.c
> +++ b/arch/arm/mach-keystone/keystone.c
> @@ -46,10 +46,7 @@ static void __init keystone_init(void)
>  }
>  
>  static const char *keystone_match[] __initconst = {
> -	"ti,keystone-evm",
> -	"ti,k2hk-evm",
> -	"ti,k2l-evm",
> -	"ti,k2e-evm",
> +	"ti,keystone",
>  	NULL,
>  };
>  
> 

