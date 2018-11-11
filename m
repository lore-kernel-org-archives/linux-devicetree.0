From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v6 5/9] dt-bindings: ARM: document marvell,ecc-enable
 binding
Date: Sun, 11 Nov 2018 19:57:51 +0000
Message-ID: <a07fead828b8452bb37708180dd721d4@svr-chch-ex1.atlnz.lc>
References: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz>
 <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
 <CAK8P3a3PNvBhyQw0bfGxKmxj+KeJB2_TXtDx2R1BpjTCYNqVkA@mail.gmail.com>
 <20181109114818.GB30658@n2100.armlinux.org.uk>
 <CAK8P3a26XmBpG3VzwUgSdd_Xo_S2ezSvA9mjKckRFr9p38j-dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Borislav Petkov <bp@alien8.de>, "jlu@pengutronix.de" <jlu@pengutronix.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 10/11/18 4:58 AM, Arnd Bergmann wrote:=0A=
> On Fri, Nov 9, 2018 at 12:48 PM Russell King - ARM Linux=0A=
> <linux@armlinux.org.uk> wrote:=0A=
>>=0A=
>> On Fri, Nov 09, 2018 at 12:40:06PM +0100, Arnd Bergmann wrote:=0A=
>>> On Fri, Nov 9, 2018 at 8:04 AM Chris Packham=0A=
>>> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>>>=0A=
>>>> Add documentation for the marvell,ecc-enable and marvell,ecc-disable=
=0A=
>>>> properties which can be used to enable/disable ECC on the Marvell auro=
ra=0A=
>>>> cache.=0A=
>>>>=0A=
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>>> ---=0A=
>>>=0A=
>>> Why do you need both enable and disable? Wouldn't one of them be enough=
 here?=0A=
>>=0A=
>> It isn't an "on when ecc-enable is present, off when not" because the=0A=
>> current behaviour is to preserve these bits in the control register.=0A=
>>=0A=
>> If we were to implement it as "if no ecc-enable property, turn off=0A=
>> ECC" then that would drastically change the behaviour - systems which=0A=
>> were configured for ECC suddenly lose ECC support.=0A=
>>=0A=
>> Since we don't know which have it and which don't, we can't implement=0A=
>> the option like that.=0A=
> =0A=
> What I meant was why we need support force-disabling it. I understand=0A=
> that we need to allow leaving it at the boot-time default as well as=0A=
> force-enabling it.=0A=
=0A=
I added ecc-disable because I was modeling it after =0A=
arm,parity-enable/arm,parity-disable. The only reason I can imagine =0A=
wanting to force disable this would be some mis-behaving SoC which has =0A=
it enabled by default in hardware, to my knowledge no such system exists =
=0A=
(that would use this driver).=0A=
=0A=
I'd be happy to drop the binding an implementation and send a v7 if you =0A=
feel strongly that it marvell,ecc-disable should be removed.=0A=
