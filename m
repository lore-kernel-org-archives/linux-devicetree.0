From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v1 0/6] misc: add reboot mode driver
Date: Tue, 29 Dec 2015 15:55:50 +0800
Message-ID: <56823C86.5010008@rock-chips.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
 <20151222164742.GA8623@piout.net> <567A6A01.8080305@rock-chips.com>
 <3460735.DIRnhNBgbJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3460735.DIRnhNBgbJ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd:

On 2015=E5=B9=B412=E6=9C=8828=E6=97=A5 23:28, Arnd Bergmann wrote:
> On Wednesday 23 December 2015 17:31:45 Andy Yan wrote:
>>      I also have the idea to put is in drivers/power/reset,  But con=
sidering
>>      this driver have not bind anything about power, so I put it in
>> driver/misc
>>      at last. So I hope if some people can give more suggestions her=
e.
> I vote for drivers/power/reset as well. On some platforms, the two th=
ings
> are related, on others they are not, but it's good to have it all in =
one
> place I think.
     Okay, I will move to drivers/power/reset next version.
>>>>    drivers/soc/rockchip/Kconfig                       |  9 ++
>>>>    drivers/soc/rockchip/Makefile                      |  1 +
>>>>    drivers/soc/rockchip/reboot.c                     | 68 ++++++++=
+++++++
>>> And maybe that part could be made generic instead of rockchip speci=
fic.
>>> It simply uses a regmap to do the accesses, I guess a lot of other
>>> platforms will do that. We have syscon-reboot and syscon-poweroff f=
or example.
>>>
>>> I think then we can extend the "framework" by having generic driver=
s to
>>> store the value in eeprom or nvram for example.
>>>
>>      I also hope the write interface can be generic. But I found som=
e
>> platform
>>      use different hardware to store the value. For example, John's =
patch
>> use
>>      SRAM on qcom apq8064 to store value for nexus7. It seems there =
also have
>>      some platform use dram or nvram to store it. And these differen=
t
>> hardware use
>>      different write method. I don't have a generic way to handle th=
is.
>>
>>      I have a idea to handle it like this:
>>
>> +static const struct of_device_id reboot_mode_dt_match[] =3D {
>> +        { .compatible =3D "linux,reboot-mode-sfr",    /*for magic v=
alue
>> stored in special function register, which  can be accessed by regma=
p*/
>> +                .data =3D (void *)&reboot-mode-sfr },
> I'd make this one syscon-reboot-mode, to go along with syscon-powerof=
f
> as implemented by drivers/power/reset/syscon-poweroff.c. The syscon c=
oncept
> is already generic enough that we don't need a linux prefix for that.
     Okay, syscon is better.
>> +        { .compatible =3D "linux,reboot-mode-sram",  /*for magic va=
lue
>> stored in
>> +                .data =3D (void *)&reboot-mode-sram },
> the sram mode should probably follow the generic SRAM binding and mak=
e
> the location that stores the reboot mode a separate partition, unless
> we want to store other data in the same partition, in which case we m=
ight
> want to use the same implementation as for the nvram.
>
>> +        { .compatible =3D "linux,reboot-mode-sdram",
>> +                .data =3D (void *)&reboot-mode-sdram }, /*for magic=
 value
>> stored
> I think "sdram" is not an appropriate name here, as the main system m=
emory
> might use some other technology, e.g. DRAM or DDR2-SDRAM.
>
>> +        { .compatible =3D "rockchip,reboot-mode-nvram",
>> +                .data =3D (void *)&reboot-mode-nvram },
>> +        {},
>> +};
> nvram is a complex topic by itself, because there are so many ways to=
 do it.
> I think what you are referring to here is a battery-backed memory tha=
t uses
> one or more bytes at a fixed offset to store a particular piece of in=
formation,
> as the drivers/char/nvram.c driver does. Maybe we should put the rebo=
ot mode
> into that driver then?
>
> There are other nvram drivers at various places in the kernel, and ea=
ch may
> be slightly different, or completely different, like the EFIVARs driv=
er on
> UEFI firmware or the key/value store on Open Firmware, these probably=
 need
> their own methods and not share the generic driver.
>
>>      the data point to different hardware access method.
>>
>>     Hope to see more suggestions from you.
> It's probably best to leave these four examples as separate drivers a=
nd we can
> add further ones when needed.
>
> 	Arnd
>
>
     Okay, thanks for your suggestion.  I will add the reboot-mode.c as=
=20
the core library, syscon-reboot-mode.c as one example first. As for=20
sram/dram/nvram case, I am not familiar with them, so hope there are=20
some hero will extend them when needed.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
