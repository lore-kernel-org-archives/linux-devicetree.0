From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 6/6] ARM: zynq: DT: Add OCM controller node
Date: Tue, 18 Nov 2014 08:56:29 +0100
Message-ID: <d7d71aa91adc49e5890fe3d64caed4bf@BN1BFFO11FD034.protection.gbl>
References: <cover.1415962281.git.michal.simek@xilinx.com>
	<0a88d52b5e71fb220ca619180ec9ca746edad2b1.1415962281.git.michal.simek@xilinx.com>
	<546881CA.2020801@suse.de>
	<c52187589f5c4cc6b908d899c2b9f7a6@BN1BFFO11FD036.protection.gbl>
 <CAEgOgz7j3jFbf1HxtimzPDMQ3oRu8AAHhHAUtg1boYjOUV5ygA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEgOgz7j3jFbf1HxtimzPDMQ3oRu8AAHhHAUtg1boYjOUV5ygA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, =?UTF-8?B?U8O2cmVuIA==?= =?UTF-8?B?QnJpbmttYW5u?= <soren.brinkmann@xilinx.com>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 11/17/2014 12:00 AM, Peter Crosthwaite wrote:
> On Mon, Nov 17, 2014 at 5:32 AM, S=C3=B6ren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
>> On Sun, 2014-11-16 at 11:51AM +0100, Andreas F=C3=A4rber wrote:
>>> Hi Michal,
>>>
>>> Am 14.11.2014 um 11:52 schrieb Michal Simek:
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/=
zynq-7000.dtsi
>>>> index ce2ef5bec4f2..e217fb1c1169 100644
>>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>>>> @@ -150,6 +150,13 @@
>>>>                     reg =3D <0xf8006000 0x1000>;
>>>>             };
>>>>
>>>> +           ocmc: memory-controller@f800c000 {
>>>> +                   compatible =3D "xlnx,zynq-ocmc-1.0";
>>>> +                   interrupt-parent =3D <&intc>;
>>>> +                   interrupts =3D <0 3 4>;
>>>> +                   reg =3D <0xf800c000 0x1000>;
>>>> +           };
>>>> +
>>>>             uart0: serial@e0000000 {
>>>>                     compatible =3D "xlnx,xuartps", "cdns,uart-r1p8=
";
>>>>                     status =3D "disabled";
>>>
>>> Not directly related to this patch: As one can see here, the node o=
rder
>>> is quite a mess... According to Olof, nodes should be ordered by un=
it
>>> address, whereas here some but not all seem ordered by node name. W=
ould
>>> you welcome a cleanup patch, or can you fix that yourself?
>>
>> I wouldn't say it's a mess, just a different property to sort the no=
des
>> by. For humans reading the DT, searching for nodes, alphabetical ord=
er
>> helps finding the right node, IMHO.
>=20
> I do generally find myself asking "whats that thing at that address"
> more than I find myself asking the "wheres that piece of hardware" so
> Andreas' sorting scheme makes more sense to me. Vertically scanning a
> DT to give yourself an overview of the system level address map is
> good too. Wheras alphabetic sorting doesn't mean to much.

IMHO the reason why we have names in DT is that it is easily to read/un=
derstand them
that's why name sorting seems to me more reasonable.
Something like machine code and assembler - asm is also sorted by names=
 not by opcode.

Is this strict rule?

Thanks,
Michal
