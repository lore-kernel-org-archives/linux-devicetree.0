From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sat, 17 Aug 2019 20:05:49 +0200
Message-ID: <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Am 17.08.19 um 18:22 schrieb Chuanhong Guo:
> Hi!
>
> On Sat, Aug 17, 2019 at 11:40 PM Oleksij Rempel <fishor@gmx.net> wrote:
>
>> In provided link [0] the  ralink_clk_init function is reading SYSC_REG_=
CPLL_CLKCFG0 R/W register.
>> This register is used to determine clock source,  clock freq and CPU or=
 bus clocks.
>
> This register should only be changed by bootloader, not kernel. So
> it's read-only in kernel's perspective.
there is no kernel perspective, until you have some kind of privilege
separation. There is only: "i decided not to write on to writeable
register".

>> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used t=
o enable or disable clocks.
>> Jist wild assumption. All peripheral devices are suing bus clock.
>
> This assumption is incorrect. When this patchset is applied in
> OpenWrt, I asked the author why there's still a fixed clock in
> mt7621.dtsi, He told me that there's another clock for those unchanged
> peripherals and he doesn't have time to write a clock provider for it.

Can you please provide a link to this patch or email.

> I don't know how many undocumented clocks are there since this piece
> of info is missing in datasheet.
>
>>
>> IMO - this information is enough to create full blown drivers/clk/media=
tek/clk-mt7621.c
>
> And this information isn't enough because the assumption above is incorr=
ect :P

Ok, let's assume I accept this not technical argumentation.

We have at least 2 know registers:
SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
all or some ip cores. What is probably missing is a set of dividers for
each ip core. From your words it is not document.

With this information the clk driver will provide gate functionality and
a set of hardcoded clocks. With this driver will work part of power
management and nice devicetree without fixed clocks.

=2D-
Regards,
Oleksij
