From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: add LP3943 MFD driver
Date: Sat, 20 Jul 2013 22:14:39 +0200
Message-ID: <CACRpkdYF=ZDqqoU6Kq4cwgaufUjpQmX+dxUexqcvb=KiqDdBoQ@mail.gmail.com>
References: <A874F61F95741C4A9BA573A70FE3998F82E815C3@DQHE06.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <A874F61F95741C4A9BA573A70FE3998F82E815C3-Lk53dPbe7bqIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
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
To: "Kim, Milo" <Milo.Kim-l0cyMroinI0@public.gmane.org>
Cc: "linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 16, 2013 at 4:38 AM, Kim, Milo <Milo.Kim-l0cyMroinI0@public.gmane.org> wrote:

This needs to be reviewed by the devicetree people.
Please break out the bindings separately and include
devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on that review.

> +++ b/Documentation/devicetree/bindings/mfd/lp3943.txt
> @@ -0,0 +1,23 @@
> +Bindings for TI/National Semiconductor LP3943 Driver
> +
> +Required properties:
> +  - compatible: "ti,lp3943"
> +  - reg: 7bit I2C slave address. 0x60 ~ 0x67
> +
> +Optional properties:
> +  - ti,pwm0, ti,pwm1: Output channel definition for PWM port 0 and 1
> +                      0 = invalid, 1 = LED0, 2 = LED 1, ... 16 = LED15
> +
> +Datasheet
> +  http://www.ti.com/lit/ds/snvs256b/snvs256b.pdf
> +
> +Application note: How to use LP3943 as a GPIO expander and PWM generator
> +  http://www.ti.com/lit/an/snva287a/snva287a.pdf

Do we usually put these things into bindings?

> +Example:
> +
> +       lp3943@60 {
> +               compatible = "ti,lp3943";
> +               reg = <0x60>;
> +               pwm1 = /bits/ 8 <2>;    /* use LED1 output as PWM #1 */
> +       };

OK so there is a way to state which lines are used for PWM.

I think you should also specify which lines are used for GPIO,
and which lines are used for LEDs.

And I'd like the masks to be passed to each subdriver, so we
can avoid the scenario where one and the same line gets
used for GPIO, LED and PWM at the same time.

Yours,
Linus Walleij
