From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document the "power-supply"
 property
Date: Mon, 15 Jul 2019 13:52:58 -0500
Message-ID: <f0dcce32-2bc0-5106-9bd7-27df699bbf06@ti.com>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-2-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715155657.22976-2-jjhiblot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

JJ

On 7/15/19 10:56 AM, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. Describing it
> in the device-tree makes it possible for the LED core to enable/disable it
> when needed.
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..539e124b1457 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>   - panic-indicator : This property specifies that the LED should be used,
>   		    if at all possible, as a panic indicator.
>   
> +- power-supply : A voltage/current regulator used to to power the LED. When a
Is the phandle to a voltage/current regulator used to to power the LED
> +		 LED is turned off, the LED core disable its regulator. The
The regulator is only disabled if it is the only consumer and/or the 
number of users = 0.
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.
> +
>   - trigger-sources : List of devices which should be used as a source triggering
>   		    this LED activity. Some LEDs can be related to a specific
>   		    device and should somehow indicate its state. E.g. USB 2.0
> @@ -106,6 +111,7 @@ gpio-leds {
>   		label = "Status";
>   		linux,default-trigger = "heartbeat";
>   		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&led_regulator>;
>   	};
>   
>   	usb {


Reviewed-by: Dan Murphy <dmurphy@ti.com>
