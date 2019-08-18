Return-Path: <SRS0=O/Z5=WO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40043 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfHRNl7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 18 Aug 2019 09:41:59 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
References: <20190808203204.8614-1-oleg@kaa.org.ua>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
Date: Sun, 18 Aug 2019 15:41:53 +0200
MIME-Version: 1.0
In-Reply-To: <20190808203204.8614-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/leds/leds-el15203000.txt         | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..4c2245babfdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,47 @@
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
> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt

Please change this label description to the below:

- function: see Documentation/devicetree/bindings/leds/common.txt.
- color: See Documentation/devicetree/bindings/leds/common.txt.
- label: See Documentation/devicetree/bindings/leds/common.txt (deprecated).

> +- linux,default-trigger :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------

#include <dt-bindings/leds/common.h>

> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	pipe@50 {

s/pipe/led/

> +		reg = <0x50>;
> +		label = "red:pipe";

label is now deprecated.

Please use function and color:

	function = "pipe";
	color = <LED_COLOR_ID_RED>;


> +	};
> +
> +	/* screen frame */
> +	screen@53 {

s/screen/led/

> +		reg = <0x53>;
> +		label = "red:screen";

	function = "screen";
	color = <LED_COLOR_ID_RED>;

> +	};
> +
> +	/* vending area */
> +	vend@56 {

s/vend/led/

> +		reg = <0x56>;
> +		label = "red:vend";

	function = "vend";
	color = <LED_COLOR_ID_RED>;

> +	};
> +};
> 

-- 
Best regards,
Jacek Anaszewski
