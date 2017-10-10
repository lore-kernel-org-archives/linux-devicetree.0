From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v7 3/6] coresight: of: Use of_cpu_node_to_id helper
Date: Tue, 10 Oct 2017 10:38:11 +0100
Message-ID: <4518662b-01ce-30fd-a9ea-c517b2d1c5ff@arm.com>
References: <20171006103610.11853-1-suzuki.poulose@arm.com>
 <20171006103610.11853-4-suzuki.poulose@arm.com>
 <20171009025842.GA3146@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009025842.GA3146@leoy-linaro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, will.deacon@arm.com, sudeep.holla@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, Jonathan.Cameron@huawei.com, marc.zyngier@arm.com, peterz@infradead.org, mathieu.poirier@linaro.org
List-Id: devicetree@vger.kernel.org

On 09/10/17 03:58, Leo Yan wrote:
> Hi Suzuki,
> 
> On Fri, Oct 06, 2017 at 11:36:07AM +0100, Suzuki K Poulose wrote:
>> Reuse the new generic helper, of_cpu_node_to_id() to map a
>> given CPU phandle to a logical CPU number.
>>
>> Cc: Leo Yan <leo.yan@linaro.org>
>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Tested-by: Leo Yan <leo.yan@linaro.org>
> 
> BTW, I think the function get_cpu_for_node() in the file
> arch/arm64/kernel/topology.c we also can refactor with the same
> function, just reminding for this.
> 

Leo,

Thanks for the testing and the pointer. Yes we can move that to
use the new helper. On another take, I found that the arm_pmu
can also use it for pmu_parse_irq_affinity(). I will add
them to the series.

Cheers
Suzuki
