From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [RFC PATCH 0/3] mailbox: hisilicon: add mailbox driver
Date: Mon, 10 Aug 2015 12:32:05 +0530
Message-ID: <CABb+yY1HTGNi4gZABNhXjpA57DPZx-tv=6+m4JLyx4wPHfovyA@mail.gmail.com>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
	<CABb+yY0-RQ80q92EBsuBoYpjxW5zR=nXr+j3zCXw3wKkCf33OQ@mail.gmail.com>
	<20150805231743.GB6880@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150805231743.GB6880@leoy-linaro>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.com, Guangyue Zeng <zengguangyue@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 6, 2015 at 4:47 AM, Leo Yan <leo.yan@linaro.org> wrote:
> Hi Jassi,
>
> Thanks for review.
>
> On Wed, Aug 05, 2015 at 04:22:01PM +0530, Jassi Brar wrote:
>> On Mon, Aug 3, 2015 at 6:43 AM, Leo Yan <leo.yan@linaro.org> wrote:
>
> [...]
>
>> > For easily extending for Hisilicon series SoCs (SoCs may have difference
>> > for register's definition with each other), so firstly implement common
>> > mailbox driver; this common mailbox driver provides three mainly
>> > functionality:
>> >
>> >  - help register channels into framework;
>> >  - hook low level callback functions for register's operations;
>> >  - Enhance rx channel's message queue, which is based on the code in
>> >    drivers/mailbox/omap-mailbox.c.
>> >
>> Not cool.
>>  Please don't reinvent the wheel by having platform specific
>> implementation of the mailbox api. Which vendor doesn't plan to roll
>> out new SoCs, and hence variations of mailbox controllers?  The OMAP
>> stack predates the common api, and was actually supposed to be
>> converted over eventually. Please implement just the
>> drivers/mailbox/hi6220-mailbox.c (preferably by the name of the
>> mailbox controller, if any)
>
> Understood. Here i have one question, the rx channel's message queue is
> looks like a common mechanism and can be added into framework file
> mailbox.c, then Soc driver file can _ONLY_ focus on register level's
> operations. If so, the common driver in this patch also is unnecessary.
>
Yes, that's what I say, no 'common' driver for a platform.

> Do you suggest to use upper method to rework patches? Or just think
> it's okay to implement rx channel's message queue in hi6220-mailbox.c?
>
The code in drivers/mailbox/ should only manage the controller
(registers and interrupts). Everything else (queues, shmem etc) should
be in platform specific client driver(s).
