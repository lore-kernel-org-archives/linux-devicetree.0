From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Date: Tue, 7 Feb 2017 01:25:47 +0000
Message-ID: <5a974d9d7260432087619486bf5d79ed@svr-chch-ex1.atlnz.lc>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <20170203034012.29399-5-chris.packham@alliedtelesis.co.nz>
 <20170206231400.GM25384@codeaurora.org>
 <9974653ab84040c3b12fad075790c123@svr-chch-ex1.atlnz.lc>
 <20170207010308.GN25384@codeaurora.org>
 <ebe243d06f3542318e5365c560e6cf79@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/02/17 14:13, Chris Packham wrote:=0A=
> On 07/02/17 14:03, Stephen Boyd wrote:=0A=
>> On 02/06, Chris Packham wrote:=0A=
>>> On 07/02/17 12:14, Stephen Boyd wrote:=0A=
>>>> On 02/03, Chris Packham wrote:=0A=
>>>>> The initial implementation in commit e120c17a70e5 ("clk: mvebu: suppo=
rt=0A=
>>>>> for 98DX3236 SoC") hardcoded a fixed value for the main PLL frequency=
.=0A=
>>>>> Port code from the Marvell supplied Linux kernel to support different=
=0A=
>>>>> PLL frequencies and provide clock gating support.=0A=
>>>>>=0A=
>>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>>>> ---=0A=
>>>>>  .../devicetree/bindings/clock/mvebu-core-clock.txt |   7 +=0A=
>>>>>  .../bindings/clock/mvebu-gated-clock.txt           |  11 ++=0A=
>>>>>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  14 +-=0A=
>>>>>  drivers/clk/mvebu/Makefile                         |   2 +-=0A=
>>>>>  drivers/clk/mvebu/armada-xp.c                      |  13 --=0A=
>>>>>  drivers/clk/mvebu/mv98dx3236.c                     | 144 +++++++++++=
++++++++++=0A=
>>>>=0A=
>>>> This mixes dts and clk driver changes. Any chance it can be split=0A=
>>>> up and just have the clk part go through clk tree? Otherwise, I=0A=
>>>> can ack this if you want to take it all through arm-soc?=0A=
>>>=0A=
>>> I'm happy to split it if it will make life easier.=0A=
>>>=0A=
>>=0A=
>> Well do things keep booting if the clk driver parts merge without=0A=
>> the associated dts changes? It's nice to maintain backwards=0A=
>> compatibility even for a short time to make the merge path=0A=
>> easier.=0A=
>>=0A=
>=0A=
> Unfortunately not. I could put the clk changes first (then I'd just have=
=0A=
> checkpatch.pl complaining about new compatible strings). But if the clk=
=0A=
> patches don't land before the dts changes the boards won't boot. However=
=0A=
> that affects 1 person that we know of (me).=0A=
>=0A=
=0A=
Actually I wonder if I can try a bit harder to keep a system booting. =0A=
The following might work=0A=
1) add the compatible strings to the existing armada clock drivers.=0A=
2) update the dts to use the new compatible strings.=0A=
3) add the new driver and remove the compatible strings from the armada =0A=
drivers.=0A=
=0A=
#1 would still upset checkpatch.pl because the documentation would only =0A=
arrive in #2.=0A=
=0A=
