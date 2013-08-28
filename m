From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 12:26:31 +0200
Message-ID: <521DD057.4040208@gmail.com>
References: <20130828113459.48ecbb34@armhf> <521DCD33.2070008@gmail.com> <20130828121943.1c8327ca@skate>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130828121943.1c8327ca@skate>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jean-Francois Moine <moinejf@free.fr>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On 08/28/2013 12:19 PM, Thomas Petazzoni wrote:
> Sebastian, Jean-Fran=C3=A7ois,
>
> On Wed, 28 Aug 2013 12:13:07 +0200, Sebastian Hesselbarth wrote:
>> On 08/28/2013 11:34 AM, Jean-Francois Moine wrote:
>>> This patch adds the nodes to instantiate the audio devices of the D=
ove
>>> boards.
>>>
>>> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
>>> ---
>>>    arch/arm/boot/dts/dove.dtsi                  | 18 ++++++++++++++=
++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.d=
tsi
>>> index 499abad..78227e2 100644
>>> --- a/arch/arm/boot/dts/dove.dtsi
>>> +++ b/arch/arm/boot/dts/dove.dtsi
>>> @@ -573,6 +573,24 @@
>>>    					phy-handle =3D <&ethphy>;
>>>    				};
>>>    			};
>>> +
>>> +			i2s0: audio-controller@b0000 {
>>> +				compatible =3D "marvell,mvebu-audio";
>>
>> [added Gregory to Cc]
>>
>> Jean-Francois,
>>
>> as Mark Brown already took the bindings patch for above generic
>> compatible, how are we going to discriminate different
>> implementations/features of Dove, Kirkwood, and Armada 370?
>
> I agree that mvebu-audio is not a really good compatible string. It
> should use the first SoC that introduced the IP block, so that if
> future SOCs have variations, we can introduce separate compatible
> strings.
>
> So for now, the compatible string should be kirkwood-audio.

Unfortunately, mvebu-audio has already been taken by Mark. Also, we
know the differences for the three SoCs now and should have a compatibl=
e
for each (and maybe mvebu-audio for fallback).

Also, we'll need to distinguish between the different audio controllers
on a single SoC, i.e. i2s0 and i2s1. I suggest checking the (phys) reg
base passed.

Sebastian
