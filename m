From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: shmobile: lager: enable HS-USB
Date: Tue, 7 Oct 2014 16:03:25 +0900
Message-ID: <5433903D.5050108@renesas.com>
References: <1412237073-1288-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1412237073-1288-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <542EFDEA.2030906@cogentembedded.com> <5431E984.6000203@renesas.com> <54335D0E.6070606@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54335D0E.6070606-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org" <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

(2014/10/07 12:25), Yoshihiro Shimoda wrote:
> Hello.
> 
> (2014/10/06 9:59), Yoshihiro Shimoda wrote:
>> Hello.
>>
>> (2014/10/04 4:50), Sergei Shtylyov wrote:
>>> On 10/02/2014 12:04 PM, Yoshihiro Shimoda wrote:
>>>
< snip >
>>>> +&hsusb {
>>>> +	status = "okay";
>>>> +	renesas,enable-gpio = <&gpio5 18 GPIO_ACTIVE_LOW>;
>>>
>>>     It's certainly active-high.
>>
>> Since the current code has the following, we have to set the active_low...
>> However, the code is unreadable, I think. So, I will modify the code.
>>
>> 	/* check GPIO determining if USB function should be enabled */
>> 	if (priv->dparam.enable_gpio) {
>> 		gpio_request_one(priv->dparam.enable_gpio, GPIOF_IN, NULL);
>> 		ret = !gpio_get_value(priv->dparam.enable_gpio);
>> 		gpio_free(priv->dparam.enable_gpio);
>> 		if (ret) {
>> 			dev_warn(&pdev->dev,
>> 				 "USB function not selected (GPIO %d)\n",
>> 				 priv->dparam.enable_gpio);
>> 			ret = -ENOTSUPP;
>> 			goto probe_end_mod_exit;
>> 		}
>> 	}
> 
> I am confusing about the gpio_get_value()...
> In case of ARM, gpio_get_value() will call gpiod_get_raw_value() finally.
> 
> gpio_get_value() in arch/arm/include/asm/gpio.h
>  --> __gpio_get_value() in include/asm-generic/gpio.h
>   --> gpiod_get_raw_value() in drivers/gpio/gpiolib.c
> 
> The gpiod_get_raw_value() doesn't care of the GPIO_ACTIVE_{HIGH,LOW}.
> So, should I add gpiod_is_active_low() or someting in the renesas_usbhs driver?
> Or, Do I misunderstand something?

I looked at the gpio-keys driver, and then I understand the renesas_usbhs driver should
have the gpio flags from of_get_named_gpio_flags().

So, I will try to modify the renesas_usbhs driver.

Best regards,
Yoshihiro Shimoda

> Best regards,
> Yoshihiro Shimoda
> 
>> Best regards,
>> Yoshihiro Shimoda
>>
>>> WBR, Sergei
>>>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
