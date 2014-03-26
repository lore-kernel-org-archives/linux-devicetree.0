From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: add gpio pieces
Date: Wed, 26 Mar 2014 10:29:34 -0500
Message-ID: <5332F25E.10104@gmail.com>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>	<1395345324-18299-4-git-send-email-bigeasy@linutronix.de>	<CANk1AXRa4V1ADNaT+T3pYF4zyxni9Y8rmU9UYRoA_7NxW8KWEg@mail.gmail.com> <CANk1AXSQVFZvRmvYt+JF+TDVpfX-_RLiUcQXotGzpHoTMUVymQ@mail.gmail.com> <532D73D1.7020408@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <532D73D1.7020408@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, delicious quinoa <delicious.quinoa@gmail.com>
Cc: Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 03/22/2014 06:28 AM, Sebastian Andrzej Siewior wrote:
> On 03/21/2014 11:15 PM, delicious quinoa wrote:
>> snps,nr-gpios = <27>;
>>
>> As noted on other thread, gpio2 is 27 wide, despite what the
>> documentation says.  When I made that change and remove your other two
>> patches the gpios worked for me on a cyclone5 devkit board.
>>
>> So if you fix the "#gpio-cells = <2>;" for all 3 gpios and fix
>> "snps,nr-gpios = <27>;" for gpio2, then this one patch looks good to
>> me.  With these changes,
>
> Okay will do. And I also add a note that  the reference manual is wrong
> here.
>

I've applied this patch to rocketboards/linux-socfpga-next/next-dt. I 
will take through the arm-soc tree for 3.16.

Dinh
>>
>> Acked-by: Alan Tull <atull@altera.com>
>>
>> Alan Tull
>> aka
>> delicous quinoa
>
> Sebastian
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
