Return-Path: <SRS0=ihK2=XI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39692 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388387AbfIMNkP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Sep 2019 09:40:15 -0400
Subject: Re: [PATCH v8 1/2] dt-bindings: Add docs for EL15203000
References: <20190912221115.23595-1-oleg@kaa.org.ua>
 <20190912221115.23595-2-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <7af9f38e-bf5e-97fc-fd49-87fd8b8c98a6@ti.com>
Date: Fri, 13 Sep 2019 08:40:28 -0500
MIME-Version: 1.0
In-Reply-To: <20190912221115.23595-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

Oleh

On 9/12/19 5:11 PM, Oleh Kravchenko wrote:
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
> index 000000000000..d74b492d28b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
> @@ -0,0 +1,53 @@
> +Crane Merchandising System - el15203000 LED driver
> +--------------------------------------------------
> +
> +This LED Board (aka RED LEDs board) is widely used in
> +coffee vending machines produced by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible : "crane,el15203000"
> +
> +Property rules described in
> +Documentation/devicetree/bindings/spi/spi-controller.yaml is apply.

Not sure what this statement means


> +In particular, "reg" and "spi-max-frequency" properties must be given.
> +50KHz is very well tested value for spi-max-frequency.
> +
> +Optional LED sub-node properties:
> +- function:
> +	see Documentation/devicetree/bindings/leds/common.txt

This was not fixed per v7 comments

Where is the "reg" property definition for the LED child node?

What is the 0x50,0x53 and 0x56 mean? Are there any other values?

Dan

<snip>
