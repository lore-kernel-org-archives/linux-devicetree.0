From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V1 7/9] clk: sprd: add adjustable pll support
Date: Thu, 22 Jun 2017 13:15:24 +0200
Message-ID: <CAK8P3a1ELg1XcY-QOZn-f6kR9yt-Q6LNLUYEY-BNW-2BaBy6EQ@mail.gmail.com>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-8-chunyan.zhang@spreadtrum.com> <20170620013710.GJ4493@codeaurora.org>
 <CAAfSe-sMy3aM9=LwpVivvHKy4hVw3GEd3U-hZe17pXM5fJRxPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAAfSe-sMy3aM9=LwpVivvHKy4hVw3GEd3U-hZe17pXM5fJRxPg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 12:17 PM, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> On 20 June 2017 at 09:37, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 06/18, Chunyan Zhang wrote:

>>> +     kint = DIV_ROUND_CLOSEST(((fvco - refin * nint * CCU_PLL_1M)/10000) *
>>> +     ((mask >> (shift + i)) + 1), refin * 100) << i;
>>> +     cfg[index].val |= (kint << shift) & mask;
>>> +     cfg[index].msk |= mask;
>>> +
>>> +     ibias_val = pll_get_ibias(fvco, pll->itable);
>>> +
>>> +     mask = pmask(pll, PLL_IBIAS);
>>> +     index = pindex(pll, PLL_IBIAS);
>>> +     shift = pshift(pll, PLL_IBIAS);
>>> +     cfg[index].val |= ibias_val << shift & mask;
>>> +     cfg[index].msk |= mask;
>>> +
>>> +     for (i = 0; i < reg_num; i++) {
>>> +             if (cfg[i].msk)
>>> +                     ccu_pll_writel(pll, i, cfg[i].val, cfg[i].msk);
>>> +     }
>>> +
>>
>> Are we waiting for the writel() to go through above? If so we
>> need a readl() of the same register to make sure the write has
>> completed before delaying.
>
> After writing these configuration registers, we have to wait a certain
> time to make sure the pll has worked as we configured.  This depends
> on other circuit part, so we use udelay rather than reading the same
> register.

I think you have to do both: normally the writel() is not guaranteed
to arrive at the device until you read back from an address in the
same device, so the delay must happen after the readl(), or you won't
know how long to wait for.

       Arnd
