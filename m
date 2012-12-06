From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] leds: leds-pwm: Add device tree bindings
Date: Thu, 06 Dec 2012 10:00:52 +0000
Message-ID: <20121206100052.EC8293E0E22@localhost>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com>
 <1352731270-27534-4-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352731270-27534-4-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Nov 2012 15:41:10 +0100, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> wrote:
> Support for device tree booted kernel.
> When the kernel is booted with DeviceTree blob we support one led per
> leds-pwm device to have cleaner integration with the PWM subsystem.
> 
> For usage see:
> Documentation/devicetree/bindings/leds/leds-pwm.txt
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/leds/leds-pwm.txt          |  34 ++++++
>  drivers/leds/leds-pwm.c                            | 125 +++++++++++++++------
>  2 files changed, 127 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> new file mode 100644
> index 0000000..9fe3040
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> @@ -0,0 +1,34 @@
> +LED connected to PWM
> +
> +Required properties:
> +- compatible : should be "pwm-leds".
> +- pwms : PWM property, please refer to: 
> +  Documentation/devicetree/bindings/pwm/pwm.txt
> +- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
> +- label : (optional) The label for this LED.  If omitted, the label is
> +  taken from the node name (excluding the unit address).
> +- max-brightness : Maximum brightness possible for the LED
> +- linux,default-trigger :  (optional) This parameter, if present, is a
> +  string defining the trigger assigned to the LED.  Current triggers are:
> +    "backlight" - LED will act as a back-light, controlled by the framebuffer
> +		  system
> +    "default-on" - LED will turn on, but see "default-state" below
> +    "heartbeat" - LED "double" flashes at a load average based rate
> +    "ide-disk" - LED indicates disk activity
> +    "timer" - LED flashes at a fixed, configurable rate

The binding mostly looks good. However, it seems to be gratuitously
different from the gpio-leds binding and it duplicates property
definitions. Please match the gpio-leds behaviour with each led defined
as a sub node of the pwm-leds node.

Also, please reference the common properties in bindings/leds/common.txt
(This is a new file in linux-next. See how leds-gpio references it).

Otherwise the binding looks okay to me.
