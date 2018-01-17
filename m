From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Wed, 17 Jan 2018 10:39:06 +0100
Message-ID: <CACRpkdZTrRUB+AVt6Ccpd_F1SQAX5fnk5c6xB9sisfO18DUZ_Q@mail.gmail.com>
References: <cover.1516105893.git.baruch@tkos.co.il> <8ba2147dc08bb50a65b49ca2142f7710e1635d20.1516105893.git.baruch@tkos.co.il>
 <6c07ab6a-a2c6-284e-6205-58d2512d0256@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6c07ab6a-a2c6-284e-6205-58d2512d0256-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 9:30 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:

> Hi Linus,
> hi Eric,
>
>
> Am 16.01.2018 um 13:45 schrieb Baruch Siach:
>>
>> Add a description of the RPi3 GPIO expander that the VC4 firmware
>> controls.
>>
>> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
>> ---
>> v3:
>>    * List GPIO names one per line.
>>
>> v2:
>>    * Move GPIO expander node out of the soc container
>>    * Rename compatible string
>>    * Add gpio-line-names property
>> ---
>>   arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> index b44b3b5af00d..8cd93425ffe3 100644
>> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> @@ -23,6 +23,22 @@
>>                         gpios = <&gpio 47 0>;
>>                 };
>>         };
>
>
> i noticed that this patch conflicts with my patch ("ARM: dts: bcm283x: Use
> GPIO polarity defines consistently") in linux-next.
>
> How should we proceed?

All DTS patches shall be merged through ARM SoC so the conflict should
be resolved by whoever sends the pull requests to ARM SoC before
sending the pull request.

I think these patches will be for the next kernel anyways, unless Torvalds
think we should have an -rc9 this time (because of all the meltdowns and
spectres etc you know).

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
