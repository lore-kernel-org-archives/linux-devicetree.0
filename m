From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 2/3] devicetree: Add new ANX7814 SlimPort transmitter
 binding.
Date: Tue, 8 Sep 2015 19:40:41 -0500
Message-ID: <55EF8009.6070009@kernel.org>
References: <1441697120-3876-1-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1441697120-3876-1-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Enric Balletbo i Serra <eballetbo@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, robh+dt@kernel.org, span@analogixsemi.com, galak@codeaurora.org, javier@dowhile0.org, nathan.chung@mediatek.com
List-Id: devicetree@vger.kernel.org

On 09/08/2015 02:25 AM, Enric Balletbo i Serra wrote:
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices.
> 
> You can add support to your board with current binding.
> 
> Example:
> 
> 	anx7814: anx7814@38 {
> 		compatible = "analogix,anx7814";
> 		reg = <0x38>;
> 		pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> 		reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> 	};
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../devicetree/bindings/video/anx7814.txt          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/anx7814.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/anx7814.txt b/Documentation/devicetree/bindings/video/anx7814.txt
> new file mode 100644
> index 0000000..a8cc746
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/anx7814.txt
> @@ -0,0 +1,22 @@
> +Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +-----------------------------------------------
> +
> +The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> +designed for portable devices.
> +
> +Required properties:
> +
> + - compatible	: "analogix,anx7814"
> + - reg		: I2C address of the device
> + - pd-gpios	: Which GPIO to use for power down
> + - reset-gpios	: Which GPIO to use for reset
> +
> +Example:
> +
> +	anx7814: anx7814@38 {
> +		compatible = "analogix,anx7814";
> +		reg = <0x38>;
> +		pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;

No ports needed for describing data connections?

Rob

> +	};
> +
> 
