From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] dt/bindings: Add binding for the Raspberry Pi
 firmware driver
Date: Thu, 14 May 2015 09:40:39 +0100
Message-ID: <20150514084039.GC22418@x1>
References: <1431543609-19646-1-git-send-email-eric@anholt.net>
 <1431543609-19646-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431543609-19646-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 May 2015, Eric Anholt wrote:

> This driver will provide support for calls into the firmware that will
> be used by other drivers like cpufreq and vc4.
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
> 
> v2: Improve commit message, point to mailbox.txt for how mboxes work.
> 
>  .../devicetree/bindings/arm/bcm/raspberrypi,firmware.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
> new file mode 100644
> index 0000000..33b0043
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
> @@ -0,0 +1,16 @@
> +Raspberry Pi VideoCore firmware driver
> +
> +Required properties:
> +
> +- compatible:		Should be "rasbperrypi,firmware"
> +- mboxes:		Single-entry list which specifies which mailbox
> +			  controller and channel is used.  See
> +			  Documentation/devicetree/bindings/mailbox/mailbox.txt
> +			  for the semantics of this property

That's not what it looks like to me.  There is no mention of channels
in a 0 cell property.  Keep it simple.  How about:

Phandle to the firmware device's Mailbox.
(See: ../mailbox/mailbox.txt for more information)

> +Example:
> +
> +firmware {
> +	compatible = "rasbperrypi,firmware";
> +	mboxes = <&mailbox>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
