From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 11/11] dts: tc2: Update coresight bindings for hardware
 ports
Date: Tue, 11 Sep 2018 18:30:06 +0100
Message-ID: <b0ce9722-4663-ae36-83bd-59c908cd0295@arm.com>
References: <1536661032-30481-1-git-send-email-suzuki.poulose@arm.com>
 <1536661032-30481-12-git-send-email-suzuki.poulose@arm.com>
 <20180911170113.GA27663@e107155-lin>
 <fbde78a0-6487-7bdb-d02b-4fbf556f536e@arm.com>
 <9cf11b0c-b5c0-b39d-8c57-ad7aea5c6212@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9cf11b0c-b5c0-b39d-8c57-ad7aea5c6212@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, mathieu.poirier@linaro.org, arm@kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On 09/11/2018 06:23 PM, Sudeep Holla wrote:
> 
> 
> On 11/09/18 18:15, Suzuki K Poulose wrote:
>> On 09/11/2018 06:01 PM, Sudeep Holla wrote:
>>> On Tue, Sep 11, 2018 at 11:17:12AM +0100, Suzuki K Poulose wrote:
>>>> Switch to the new coresight bindings
>>>>
>>>
>>> I still see the below warnings:
>>>
>>> vexpress-v2p-ca15_a7.dtb: Warning (graph_child_address):
>>>      /replicator/in-ports: graph node has single child node 'port@0',
>>>      #address-cells/#size-cells are not necessary
>>> vexpress-v2p-ca15_a7.dtb: Warning (graph_child_address):
>>>      /funnel@20040000/out-ports: graph node has single child node
>>> 'port@0',
>>>      #address-cells/#size-cells are not necessary
>>>
>>> I need the below patch to fix them, let me know if it looks OK, I can
>>> amend and apply.
>>
>> Thanks for reporting. I purposefully added the "address-cells" and
>> followed the format everywhere in the series thinking that, that is
>> indeed the formal way of doing it, rather than having implicit port
>> numbers. I can send an updated series fixing it everywhere.
>>
> No need to post the update for TC2 unless it's different from what I
> have proposed.
> 

Yes, the changes look good. Thanks Sudeep. I will drop this patch from
the next version then.

Btw, my kernel build didn't trigger those warnings.

Thanks
Suzuki
