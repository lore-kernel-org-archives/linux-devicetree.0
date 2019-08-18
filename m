From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sun, 18 Aug 2019 08:10:22 +0200
Message-ID: <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
 <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Paul Fertser <fercerpav@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 18.08.19 um 04:29 schrieb Chuanhong Guo:
> Hi!
>
> On Sun, Aug 18, 2019 at 2:06 AM Oleksij Rempel <linux@rempel-privat.de> =
wrote:
>>>> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used=
 to enable or disable clocks.
>>>> Jist wild assumption. All peripheral devices are suing bus clock.
>>>
>>> This assumption is incorrect. When this patchset is applied in
>>> OpenWrt, I asked the author why there's still a fixed clock in
>>> mt7621.dtsi, He told me that there's another clock for those unchanged
>>> peripherals and he doesn't have time to write a clock provider for it.
>>
>> Can you please provide a link to this patch or email.
>
> This discussion is in Chinese and using an IM software so there's no
> link available.
>
>> We have at least 2 know registers:
>> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
>> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
>> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
>> all or some ip cores.
>> What is probably missing is a set of dividers for
>> each ip core. From your words it is not document.
>
> The specific missing part I was referring to, is parent clocks for
> every gates. I'm not going to assume this with current openwrt device
> tree because some peripherals doesn't have a clock binding at all or
> have a dummy one there.

Ok, then I do not understand what is the motivation to upstream
something what is not nearly ready for use. This code is currently on
prototyping phase and you have no information how to make it ready.

It means, we cannot expect that this driver will be fixed any time soon.

=2D-
Regards,
Oleksij
