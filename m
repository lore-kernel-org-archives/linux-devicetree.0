From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 0/2] Add support for Hi6220 coresight
Date: Fri, 13 Oct 2017 09:57:02 +0100
Message-ID: <59E07FDE.40307@hisilicon.com>
References: <1504226835-2115-1-git-send-email-leo.yan@linaro.org>
 <20170901013301.GN21656@codeaurora.org> <20171007121802.GC23080@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171007121802.GC23080@leoy-linaro>
Sender: linux-clk-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Li Pengcheng <lipengcheng8@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 2017/10/7 13:18, Leo Yan wrote:
> Hi Stephen, Wei,
> 
> On Thu, Aug 31, 2017 at 06:33:01PM -0700, Stephen Boyd wrote:
>> On 09/01, Leo Yan wrote:
>>> This patch series adds support for coresight on Hi6220; the first patch
>>> is to fix coresight PLL so can avoid system hang after we enable
>>> coresight, the second patch is to add DT binding according to coresight
>>> topology.
>>>
>>> The patch has been tested on Hikey; By using OpenCSD snapshot mode, it
>>> can successfully decode ETF and ETB trace data.
>>>
>>
>> I can take the first one and second one goes through arm-soc?
> 
> Could you pick these two patches for Hi6220 coresight enabling for
> this merge window? Or need me resend these two patches?

Applied patch 2 into hisilicon dt tree with slight fix.
Thanks!

BR,
Wei

> 
> Thanks,
> Leo Yan
> 
> .
> 

