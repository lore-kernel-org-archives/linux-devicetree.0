From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: Move
 'amlogic,meson-gx-ao-secure' binding to its own file
Date: Fri, 17 May 2019 17:34:38 +0200
Message-ID: <009f9311-4f26-0d80-a8da-062debe85291@baylibre.com>
References: <20190517152723.28518-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517152723.28518-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/05/2019 17:27, Rob Herring wrote:
> It is best practice to have 1 binding per file, so board level bindings
> should be separate for various misc SoC bindings.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> It seems this one fell thru the cracks and didn't get applied.
> 
>  .../devicetree/bindings/arm/amlogic.txt       | 29 -------------------
>  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ++++++++++++++++++
>  2 files changed, 28 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
> index 061f7b98a07f..5f650248b18e 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> @@ -111,32 +111,3 @@ Board compatible values (alphabetically, grouped by SoC):
>    - "amlogic,u200" (Meson g12a s905d2)
>    - "amediatech,x96-max" (Meson g12a s905x2)
>    - "seirobotics,sei510" (Meson g12a s905x2)
> -
> -Amlogic Meson Firmware registers Interface
> -------------------------------------------
> -
> -The Meson SoCs have a register bank with status and data shared with the
> -secure firmware.
> -
> -Required properties:
> - - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
> -
> -Properties should indentify components of this register interface :
> -
> -Meson GX SoC Information
> -------------------------
> -A firmware register encodes the SoC type, package and revision information on
> -the Meson GX SoCs.
> -If present, the following property should be added :
> -
> -Optional properties:
> -  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
> -
> -Example
> --------
> -
> -ao-secure@140 {
> -	compatible = "amlogic,meson-gx-ao-secure", "syscon";
> -	reg = <0x0 0x140 0x0 0x140>;
> -	amlogic,has-chip-id;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> new file mode 100644
> index 000000000000..c67d9f48fb91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> @@ -0,0 +1,28 @@
> +Amlogic Meson Firmware registers Interface
> +------------------------------------------
> +
> +The Meson SoCs have a register bank with status and data shared with the
> +secure firmware.
> +
> +Required properties:
> + - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
> +
> +Properties should indentify components of this register interface :
> +
> +Meson GX SoC Information
> +------------------------
> +A firmware register encodes the SoC type, package and revision information on
> +the Meson GX SoCs.
> +If present, the following property should be added :
> +
> +Optional properties:
> +  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
> +
> +Example
> +-------
> +
> +ao-secure@140 {
> +	compatible = "amlogic,meson-gx-ao-secure", "syscon";
> +	reg = <0x0 0x140 0x0 0x140>;
> +	amlogic,has-chip-id;
> +};


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
