From: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 06/14] ARM: sun8i: clk: Add
 clk-factor rate application method
Date: Fri, 15 Jul 2016 16:22:31 +0200
Message-ID: <CAOMqctTds7adsfvehfv8wcxbb0NOpEQE5wRff6NwfPOUa3SbRw@mail.gmail.com>
References: <20160625034511.7966-1-megous@megous.com> <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather> <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather> <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr> <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <98fd2ab2-9b1d-1494-5867-7701780fd471@megous.com>
Sender: linux-clk-owner@vger.kernel.org
To: megous@megous.com
Cc: Jean-Francois Moine <moinejf@free.fr>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dev <dev@linux-sunxi.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 15 July 2016 at 15:48, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
>
> On 15.7.2016 15:27, Jean-Francois Moine wrote:
>> On Fri, 15 Jul 2016 12:38:54 +0200
>> Ond=C5=99ej Jirman <megous@megous.com> wrote:
>>
>>>> If so, then yes, trying to switch to the 24MHz oscillator before
>>>> applying the factors, and then switching back when the PLL is stab=
le
>>>> would be a nice solution.
>>>>
>>>> I just checked, and all the SoCs we've had so far have that
>>>> possibility, so if it works, for now, I'd like to stick to that.
>>>
>>> It would need to be tested. U-boot does the change only once, while=
 the
>>> kernel would be doing it all the time and between various frequenci=
es
>>> and PLL settings. So the issues may show up with this solution too.
>>
>> I don't think this is a good idea: the CPU clock may be changed at a=
ny
>> time with the CPUFreq governor. I don't see the system moving from
>> 1008MHz to 24MHz and then to 1200MHz when some computation is needed=
!
>
> PLL lock time is around 10-20us, I'd guess based on the number of loo=
ps
> in the PLL lock wait loop. So unless you'll be switching frequencies
> many times per second, this should be barely noticeable.
>
> But I'd like a different solution too.

Do you have a patch to test this?

=46or me changing CPU frequency on Orange Pi One always locks up the
system. I keep running it on the u-boot setup 1.08GHz at 1.1V

Thanks

Michal
