From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: gpio-pxa: getting GPIOs by devicetree phandle broken
Date: Mon, 09 Feb 2015 18:38:39 +0100
Message-ID: <87mw4n6l40.fsf@free.fr>
References: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
	<CAAVeFu+yf6Wf6MspiDLiWwQkMwMvimNa0SpMK_yO_9X07UecEw@mail.gmail.com>
	<4B6D6D87A8FB62428BE0A3E38461A1AB18D6B200@irsmsx105.ger.corp.intel.com>
	<CAOjnSCZgx5H75t8QrXj1WQ_SaU_4HDYeK+_XdBRmwUXzHW=iJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOjnSCZgx5H75t8QrXj1WQ_SaU_4HDYeK+_XdBRmwUXzHW=iJw@mail.gmail.com>
	(Tyler Hall's message of "Mon, 9 Feb 2015 09:41:17 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: "Holmberg, Hans" <hans.holmberg@intel.com>, Tyler Hall <tylerwhall@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Mack <zonque@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>
List-Id: devicetree@vger.kernel.org

Tyler Hall <tylerwhall@gmail.com> writes:

>> The issue with multiple gpiochips per of-node could be worked around as followed I believe, comments?
>>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index 08261f2..43984ab 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -47,11 +47,12 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
>>         ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
>>         if (ret < 0) {
>>                 /* We've found the gpio chip, but the translation failed.
>> -                * Return true to stop looking and return the translation
>> -                * error via out_gpio
>> +                * Store translation error in out_gpio.
>> +                * Return false to keep looking, as more than one GPIO chip
>> +                * could be registered per of-node.
>>                  */
>>                 gg_data->out_gpio = ERR_PTR(ret);
>> -               return true;
>> +               return false;
>>          }
>>
>>         gg_data->out_gpio = gpiochip_get_desc(gc, ret);
>
> As long as we're ok with multiple gpiochips per of-node, this would
> work for me. It'll change the preference of which chip returns the
> error in the case of multiple chips, but that's already undefined
> behavior.

Looks good to me too, this will solve my issue, and the global behavior would be
consistent with the former one.

Would you care submitting a proper patch so that we can apply our Reviewed-by,
Tested-by etc ... ?

Cheers.

-- 
Robert
