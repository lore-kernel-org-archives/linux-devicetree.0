Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729353AbfFGUOM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 16:14:12 -0400
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
Date: Fri, 7 Jun 2019 15:14:08 -0500
MIME-Version: 1.0
In-Reply-To: <20190607184022.13793-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oleh

On 6/7/19 1:40 PM, Oleh Kravchenko wrote:
> Add documentation and example for dt-bindings EL15203000.
> LED board (aka RED LED board) from Crane Merchandising Systems.
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../bindings/leds/leds-el15203000.txt         | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> new file mode 100644
> index 000000000000..457fd8d7226f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,53 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in coffee vending machines
> +produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +- reg :
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +- spi-max-frequency : (optional)
> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt

Add this

Optional LED sub-node properties:

And remove (optional) from the below.

> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- max-brightness : (optional)
> +	Specify here 2 if LED has special effect. Effects by LED type:

s/Specify here 2/Specify 2

But this is not really max_brightness now this is a feature and now does 
not make sense in this context

You may need to use something different for this property or expose a 
file in the driver.


> +	- Pipe has leaking
> +	- Screen Frame has blinking
> +
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
