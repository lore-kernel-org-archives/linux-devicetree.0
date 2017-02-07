From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Date: Tue, 7 Feb 2017 01:13:37 +0000
Message-ID: <ebe243d06f3542318e5365c560e6cf79@svr-chch-ex1.atlnz.lc>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <20170203034012.29399-5-chris.packham@alliedtelesis.co.nz>
 <20170206231400.GM25384@codeaurora.org>
 <9974653ab84040c3b12fad075790c123@svr-chch-ex1.atlnz.lc>
 <20170207010308.GN25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/02/17 14:03, Stephen Boyd wrote:=0A=
> On 02/06, Chris Packham wrote:=0A=
>> On 07/02/17 12:14, Stephen Boyd wrote:=0A=
>>> On 02/03, Chris Packham wrote:=0A=
>>>> The initial implementation in commit e120c17a70e5 ("clk: mvebu: suppor=
t=0A=
>>>> for 98DX3236 SoC") hardcoded a fixed value for the main PLL frequency.=
=0A=
>>>> Port code from the Marvell supplied Linux kernel to support different=
=0A=
>>>> PLL frequencies and provide clock gating support.=0A=
>>>>=0A=
>>>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>>>> ---=0A=
>>>>  .../devicetree/bindings/clock/mvebu-core-clock.txt |   7 +=0A=
>>>>  .../bindings/clock/mvebu-gated-clock.txt           |  11 ++=0A=
>>>>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  14 +-=0A=
>>>>  drivers/clk/mvebu/Makefile                         |   2 +-=0A=
>>>>  drivers/clk/mvebu/armada-xp.c                      |  13 --=0A=
>>>>  drivers/clk/mvebu/mv98dx3236.c                     | 144 ++++++++++++=
+++++++++=0A=
>>>=0A=
>>> This mixes dts and clk driver changes. Any chance it can be split=0A=
>>> up and just have the clk part go through clk tree? Otherwise, I=0A=
>>> can ack this if you want to take it all through arm-soc?=0A=
>>=0A=
>> I'm happy to split it if it will make life easier.=0A=
>>=0A=
>=0A=
> Well do things keep booting if the clk driver parts merge without=0A=
> the associated dts changes? It's nice to maintain backwards=0A=
> compatibility even for a short time to make the merge path=0A=
> easier.=0A=
>=0A=
=0A=
Unfortunately not. I could put the clk changes first (then I'd just have =
=0A=
checkpatch.pl complaining about new compatible strings). But if the clk =0A=
patches don't land before the dts changes the boards won't boot. However =
=0A=
that affects 1 person that we know of (me).=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
