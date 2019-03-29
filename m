Return-Path: <robherring2@gmail.com>
Date: Fri, 29 Mar 2019 11:21:11 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] power: supply: ltc3651-charger.c: Fix typo in device name
Message-ID: <20190329162111.GB13068@bogus>
References: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
To: michael.hennerich@analog.com
Cc: mike.looijmans@topic.nl, sre@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 26, 2019 at 02:57:15PM +0100, michael.hennerich@analog.com wrote:
> From: Michael Hennerich <michael.hennerich@analog.com>

Seems to be a bit more than 'fix a typo'.

> 
> There never was a device called LTC3651, it always was just LT3651.
> This circumstance makes it pretty difficult to identify what this
> driver is meant to control. This patch is a minimal invasive attempt
> to fix this issue without affecting existing systems.
> 
> 
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> ---
>  .../devicetree/bindings/power/supply/ltc3651-charger.txt         | 8 +++++---
>  drivers/power/supply/Kconfig                                     | 6 +++---
>  drivers/power/supply/ltc3651-charger.c                           | 9 +++------
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> index 71f2840..f012449 100644
> --- a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> +++ b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> @@ -1,7 +1,9 @@
> -ltc3651-charger
> +Analog Devices LT3651 Charger Power Supply bindings: ltc3651-charger
>  
>  Required properties:
> - - compatible: "lltc,ltc3651-charger"
> +- compatible: Should contain one of the following:
> + * "lltc,ltc3651-charger",

You should note that this one is deprecated.

> + * "lltc,lt3651-charger"
>   - lltc,acpr-gpios: Connect to ACPR output. See remark below.
>  
>  Optional properties:
> @@ -20,7 +22,7 @@ attributes to detect changes.
>  Example:
>  
>  	charger: battery-charger {
> -		compatible = "lltc,ltc3651-charger";
> +		compatible = "lltc,lt3651-charger";
>  		lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
>  		lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
>  		lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
