From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v2 2/5] of/numa: fix a memory@ node can only contains one
 memory block
Date: Mon, 6 Jun 2016 09:24:56 +0800
Message-ID: <5754D0E8.8070009@huawei.com>
References: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
 <1464427377-12712-3-git-send-email-thunder.leizhen@huawei.com>
 <CAL_JsqJO1jXpmAJWUhCW+OK2mpTvtwzCuy_--3sQNUQhTvyFdA@mail.gmail.com>
 <574F8DA8.4040503@huawei.com> <20160603094520.GF9915@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160603094520.GF9915@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, David Daney <david.daney@cavium.com>, Catalin Marinas <catalin.marinas@arm.com>, Xinwei Hu <huxinwei@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Zefan Li <lizefan@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Grant Likely <grant.likely@linaro.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 2016/6/3 17:45, Will Deacon wrote:
> On Thu, Jun 02, 2016 at 09:36:40AM +0800, Leizhen (ThunderTown) wrote:
>> On 2016/6/2 4:13, Rob Herring wrote:
>>> I believe you still need this and not the one above. You only need it
>>> within the loop if you return. Otherwise, the last node always need to
>>> be put.
>>
>> OK. Thanks.
>>
>> Addition with Matthias's suggestion, I will move "return" into this patch,
>> so that this of_node_put(np) can be safely removed.
> 
> Do you want to include Kefeng's [1] patches in your series too? We don't
> need two sets of related NUMA cleanups :)

Yes, It's originally suggested by Joe Perches.

> 
> Will
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-June/432715.html
> 
> .
> 
