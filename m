From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 RESEND 2/4] dt-bindings: Add root properties for
 Raspberry Pi
Date: Wed, 25 Feb 2015 14:20:52 +0000
Message-ID: <20150225142052.GL21323@x1>
References: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
 <1422555050-28509-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422555050-28509-3-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Jan 2015, Stefan Wahren wrote:

> This patch adds root compatible properties for the following boards:
> - Raspberry Pi Model A
> - Raspberry Pi Model A+
> - Raspberry Pi Model B
> - Raspberry Pi Model B (no P5)
> - Raspberry Pi Model B rev2
> - Raspberry Pi Model B+
> - Raspberry Pi Compute Module
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/bcm2835.txt |   31 +++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Applied, with Rob's Ack.

> diff --git a/Documentation/devicetree/bindings/arm/bcm2835.txt b/Documentation/devicetree/bindings/arm/bcm2835.txt
> index ac68348..c78576b 100644
> --- a/Documentation/devicetree/bindings/arm/bcm2835.txt
> +++ b/Documentation/devicetree/bindings/arm/bcm2835.txt
> @@ -1,8 +1,35 @@
>  Broadcom BCM2835 device tree bindings
>  -------------------------------------------
>  
> -Boards with the BCM2835 SoC shall have the following properties:
> +Raspberry Pi Model A
> +Required root node properties:
> +compatible = "raspberrypi,model-a", "brcm,bcm2835";
>  
> -Required root node property:
> +Raspberry Pi Model A+
> +Required root node properties:
> +compatible = "raspberrypi,model-a-plus", "brcm,bcm2835";
>  
> +Raspberry Pi Model B
> +Required root node properties:
> +compatible = "raspberrypi,model-b", "brcm,bcm2835";
> +
> +Raspberry Pi Model B (no P5)
> +early model B with I2C0 rather than I2C1 routed to the expansion header
> +Required root node properties:
> +compatible = "raspberrypi,model-b-i2c0", "brcm,bcm2835";
> +
> +Raspberry Pi Model B rev2
> +Required root node properties:
> +compatible = "raspberrypi,model-b-rev2", "brcm,bcm2835";
> +
> +Raspberry Pi Model B+
> +Required root node properties:
> +compatible = "raspberrypi,model-b-plus", "brcm,bcm2835";
> +
> +Raspberry Pi Compute Module
> +Required root node properties:
> +compatible = "raspberrypi,compute-module", "brcm,bcm2835";
> +
> +Generic BCM2835 board
> +Required root node properties:
>  compatible = "brcm,bcm2835";
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
