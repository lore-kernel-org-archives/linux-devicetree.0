From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM: dts: imx7d-sdb: Add GPIO expander node
Date: Fri, 14 Apr 2017 08:25:48 -0700
Message-ID: <CAHQ1cqHat=25=esVnBJCaFdXJqUCtvghD5UjnRNG0taaZF_Dag@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-7-andrew.smirnov@gmail.com> <CAOMZO5A9u9bjbFa=0LQ_gnwFry4wm2HGD8xncThb3ta1TaZ1aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5A9u9bjbFa=0LQ_gnwFry4wm2HGD8xncThb3ta1TaZ1aw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 3:20 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Andrey,
>
> On Thu, Apr 13, 2017 at 10:32 AM, Andrey Smirnov
> <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
>> index 5be01a1..e0ff276 100644
>> --- a/arch/arm/boot/dts/imx7d-sdb.dts
>> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
>> @@ -52,6 +52,30 @@
>>                 reg = <0x80000000 0x80000000>;
>>         };
>>
>> +       spi4 {
>
> Here you use spi4 label...
>
>> +               compatible = "spi-gpio";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_spi1>;
>
> and here spi1, which is a bit confusing.
>

Agreed. It is confusing, will fix in v2.

>> +               status = "okay";
>> +               gpio-sck = <&gpio1 13 0>;
>> +               gpio-mosi = <&gpio1 9 0>;
>> +               cs-gpios = <&gpio1 12 0>;
>
> You could use GPIO_ACTIVE_HIGH flag for better readability.

Missed that, will fix in v2.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
