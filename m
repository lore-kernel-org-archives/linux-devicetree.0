From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFC 2/4] ARM: bcm2835: rename sdhci pin group
Date: Thu, 10 Dec 2015 22:19:16 -0700
Message-ID: <566A5CD4.7080704@wwwdotorg.org>
References: <1447949176-21926-1-git-send-email-stefan.wahren@i2se.com>
 <1447949176-21926-3-git-send-email-stefan.wahren@i2se.com>
 <565E6892.4070600@wwwdotorg.org>
 <705524977.33360.5a38c754-5911-4377-aa1a-501587b3a337.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <705524977.33360.5a38c754-5911-4377-aa1a-501587b3a337.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/05/2015 02:43 AM, Stefan Wahren wrote:
> 
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> hat am 2. Dezember 2015 um 04:42
>> geschrieben:
>>
>>
>> On 11/19/2015 09:06 AM, Stefan Wahren wrote:
>>> The node name of the sdhci pin group doesn't explain it's
>>> real function. So rename it.
>>
>> The real function of this node is not to configure SDHCI pins, but to
>> set pins to alt3, as the current name states. Admittedly it's possible
>> that currently the only pins that need to be set to ALT3 are SDHCI
>> related, but that's incidental.
> 
> Yes, i understand the original intension to assign every pin to the available
> mux functions ( gpio_in, gpio_out, alt* ).
> 
> But 3f37169fb3 ("ARM: bcm2835: dt: Add Raspberry Pi Model B rev2") introduce a

FYI I don't have that yet and git fetch is being very slow right now:-(

> better self-describing pin group naming for I2S. So my idea was to adapt it
> according to sdhci first and go on.

OK. I'd suggest explaining that directly in the commit description then.
The commit description above has a quite different semantic meaning.

> So here is a possible vision for bcm2835-rpi.dtsi
> 
> &gpio {
> 	pinctrl-names = "default";
> 
> 	act_gpio: gpio {
> 		brcm,pins = <6>;
> 		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
> 	};
> 
> 	i2c0_alt0: i2c {
> 		brcm,pins = <0 1>;
> 		brcm,function = <BCM2835_FSEL_ALT0>;
> 	};
> 
> 	i2c1_alt0: i2c {
> 		brcm,pins = <2 3>;
> 		brcm,function = <BCM2835_FSEL_ALT0>;
> 	};
...

OK, I guess that can work; I imagine it would make DT overlays easier by
making the pinctrl setup more fine-grained.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
