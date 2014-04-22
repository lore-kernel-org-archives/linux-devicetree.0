From: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH RESEND] tty/serial: atmel_serial: Fix device tree documentation
Date: Tue, 22 Apr 2014 16:40:38 +0200
Message-ID: <CACQ1gAhjiwU6pwgiBS0=Ye4mXAnuU1FxZGcPS7Ah59iVYL=LAw@mail.gmail.com>
References: <1397835904-866-1-git-send-email-richard.genoud@gmail.com>
 <CACQ1gAhjrb+3Bka64QfbopvEeiU-ifm35eLYUrjwyR-3goW4QQ@mail.gmail.com> <20140422143710.GJ3461@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140422143710.GJ3461@piout.net>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2014-04-22 16:37 GMT+02:00 Alexandre Belloni
<alexandre.belloni@free-electrons.com>:
> Hi,
>
> On 22/04/2014 at 15:45:26 +0200, Richard Genoud wrote :
>> 2014-04-18 17:45 GMT+02:00 Richard Genoud <richard.genoud@gmail.com>:
>> > RTS pin is an active low pin.
>> > For now, this doesn't change anything as the ACTIVE_LOW (1) flag is not
>> > handled in atmel_serial, but it will be in 3.16.
>> >
>> > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> > ---
>> >  Documentation/devicetree/bindings/serial/atmel-usart.txt | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/serial/atmel-usart.txt b/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> > index 17c1042b2df8..0dd0a5493a54 100644
>> > --- a/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> > +++ b/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> > @@ -35,7 +35,7 @@ Example:
>> >                 clock-names = "usart";
>> >                 atmel,use-dma-rx;
>> >                 atmel,use-dma-tx;
>> > -               rts-gpios = <&pioD 15 0>;
>> > +               rts-gpios = <&pioD 15 1>;
>> >         };
>> >
>> >  - use DMA:
>>
>> Rob,
>> Does this has a chance to get to 3.15-rc3 or it's not worth it ?
>> If it's not programmed for the 3.15-rc cycle, please drop it : I've
>> got a patchset depending on it, and it will be in another tree.
>>
>
> I would say that kind of change should go through Nicolas' tree or
> gregkh tty tree as it is directly related to the driver.

Ok, I'll send it to greg, since my patchset is on the tty tree.

thanks !
