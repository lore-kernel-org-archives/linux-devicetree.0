From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: aspeed-romulus: Add I2C devices
Date: Wed, 4 Oct 2017 14:54:57 +0930
Message-ID: <CACPK8Xf8tEvdaCr2vyUfPRw5oxN_A4PCaCKzWBXJC_CGOmz=Bw@mail.gmail.com>
References: <20170928075149.8154-1-joel@jms.id.au> <20170928075149.8154-5-joel@jms.id.au>
 <1507093339.5452.13.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507093339.5452.13.camel-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 2:32 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
>> Enable the buses that are in use and the devices that are attached.
>> Currently that is just the battery backed RTC.
>>
>> Some of these buses are for hotplugged cards, such as PCIe cards. Others
>> do not yet have upstream drivers, so there are no devices attached.
>>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 54 ++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index 1190fec1b5d0..f79c1d21c47f 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -79,3 +79,57 @@
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&pinctrl_rmii1_default>;
>>  };
>> +
>> +&i2c2 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c3 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c5 {
>> +     status = "okay";
>> +};
>> +
>> +&i2c6 {
>> +     /* PCIe slot 1 (x8) */
>> +     status = "enabled";
>
> This is not okay. Neither are those below.

Hah. Well spotted.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
