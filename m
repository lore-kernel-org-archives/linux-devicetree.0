From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v4 0/4] clk: hisilicon: support stub clock
Date: Wed, 12 Aug 2015 10:20:13 +0100
Message-ID: <55CB0FCD.7050303@hisilicon.com>
References: <1438673249-6051-1-git-send-email-leo.yan@linaro.org> <20150812003817.GI26614@codeaurora.org> <20150812014954.GA6215@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150812014954.GA6215@leoy-linaro>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, sunzhaosheng@hisilicon.com, victor.lixin@hisilicon.com
List-Id: devicetree@vger.kernel.org



On 8/12/2015 2:49 AM, Leo Yan wrote:
> Hi Stephen,
> 
> On Tue, Aug 11, 2015 at 05:38:17PM -0700, Stephen Boyd wrote:
>> On 08/04, Leo Yan wrote:
>>> This series adds support for hisilicon stub clock driver. On hi6220,
>>> the bootloader needs load the firmware image and set info for OPPs;
>>> after run into kernel, the stub clock driver is used to communicate
>>> w/t firmware for cpu dynamic frequency scaling.
>>>
>>> In patch series v1/v2, the stub clock driver simply writes request in
>>> sram and send ipc to firmware; For patch series v3, the firmware has
>>> been upgraded to use mailbox, so stub clock driver will call standard
>>> mailbox APIs to request mailbox channel and send message to firmware.
>>>
>>> Patch 4 adds stub clock node into dts and it references mailbox with
>>> phandle, so patch 4 will depend on mailbox driver's patch series [1].
>>> These patches have been tested on 96board hikey and is used by cpufreq
>>> driver.
>>
>> The To: list is everyone, so I'm not sure who is supposed to
>> apply these patches. I'd like to take patches 1, 2, and 3 through
>> the clk tree though.
> 
> Thanks, you could take first three patches. For patch 4, i will
> re-send it after mailbox driver's patches have been merged.

Hi Leo,

> Wei Xu, is this okay for you?

OK :)

Best Regards,
Wei

> 
> Thanks,
> Leo Yan
> 
> .
> 
