From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 19/20] powerpc/83xx: Add generic compatible string for
 I2C EEPROM
Date: Tue, 23 May 2017 15:49:51 +0200
Message-ID: <CABxcv=nARWUrqSM=vsyrkPygKabcDGP4nTGdQFEEoBWaVLR5dg@mail.gmail.com>
References: <20170522140208.24652-1-javier@dowhile0.org> <20170522140208.24652-20-javier@dowhile0.org>
 <CAL_JsqLGC9sh9jhwtCHu1NE2z85cZh0CVXuMc9aohzCoxE_4fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLGC9sh9jhwtCHu1NE2z85cZh0CVXuMc9aohzCoxE_4fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On Tue, May 23, 2017 at 3:42 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, May 22, 2017 at 9:02 AM, Javier Martinez Canillas
> <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:
>> The at24 driver allows to register I2C EEPROM chips using different vendor
>> and devices, but the I2C subsystem does not take the vendor into account
>> when matching using the I2C table since it only has device entries.
>>
>> But when matching using an OF table, both the vendor and device has to be
>> taken into account so the driver defines only a set of compatible strings
>> using the "atmel" vendor as a generic fallback for compatible I2C devices.
>>
>> So add this generic fallback to the device node compatible string to make
>> the device to match the driver using the OF device ID table.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
>>
>> ---
>>
>> Changes in v4:
>> - Only use the atmel manufacturer in the compatible string instead of
>>   keeping the deprecated ones (Rob Herring).
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  arch/powerpc/boot/dts/mpc8308_p1m.dts  | 2 +-
>>  arch/powerpc/boot/dts/mpc8349emitx.dts | 4 ++--
>>  arch/powerpc/boot/dts/mpc8377_rdb.dts  | 2 +-
>>  arch/powerpc/boot/dts/mpc8377_wlan.dts | 2 +-
>>  arch/powerpc/boot/dts/mpc8378_rdb.dts  | 2 +-
>>  arch/powerpc/boot/dts/mpc8379_rdb.dts  | 2 +-
>>  6 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/dts/mpc8308_p1m.dts b/arch/powerpc/boot/dts/mpc8308_p1m.dts
>> index 57f86cdf9f36..702ab4fc5b4a 100644
>> --- a/arch/powerpc/boot/dts/mpc8308_p1m.dts
>> +++ b/arch/powerpc/boot/dts/mpc8308_p1m.dts
>> @@ -123,7 +123,7 @@
>>                         interrupt-parent = <&ipic>;
>>                         dfsrr;
>>                         fram@50 {
>> -                               compatible = "ramtron,24c64";
>> +                               compatible = "atmel,24c64";
>
> This should be '"ramtron,24c64", "atmel,24c64"'
>

Yes, I (hopefully) fixed all the occurrences in the v5 that I posted
today, you are cc'ed on that series too.

Again, sorry for misunderstanding your comment on v3.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
