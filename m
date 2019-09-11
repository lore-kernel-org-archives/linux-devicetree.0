Return-Path: <SRS0=ocCc=XG=ti.com=dmurphy@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: Add docs for EL15203000
References: <20190909071632.14392-1-oleg@kaa.org.ua>
 <20190909071632.14392-2-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0a24cdf0-4915-ff59-482d-d25def25d65f@ti.com>
Date: Wed, 11 Sep 2019 14:48:20 -0500
MIME-Version: 1.0
In-Reply-To: <20190909071632.14392-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Oleh

On 9/9/19 2:16 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..c00e1b55db97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,54 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- reg :
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt

FYI this binding Documentation/devicetree/bindings/spi/spi-bus.txt 
points to spi-controller.yaml binding

so maybe update it to the correct binding.

> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
Your driver does not read spi-max-frequency, this is a property of the 
spi driver so I am not sure you

need to mention that here unless this property needs to be set 
specifically for this device.  If it does then it is not optional

for this device and it should be documented what the max freq is.

> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt

You point the user to the common file but you use hard coded function 
names in the example.

The leds/common.txt file points to the include/dt-bindings/leds/common.h 
file and the binding says

"If there is no matching LED_FUNCTION available, add a new one."

Now I know we don't want to add the pipe, screen or vend so you probably 
do not want to have the user

going to that header.

Not sure how to fix this but the documentation is misleading. Jacek?


> +- color:
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- label:
> +	see Documentation/devicetree/bindings/leds/common.txt (deprecated)

Not sure if someone asked for this here but since this is a new driver 
it should not even speak of the "label" property.

Dan

<snip>
