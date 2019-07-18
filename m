From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: backlight: Add led-backlight binding
Date: Thu, 18 Jul 2019 14:30:00 +0200
Message-ID: <16865fe5-cc9c-e6f5-6950-54cc70153243@gmail.com>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-4-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717141514.21171-4-jjhiblot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Cc devicetree@vger.kernel.org list - Rob once informed us this gets
higher priority in his queue this way.

On 7/17/19 4:15 PM, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..4c7dfbe7f67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of LEDs.
> +It can also be used to describe a backlight device controlled by the output of
> +a LED driver.
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs
> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. The levels must be
> +                       in the range accepted by the underlying LED devices.
> +                       This is used to translate a backlight brightness level
> +                       into a LED brightness level. If it is not provided, the
> +                       identity mapping is used.
> +
> +  - default-brightness-level: The default brightness level.
> +
> +Example:
> +
> +	backlight {
> +		compatible = "led-backlight";
> +
> +		leds = <&led1>, <&led2>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +	};
> 

-- 
Best regards,
Jacek Anaszewski
