From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: dts: rockchip: add dts for RK3288-Tinker board
Date: Mon, 6 Feb 2017 13:52:01 +0800
Message-ID: <CAJrj+DPVw9uZ9VS_mS4U9t8rSKxoQJSzbQK=DgtuVecOoX3u8A@mail.gmail.com>
References: <1486347287-31051-1-git-send-email-eddie.cai@rock-chips.com>
 <1486347287-31051-3-git-send-email-eddie.cai@rock-chips.com> <20170206025435.GA32506@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206025435.GA32506-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew

2017-02-06 10:54 GMT+08:00 Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>:
> Hi Eddie
>
>> +             button@0 {
>> +                     gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
>> +                     linux,code = <116>;
>
> It is a good idea to use include/dt-bindings/input/input.h
>
> and then you can replace <116> with < KEY_POWER > which is more
> readable.
Thanks, I will modify it in next version.
>
>> +                     label = "GPIO Key Power";
>> +                     linux,input-type = <1>;
>
> < EV_KEY >
>
>> +                     gpio-key,wakeup = <1>;
>
> This has been replace with wakeup-source.
Thanks, I will modify it in next version
>
>> +                     debounce-interval = <100>;
>> +             };
>> +     };
>
>   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
