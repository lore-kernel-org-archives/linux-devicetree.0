From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Devicetree node to turn off LCD when backlight is 'disabled'
Date: Tue, 12 Feb 2013 16:35:56 +0900
Message-ID: <5119F0DC.1010109@nvidia.com>
References: <1360563905.4130.6.camel@gitbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360563905.4130.6.camel@gitbox>
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
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: Devicetree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Arm Kernel Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/11/2013 03:25 PM, Tony Prisk wrote:
> I was just wondering if the following would be an acceptable way to turn
> off an lcd backlight when the pwm-backlight driver is set to level 0.
> The LCD backlight is 'powered' by the gpio.
>
> leds {
> 	compatible = "gpio-leds";
> 	backlight {
> 		label = "lcd-power";
> 		gpios = <&gpio 0 0 0>;  /* bank pin active_low */
> 		linux,default-trigger = "backlight";
> 		default-state = "on";
> 	};
> };

This would work... for the most common case of a FB blank event (as 
gpio-leds will be notified of it and switch your GPIO on/off according 
to the kind of event). There are a few drawbacks however:

1) You will have no control over the order of your power sequence. 
pwm-backlight also uses FB notifications to switch the PWM on/off. Which 
one will happen first will depend on the registration order.

2) This will only work on FB blank events. For instance, if someone 
writes "0" into the "brightness" property of your backlight's sysfs 
node, no FB blank event will be emitted and your GPIO will remain on.

Also this solution works for the simple case where you control the 
backlight using only a GPIO. It would be good to support more complex 
cases as well (I have to handle a GPIO and a regulator, for instance).

The "correct" way of doing this would be to let the pwm-backlight driver 
(or even the backlight framework) control the power status of the 
backlight itself. You can do this using the platform callbacks of 
pwm-backlight, but this will require a custom panel. Another possibility 
would be to use the power sequence framework within the backlight 
drivers, but I need to rewrite it first.

So as an ad-hoc solution, what you propose would certainly work - 
however I think this is a good opportunity to try and solve this problem 
more globally. Maybe we can start discussing about Power Sequences 2.0. :)

Alex.
