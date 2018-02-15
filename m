From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Thu, 15 Feb 2018 10:59:27 +0100
Message-ID: <e28ab40d-85c1-8821-1482-09f59740b559@gmail.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUuuokCjJ-uz1+JMFLF5zytiB6gjhVC1Xtys_rWdFnPhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUuuokCjJ-uz1+JMFLF5zytiB6gjhVC1Xtys_rWdFnPhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/14/2018 10:11 AM, Geert Uytterhoeven wrote:
> Hi Marek,

[...]

>> +                       partition@0 {
>> +                               label = "loader";
>> +                               reg = <0x00000000 0x00040000>;
>> +                               read-only;
>> +                       };
>> +                       partition@40000 {
>> +                               label = "user";
>> +                               reg = <0x00040000 0x00400000>;
>> +                               read-only;
>> +                       };
>> +                       partition@440000 {
>> +                               label = "flash";
>> +                               reg = <0x00440000 0x03bc0000>;
>> +                       };
> 
> I can't verify the partition layout.

I adjusted it according to
https://elinux.org/R-Car/Boards/Stout

>> +               };
>> +       };
>> +};
> 
> 
>> +&iic2  {
>> +       status = "okay";
>> +       pinctrl-0 = <&iic2_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       clock-frequency = <100000>;
>> +
>> +       hdmi@39 {
>> +               compatible = "adi,adv7511w";
>> +               reg = <0x39>;
>> +               interrupt-parent = <&gpio1>;
>> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> 
> Missing cec clock (OSC4).
Fixed

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
