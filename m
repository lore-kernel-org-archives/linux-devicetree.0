From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/9] clk: hi3519: add dt-binding document and header file
Date: Tue, 08 Dec 2015 11:23:34 +0100
Message-ID: <1566981.5YV44UJUCQ@wuerfel>
References: <1449110364-23464-1-git-send-email-xuejiancheng@huawei.com> <2735980.8lIUhgbJzL@wuerfel> <5666A6B5.6020101@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5666A6B5.6020101@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 08 December 2015 17:45:25 xuejiancheng wrote:
> On 2015/12/7 17:36, Arnd Bergmann wrote:
> > On Monday 07 December 2015 16:01:03 xuejiancheng wrote:
> >> On 2015/12/4 18:56, Arnd Bergmann wrote:
> >>> On Friday 04 December 2015 11:21:28 xuejiancheng wrote:
> >>>> Hi Arnd,
> >>>>
> >>>> On 2015/12/3 17:44, Arnd Bergmann wrote:
> >>>>> On Thursday 03 December 2015 10:39:24 Jiancheng Xue wrote:
> >>>>>> +#ifndef __DTS_HI3519_CLOCK_H
> >>>>>> +#define __DTS_HI3519_CLOCK_H
> >>>>>
> >>>>> Please try to avoid adding headers like this if you can at all.
> >>>>>
> >>>>> I might ask you to merge the header file in one merge window
> >>>>> otherwise and submit the platform code one kernel later, as they
> >>>>> tendn to cause us needless dependencies otherwise.
> >>>>>
> >>>>
> >>>> Sorry. In v1, Rob suggested putting binding doc and header files in
> >>>> a separate patch. The clock driver indeed depends on the header.
> >>>>
> >>>> I will put the header and the clock driver in a patch, and keep the
> >>>> binding doc in another patch.
> >>>
> >>> Having split patches is better, I was really commenting on the fact
> >>> that ideally you would not have a header file at all. If we merge
> >>> the header through arm-soc, then you won't be able to merge the
> >>> clk driver easily, and if you merge the header through the clk
> >>> maintainer, I'm can't take your dts files.
> >>
> >> Thank you for your comments. Because the clocks in the crg module have
> >> different types and random layouts. If this header file is removed,
> >> the clock driver and the dts files will get very complicated.
> >>
> >> Could you help me acknowledge it if I put the header file and clock driver
> >> in a patch?
> >>
> >> Could you give me some suggestions If I want to keep this header file?
> > 
> > If this is another clock controller that has a random register layout,
> > then adding the header file is the least problematic solution indeed.
> 
> Is it OK if I put the header file and the clock driver in a patch?
> 
> If it's not OK, could you tell me how should I separate the patches?

It's ok to do it like this, but then I can't easily merge any DT changes
based on the header file into the arm-soc tree in the same merge window.
Staging out the .dts files by one merge window is the easiest solution
here, otherwise you need to set up a shared branch with the headers
changes and base both the clk driver and the dts branch on top of that
and cannot rebase those patches.

	Arnd
