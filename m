From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5] extcon: add Maxim MAX3355 driver
Date: Mon, 21 Dec 2015 11:38:36 +0900
Message-ID: <5677662C.6060409@samsung.com>
References: <5948633.my3nAG6hRz@wasted.cogentembedded.com>
 <CAGTfZH34rfMfjsAFgyPeNue74-5iCi6ZwrdN26_jwOXE6R=hwg@mail.gmail.com>
 <5676E214.2040009@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-reply-to: <5676E214.2040009@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2015=EB=85=84 12=EC=9B=94 21=EC=9D=BC 02:15, Sergei Shtylyov wrote:
> Hello.
>=20
> On 12/20/2015 05:31 PM, Chanwoo Choi wrote:
>=20
>> This patch depend on GPIOLIB configuration as following:
>> I modified it with following diff and applied it.
>>
>> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
>> index ba4db7d..3d89e60 100644
>> --- a/drivers/extcon/Kconfig
>> +++ b/drivers/extcon/Kconfig
>> @@ -54,6 +54,7 @@ config EXTCON_MAX14577
>>
>>   config EXTCON_MAX3355
>>          tristate "Maxim MAX3355 USB OTG EXTCON Support"
>> +       depends on GPIOLIB || COMPILE_TEST
>=20
>    If it won't compile w/o gpiolib, what's the use of COMIPLE_TEST?
>    And no, it shouldn't depend on gpiolib. It has empty stubs for the=
 case of CONFIG_GPIOLIB=3Dn. Obviously something is wrong with the GPIO=
 headers, I'll look into it.

Yes. When GPIOLIB is disabled, the build issue don't happen.
because include/linux/gpio/consumer.h implement the dummy function
for all gpio functions if CONFIG_GPIOLIB is disabled.

=46or correct operation of max3355, you should add the dependency=20
to the extcon-max3355.c driver. This driver use the GPIO library
certainly.

COMPILE_TEST is used for just build test. You can see the detailed data=
[1].
[1] https://lkml.org/lkml/2013/5/22/155

Thanks,
Chanwoo Choi
