From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 11:30:12 -0600
Message-ID: <CAL_JsqLENvqsG+vjK740Aw4yKYONwHB1b-B7mKvE_iAZ1JSdNw@mail.gmail.com>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
 <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
 <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com>
 <54E61DD2.3060002@gmail.com> <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
 <54E742F2.80506@hurleysoftware.com> <20150220143533.GA29908@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150220143533.GA29908@odux.rfo.atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 8:35 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:
> On Fri, Feb 20, 2015 at 09:21:38AM -0500, Peter Hurley wrote:
>> On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
>> >
>> >> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list@gmail.com>=
 wrote:
>> >>
>> >> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>> >>> Hi Frank,

[...]

>> >>> This is one of those things that the kernel community doesn=E2=80=
=99t understand which makes people
>> >>> who push product quite mad.
>> >>>
>> >>> Engineering a product is not only about meeting customer spec, i=
n order to turn a profit
>> >>> the whole endeavor must be engineered as well for manufacturabil=
ity.
>> >>>
>> >>> Yes, you can always manually install files in the bootloader. Fo=
r 1 board no problem.
>> >>> For 10 doable. For 100 I guess you can hire an extra guy. For 1 =
million? Guess what,
>> >>> instead of turning a profit you=E2=80=99re losing money if you o=
nly have a few cents of profit
>> >>> per unit.
>> >>
>> >> I'm not installing physical components manually.  Why would I be =
installing software
>> >> manually?  (rhetorical question)
>> >>
>> >
>> > Because on high volume product runs the flash comes preprogrammed =
and is soldered as is.
>> >
>> > Having a single binary to flash to every revision of the board mak=
es logistics considerably
>> > easier.
>> >
>> > Having to boot and tweak the bootloader settings to select the cor=
rect dtb (even if it=E2=80=99s present
>> > on the flash medium) takes time and is error-prone.
>> >
>> > Factory time =3D=3D money, errors =3D=3D money.
>> >
>> >>>
>> >>> No knobs to tweak means no knobs to break. And a broken knob can=
 have pretty bad consequences
>> >>> for a few million units.
>> >>
>> >> And you produce a few million units before testing that the first=
 one off the line works?
>> >>
>> >
>> > The first one off the line works. The rest will get some burn in a=
nd functional testing if you=E2=80=99re
>> > lucky. In many cases where the product is very cheap it might make=
 financial sense to just ship
>> > as is and deal with recalls, if you=E2=80=99re reasonably happy af=
ter a little bit of statistical sampling.
>> >
>> > Hardware is hard :)
>>
>> I'm failing to see how this series improves your manufacturing proce=
ss at all.
>>
>> 1. Won't you have to provide the factory with different eeprom image=
s for the
>>    White and Black?  You _trust_ them to get that right, or more lik=
ely, you
>>    have process control procedures in place so that you don't get 1 =
million Blacks
>>    flashed with the White eeprom image.
>>
>> 2. The White and Black use different memory technology so it's not a=
s if the
>>    eMMC from the Black will end up on the White SMT line (or vice ve=
rsa).
>>
>> 3  For that matter, why wouldn't you worry that all the microSD card=
s intended
>>    for the White were accidentally assembled with the first 50,000 B=
lacks; at
>>    that point you're losing a lot more than a few cents of profit. A=
nd that has
>>    nothing to do with what image you provided.
>>
>
> As you said, we can imagine many reasons to have a failure during the
> production, having several DTB files will increase the risk.

Then package them as a single file. You can even use DT to do that.
See u-boot FIT image.

Rob
