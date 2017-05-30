From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-cm-fx6: add sdio wifi/bt nodes
Date: Tue, 30 May 2017 23:23:14 +0200
Message-ID: <6832964fb0644ed7a89391dc4423865f@rwthex-s1-b.rwth-ad.de>
References: <1a13681b84564bc18937eb54b8345957@rwthex-s1-b.rwth-ad.de>
 <8c7aee6cf7184c1cb914c1eef530e2de@rwthex-w1-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c7aee6cf7184c1cb914c1eef530e2de-cBaz+nnMw1/Ca9uivkkr415UTUQ924AY@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

thanks for the fast reply.

On 05/30/2017 10:40 PM, Fabio Estevam wrote:
> Hi Christopher,
> 
> On Tue, May 30, 2017 at 5:16 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> +       awnh387_pwrseq: pwrseq {
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_pwrseq>;
>> +               compatible = "mmc-pwrseq-sd8787";
>> +               powerdown-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
>> +               reset-gpios = <&gpio6 16 GPIO_ACTIVE_HIGH>;
> 
> At least in the AW-NH387 datasheet I found it says:
> 
> RESETn: Reset(active low at least 10ns)

The BSP device tree uses an active-low regulator called nreset, too, but 
strangly it has a startup delay of 10ms while the powerdown-regulator 
"starts up" immediately.

(btw: the "regulator setup" is not able to handle resets correctly.)

It seems to me that the pwrseq-sd8787 uses inverted logic: it first sets 
the -- in our case -- active-high gpio to high, waits, and then enables 
the powerdown-gpio.

This coincides with the gpio being called "reset" in the pwrseq binding, 
neither "nreset" nor "RESETn" (beware the missing *n*ot).

> Please double check the polarity in device tree.
> 

I just double checked: high/high for powerdown/reset gpios is the only 
of the four possible combinations that works.

So, all in all, I think the polarity is correct (or either the pwrseq 
driver or hardware invertes the polarity for some reason).

Cheers,
Christopher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
