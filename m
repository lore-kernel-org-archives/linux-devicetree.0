From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v8 0/2] gpio: uniphier: UniPhier GPIO driver
Date: Mon, 23 Oct 2017 09:55:12 +0900
Message-ID: <CAK7LNAShGckx5Cd_ghrQM49hVGw1vUQVovjYUgqgLjOKXY1fiA@mail.gmail.com>
References: <1507808176-5223-1-git-send-email-yamada.masahiro@socionext.com> <CACRpkdbRtpsmkp5BZcCH4vOvqoeMT_1UGUkOEoJ+mYypgnKezA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbRtpsmkp5BZcCH4vOvqoeMT_1UGUkOEoJ+mYypgnKezA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

2017-10-16 17:24 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Oct 12, 2017 at 1:36 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> Changes in v8:
>>   - Move dt-binding header to binding commit
>>   - Add MAINTAINERS entry for the binding doc
>>   - Add a consumer example to the binding doc
>
> This v8 looks OK to me.
>
> The stuff is still hard to understand, but that is because the HW is
> very complex and strangely designed, not because of the driver
> author. I really think you did your best, thanks!
>
> I'll wait some days and see if the DT people have something to say
> before applying it, but I'm as happy as I can be I guess.
>

Still waiting for DT people?


As you know, it is almost deadline
of DT pull requests to arm-soc maintainers.

If the driver (and binding) is not applied,
I cannot add GPIO nodes to my DT,
i.e. I would have to wait for one more development cycle
to use GPIO.




-- 
Best Regards
Masahiro Yamada
