From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
Date: Wed, 24 Jul 2019 10:47:57 -0600
Message-ID: <20190724164757.GA3723@bogus>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708103547.23528-3-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. describing in
> the device-tree makes it possible for the LED core to enable/disable it
> when needed.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..e093a2b7eb90 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- power-supply : A voltage/current regulator used to to power the LED. When a
> +		 LED is turned off, the LED core disable its regulator. The
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.

Not sure this should be common. It wouldn't apply to cases where we have 
an LED controller parent nor gpio and pwm LEDs and those are most cases.

Perhaps what makes sense here is an regulator-led binding.

> +
>  - trigger-sources : List of devices which should be used as a source triggering
>  		    this LED activity. Some LEDs can be related to a specific
>  		    device and should somehow indicate its state. E.g. USB 2.0
> -- 
> 2.17.1
> 
