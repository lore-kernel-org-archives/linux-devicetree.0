From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 6/7] clk: sunxi-ng: Add A23 CCU
Date: Thu, 8 Sep 2016 16:32:25 +0800
Message-ID: <CAGb2v64JhY7KoaxGkpeGinLZ2GoYWyDj+UjE_JwLW_4sVYd_9w@mail.gmail.com>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-7-maxime.ripard@free-electrons.com> <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
 <20160908082939.GJ8913@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160908082939.GJ8913@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 4:29 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Wed, Sep 07, 2016 at 03:24:11PM +0800, Chen-Yu Tsai wrote:
>> > +               [CLK_BUS_MSGBOX]        = &bus_msgbox_clk.common.hw,
>>
>> A23 manual and Allwinner sources say there is a bus gate for SPINLOCK.
>> Tested it myself, and it indeed exists.
>
> Yes, sorry. It was supposed to be spinlock instead of msgbox.
>
>> > +       [RST_BUS_SPINLOCK]      =  { 0x2c4, BIT(22) },
>>
>> Allwinner sources say there is a reset control for MSGBOX.
>> Tested it myself, and it indeed exists.
>
> However, the msgbox is mentionned nowhere in the datasheet.
>
> I'd prefer to be able to test that it actually works before adding it
> to the clock driver.

I did in fact test it. With reset asserted, writes get ignored,
and reads produce all 0s. With the reset deasserted and clock
enabled, reads give the default value and writes stick. Afterwards
when I toggle the reset, the values revert to the default.

ChenYu
