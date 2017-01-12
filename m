From: Anurup M <anurupvasu@gmail.com>
Subject: Re: [PATCH v3 00/10] perf: arm64: Support for Hisilicon SoC Hardware
 event counters
Date: Thu, 12 Jan 2017 11:57:05 +0530
Message-ID: <587721B9.2060204@gmail.com>
References: <1483339672-23778-1-git-send-email-anurup.m@huawei.com>
 <20170110174311.GB24036@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110174311.GB24036@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, catalin.marinas@arm.com, arnd@arndb.de, geert+renesas@glider.be, davem@davemloft.net, akpm@linux-foundation.org, corbet@lwn.net, will.deacon@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, anurup.m@huawei.com, zhangshaokun@hisilicon.com, tanxiaojun@huawei.com, xuwei5@hisilicon.com, sanil.kumar@hisilicon.com, john.garry@huawei.com, gabriele.paoloni@huawei.com, shiju.jose@huawei.com, wangkefeng.wang@huawei.com, linuxarm@huawei.com, shyju.pv@huawei.com, dikshit.n@huawei.com
List-Id: devicetree@vger.kernel.org



On Tuesday 10 January 2017 11:13 PM, Mark Rutland wrote:
> Hi,
>
> On Mon, Jan 02, 2017 at 01:47:52AM -0500, Anurup M wrote:
>> ToDo:
>> 1) The counter overflow handling is currently unsupported in this
>>     patch series.
>  From a quick scan of the patches, I see mention of an interrupt in a
> comment the driver, but there's noething in the DT binding.
>
> Is there an overflow interrupt at all?
>
> Or do you need to implement polling to avoid overflow?
>
> This is a prerequisite for merging the driver.

The HiP0x chips support counter overflow interrupt for L3C and MN.
The HiP05/06 interrupts in CPU die use Hisilicon mbigen-v1, but the 
mbigen-v1
driver is not available in mainline. So the L3C and MN PMU in HiP05/06 
cannot
support counter overflow in driver.
As the support for HiP05/06 are not the prime focus now. I shall remove 
them
from the patch series and shall plan to include them later.

For HiP07, as it use mbigen-v2, which is in mainline, I shall include 
the overflow
handling support in the next revision (V4 series).

Thanks,
Anurup

> Thanks,
> Mark.
