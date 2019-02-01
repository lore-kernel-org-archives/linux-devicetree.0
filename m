From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v3 0/2] Support for eMMC in AM65x-evm
Date: Fri, 1 Feb 2019 11:00:47 +0200
Message-ID: <228cf5ac-b07e-bce7-6078-bbab94692d8d@ti.com>
References: <20190117094424.7683-1-faiz_abbas@ti.com>
 <d75a123b-9e97-a3d1-1e3c-41ef6942dffb@ti.com>
 <20190124124032.aqp4ctqkpozbttwl@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124124032.aqp4ctqkpozbttwl@kahuna>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On 24/01/2019 14:40, Nishanth Menon wrote:
> On 13:43-20190124, Faiz Abbas wrote:
>> Hi,
>>
>> On 17/01/19 3:14 PM, Faiz Abbas wrote:
>>> The following patches add eMMC support on TI's AM65x-evm.
>>>
>>> v3:
>>>   1. Fixed patch titles to only include eMMC
>>>   2. Added dma-coherent to the sdhci0 node.
>>>
>>> v2:
>>>   1. The SD card node is under debug for some usecases.
>>>      Only upstreaming eMMC support for now.
>>>   2. Rebased to latest mainline.
>>>   3. Removed status = "disabled" from dtsi patch
>>>   4. Fixed node name to not include '_'s
>>>
>>> Faiz Abbas (2):
>>>    arm64: dts: ti: k3-am654: Add Support for eMMC host controller
>>>    arm64: dts: ti: k3-am654-base-board: Add eMMC Support
>>>
>>>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 14 +++++++++++
>>>   .../arm64/boot/dts/ti/k3-am654-base-board.dts | 25 +++++++++++++++++++
>>>   2 files changed, 39 insertions(+)
>>>
>>
>> Gentle ping.
> 
> 
> OK With me. Tero: are you publishing a next branch? could you
> pick this up please?
> 

Ok, queued up for 5.1.

I also pushed an am654-next branch to git.kernel.org. This is not 
tracked in linux-next yet though, I am not quite sure if anybody is 
doing any am654 testing with linux-next, and I only push DT patches via 
this branch anyway which are kind of special.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
