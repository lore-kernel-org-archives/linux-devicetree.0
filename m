Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57724 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfFGOlr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 10:41:47 -0400
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for
 EL15203000
References: <20190607114823.3735-1-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0df31c4a-2cd0-89fa-bd78-dc87de3c640b@ti.com>
Date: Fri, 7 Jun 2019 09:41:41 -0500
MIME-Version: 1.0
In-Reply-To: <20190607114823.3735-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oleh

On 6/7/19 6:48 AM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..f47ee91cb419
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,48 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in coffee vending machines
> +produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "crane,el15203000"
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply. In particular, "reg" and "spi-max-frequency" properties must be given.
> +

Can you please add this instead?

reg : see Documentation/devicetree/bindings/spi/spi-bus.txt

spi-max-frequency : see Documentation/devicetree/bindings/spi/spi-bus.txt


> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +

max-brightness?

That appears to be optional

N


> +Example
> +-------
> +
> +led-controller@0 {
> +	compatible = "crane,el15203000";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* water pipe */
> +	pipe@50 {
> +		reg = <0x50>;
> +		label = "red:pipe";
> +		max-brightness = <2>;
> +	};
> +
> +	/* screen frame */
> +	screen@53 {
> +		reg = <0x53>;
> +		label = "red:screen";
> +		max-brightness = <2>;
> +	};
> +
> +	/* vending area */
> +	vend@56 {
> +		reg = <0x56>;
> +		label = "red:vend";
> +	};
> +};
