Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Sep 2019 08:01:23 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH input-next 2/4] dt-bindings: input: mpr121: Add
 poll-interval property
Message-ID: <20190903070123.GA15981@bogus>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 02, 2019 at 01:40:15PM +0200, Michal Vokáč wrote:
> Add an option to periodicaly poll the device to get the buttons states
> as the interrupt line may not be used on some platforms.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> I am not sure how to propperly handle this.
> Either interrupt or linux,poll-interval is required, but not both.

Add this at the top level:

oneOf:
  - required: [ interrupts ]
  - required: [ linux,poll-interval ]

> 
>  .../bindings/input/fsl,mpr121-touchkey.yaml          | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> index c463c1c81755..2b3073a3c9f4 100644
> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> @@ -34,6 +34,10 @@ properties:
>      minItems: 1
>      maxItems: 12
>  
> +  linux,poll-interval:
> +    description: Poll interval time in milliseconds.
> +    maxItems: 1

We already have 'poll-interval' in several bindings. Use that.

This should have a type definition and you don't need maxItems:

$ref: /schemas/types.yaml#/definitions/uint32

Really this should go in a common input schema doc.
> +
>    wakeup-source: Use any event on keypad as wakeup event.
>      type: boolean
>  
> @@ -44,12 +48,12 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - vdd-supply
>    - linux,keycodes
>  
>  examples:
>    - |
> +    // Example with interrupts
>      #include "dt-bindings/input/input.h"
>      touchkey: mpr121@5a {
>          compatible = "fsl,mpr121-touchkey";
> @@ -62,3 +66,17 @@ examples:
>                           <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
>                           <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>      };
> +
> +  - |
> +    // Example with polling
> +    #include "dt-bindings/input/input.h"
> +    touchkey: mpr121@5a {
> +        compatible = "fsl,mpr121-touchkey";
> +        reg = <0x5a>;
> +        linux,poll-interval = <20>;
> +        autorepeat;
> +        vdd-supply = <&ldo4_reg>;
> +        linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
> +                         <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
> +                         <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> +    );
> -- 
> 2.1.4
> 
