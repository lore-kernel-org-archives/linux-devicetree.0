From: Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V1 0/9] add clock driver for Spreadtrum platforms
Date: Thu, 22 Jun 2017 18:07:52 +0800
Message-ID: <CAAfSe-uTzgz0kyhQQzqpYKnYxDLv+3gG_9MfdrBTY-AUC549Gg@mail.gmail.com>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com> <20170620012530.GG4493@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620012530.GG4493@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 20 June 2017 at 09:25, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/18, Chunyan Zhang wrote:
>> In the last cycle, the patches support Whale2 sc9860 mobile chip have been
>> merged. This patchset adds clock driver which is used on almost all
>> Spreadtrum SoCs.
>>
>> This is a rewrite of Spreadtrum's original clock driver[1] according to the
>> comments[2] from Stephen Boyd.
>>
>> This series also adds Spreadtrum clock binding documentation and devicetree
>> data.
>>
>> Any comments would be greatly appreciated.
>
> Overall it seems to copy quite a bit of code from sunxi-ng, which
> is OK, but if that's just copy/paste + replace some names then
> perhaps we should consolidate the two implementations into one
> that both SoCs can use.
>

OK, will try.

> Also, is there any reason why we can't use a platform device
> driver for this instead of the DT probing mechanism? That is more
> preferred method of probing clk controllers.

>From what I have known on ARM platforms, device drivers cannot
recognize out which SoC the driver is running on, assume that the
device on different SoC has some differences.  To make one only kernel
Image can be used on all SoCs of Spreadtrum, we selected the way of
loading different dtb for each SoC.

Actually, I haven't understood the merits of moving more clk things to
driver from DT, could you please introduce more about that?


Many appreciated,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
