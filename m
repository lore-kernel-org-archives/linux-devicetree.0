From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sat, 17 Aug 2019 17:40:01 +0200
Message-ID: <f0743ace-0ca2-82a2-a162-aaa98c8925a8@rempel-privat.de>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>, Rob Herring <robh@kernel.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi,

Am 17.08.19 um 16:42 schrieb Chuanhong Guo:
> Hi!
>
> On Tue, Aug 13, 2019 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
>> [...]
>>> +Example:
>>> +     pll {
>>> +             compatible =3D "mediatek,mt7621-pll";
>>
>> You didn't answer Stephen's question on v1.
>
> I thought he was asking why there's a syscon in compatible string. I
> noticed that the syscon in my previous patch is a copy-paste error
> from elsewhere and dropped it.
>
>>
>> Based on this binding, there is no way to control/program the PLL. Is
>> this part of some IP block?
>
> The entire section is called "system control" in datasheet and is
> occupied in arch/mips/ralink/mt7621.c [0]
> Two clocks provided here is determined by reading some read-only
> registers in this part.
> There's another register in this section providing clock gates for
> every peripherals, but MTK doesn't provide a clock plan in their
> datasheet. I can't determine corresponding clock frequencies for every
> peripherals, thus unable to write a working clock driver.

In provided link [0] the  ralink_clk_init function is reading SYSC_REG_CPL=
L_CLKCFG0 R/W register.
This register is used to determine clock source,  clock freq and CPU or bu=
s clocks.
SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to e=
nable or disable clocks.
Jist wild assumption. All peripheral devices are suing bus clock.

IMO - this information is enough to create full blown drivers/clk/mediatek=
/clk-mt7621.c

>>> +
>>> +             #clock-cells =3D <1>;
>>> +             clock-output-names =3D "cpu", "bus";
>>> +     };
>>> --
>>> 2.21.0
>>>
>
> Regards,
> Chuanhong Guo
>
> [0] https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt76=
21.c#L156
>


=2D-
Regards,
Oleksij
