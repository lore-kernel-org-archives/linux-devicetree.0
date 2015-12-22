From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5] extcon: add Maxim MAX3355 driver
Date: Tue, 22 Dec 2015 10:13:34 +0900
Message-ID: <5678A3BE.3040701@samsung.com>
References: <5948633.my3nAG6hRz@wasted.cogentembedded.com>
 <CAGTfZH34rfMfjsAFgyPeNue74-5iCi6ZwrdN26_jwOXE6R=hwg@mail.gmail.com>
 <5676E214.2040009@cogentembedded.com> <5677662C.6060409@samsung.com>
 <5677DC21.3040509@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5677DC21.3040509@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 12=EC=9B=94 21=EC=9D=BC 20:01, Sergei Shtylyov wrote:
> Hello.
>=20
> On 12/21/2015 5:38 AM, Chanwoo Choi wrote:
>=20
>>>> This patch depend on GPIOLIB configuration as following:
>>>> I modified it with following diff and applied it.
>>>>
>>>> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
>>>> index ba4db7d..3d89e60 100644
>>>> --- a/drivers/extcon/Kconfig
>>>> +++ b/drivers/extcon/Kconfig
>>>> @@ -54,6 +54,7 @@ config EXTCON_MAX14577
>>>>
>>>>    config EXTCON_MAX3355
>>>>           tristate "Maxim MAX3355 USB OTG EXTCON Support"
>>>> +       depends on GPIOLIB || COMPILE_TEST
>>>
>>>     If it won't compile w/o gpiolib, what's the use of COMIPLE_TEST=
?
>>>     And no, it shouldn't depend on gpiolib. It has empty stubs for =
the case of CONFIG_GPIOLIB=3Dn. Obviously something is wrong with the G=
PIO headers, I'll look into it.
>>
>> Yes. When GPIOLIB is disabled, the build issue don't happen.
>=20
>    What? It surely does happen!

hmm....
Sure. you need to check the include/linux/gpio/consumer.h.

Because of build error happen, you miss to include the "linux/gpio/cons=
umer.h"
header file in extcon-max3355.c. Please test it for enough time.

>=20
>> because include/linux/gpio/consumer.h implement the dummy function
>> for all gpio functions if CONFIG_GPIOLIB is disabled.
>=20
>    Linus W. advised to #include this header explicitly -- I'll try an=
d post.

Don't necessary. I already updated it including the "include/linux/gpio=
/consumer.h".

>=20
>> For correct operation of max3355, you should add the dependency
>> to the extcon-max3355.c driver. This driver use the GPIO library
>> certainly.
>=20
>    I disagree. The driver will just cease to load in this case. I don=
't see why we need such dependency. Only compilation time dependencies =
should be
> specified, I think.

This driver have to depend on GPIOLIB.
Why are you disagreeing the COMPILE_TEST dependency? It is just compile=
 test
without anything.=20
