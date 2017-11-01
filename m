From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V1] regulator: da9211: update for supporting da9223/4/5
Date: Wed, 1 Nov 2017 16:40:04 -0500
Message-ID: <20171101214004.6kvifznxpdfey2cl@rob-hp-laptop>
References: <20171030024902.49A5E5F7E8@krsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171030024902.49A5E5F7E8@krsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bans <James.Ban.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, mark.rutland@arm.com, DEVICETREE <devicetree@vger.kernel.org>, DEVICETREE <dt@kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 11:32:38AM +0900, James Bans wrote:
> 
> From: James Ban <James.Ban.opensource@diasemi.com>
> 
> This is update for supporting additional devices da9223/4/5.
> Only device strings is added because only package type is different.
> 
> Signed-off-by: James Ban <James.Ban..opensource@diasemi.com>
> 
> ---
> This patch applies against linux-next and next-20171018 
> 
> 
>  .../devicetree/bindings/regulator/da9211.txt       |   82 ++++++++++++++++++--
>  drivers/regulator/Kconfig                          |    2 +-
>  drivers/regulator/da9211-regulator.c               |   14 +++-
>  drivers/regulator/da9211-regulator.h               |    2 +-
>  include/linux/regulator/da9211.h                   |    5 +-
>  5 files changed, 91 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
> index 0f2a6f8..27717e8 100644
> --- a/Documentation/devicetree/bindings/regulator/da9211.txt
> +++ b/Documentation/devicetree/bindings/regulator/da9211.txt
> @@ -1,8 +1,9 @@
> -* Dialog Semiconductor DA9211/DA9212/DA9213/DA9214/DA9215 Voltage Regulator
> +* Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
> + Voltage Regulator
>  
>  Required properties:
> -- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213"
> -  or "dlg,da9214" or "dlg,da9215"
> +- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213" or "dlg,da9223"
> +  or "dlg,da9214" or "dlg,da9224" or "dlg,da9215" or "dlg,da9225"

Format this as 1 per line please.

>  - reg: I2C slave address, usually 0x68.
>  - interrupts: the interrupt outputs of the controller
>  - regulators: A node that houses a sub-node for each regulator within the
> @@ -16,7 +17,6 @@ Optional properties:
>  - Any optional property defined in regulator.txt
>  
>  Example 1) DA9211
> -

Spurious change.

>  	pmic: da9211@68 {
>  		compatible = "dlg,da9211";
>  		reg = <0x68>;
> @@ -35,7 +35,6 @@ Example 1) DA9211
>  	};
>  
>  Example 2) DA9212
> -
>  	pmic: da9212@68 {
>  		compatible = "dlg,da9212";
>  		reg = <0x68>;
> @@ -79,7 +78,25 @@ Example 3) DA9213
>  		};
>  	};
>  
> -Example 4) DA9214
> +Example 4) DA9223
> +	pmic: da9223@68 {
> +		compatible = "dlg,da9223";
> +		reg = <0x68>;
> +		interrupts = <3 27>;
> +
> +		regulators {
> +			BUCKA {
> +				regulator-name = "VBUCKA";
> +				regulator-min-microvolt = < 300000>;
> +				regulator-max-microvolt = <1570000>;
> +				regulator-min-microamp 	= <3000000>;
> +				regulator-max-microamp 	= <6000000>;
> +				enable-gpios = <&gpio 27 0>;
> +			};
> +		};
> +	};
> +
> +Example 5) DA9214
>  	pmic: da9214@68 {
>  		compatible = "dlg,da9214";
>  		reg = <0x68>;
> @@ -105,7 +122,33 @@ Example 4) DA9214
>  		};
>  	};
>  
> -Example 5) DA9215
> +Example 6) DA9224
> +	pmic: da9224@68 {
> +		compatible = "dlg,da9224";
> +		reg = <0x68>;
> +		interrupts = <3 27>;
> +
> +		regulators {
> +			BUCKA {
> +				regulator-name = "VBUCKA";
> +				regulator-min-microvolt = < 300000>;
> +				regulator-max-microvolt = <1570000>;
> +				regulator-min-microamp 	= <3000000>;
> +				regulator-max-microamp 	= <6000000>;
> +				enable-gpios = <&gpio 27 0>;
> +			};
> +			BUCKB {
> +				regulator-name = "VBUCKB";
> +				regulator-min-microvolt = < 300000>;
> +				regulator-max-microvolt = <1570000>;
> +				regulator-min-microamp 	= <3000000>;
> +				regulator-max-microamp 	= <6000000>;
> +				enable-gpios = <&gpio 17 0>;
> +			};
> +		};
> +	};
> +
> +Example 7) DA9215
>  	pmic: da9215@68 {
>  		compatible = "dlg,da9215";
>  		reg = <0x68>;
> @@ -131,3 +174,28 @@ Example 5) DA9215
>  		};
>  	};
>  
> +Example 8) DA9225

Do we really need 8 examples? Examples are not for enumerating all 
possible bindings.

> +	pmic: da9225@68 {
> +		compatible = "dlg,da9225";
> +		reg = <0x68>;
> +		interrupts = <3 27>;
> +
> +		regulators {
> +			BUCKA {
> +				regulator-name = "VBUCKA";
> +				regulator-min-microvolt = < 300000>;
> +				regulator-max-microvolt = <1570000>;
> +				regulator-min-microamp 	= <4000000>;
> +				regulator-max-microamp 	= <7000000>;
> +				enable-gpios = <&gpio 27 0>;
> +			};
> +			BUCKB {
> +				regulator-name = "VBUCKB";
> +				regulator-min-microvolt = < 300000>;
> +				regulator-max-microvolt = <1570000>;
> +				regulator-min-microamp 	= <4000000>;
> +				regulator-max-microamp 	= <7000000>;
> +				enable-gpios = <&gpio 17 0>;
> +			};
> +		};
> +	};
