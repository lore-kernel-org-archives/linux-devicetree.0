Return-Path: <SRS0=zhyx=GC=ti.com=t-kristo@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory: ti-emif: add edac support under emif
References: <1518542129-25813-1-git-send-email-t-kristo@ti.com>
 <20180219031009.wduweeg53lnncntd@rob-hp-laptop>
 <186b6e13-be1d-e8e8-38db-efa5e3496dd8@ti.com>
 <CAL_JsqJTv+QH8xMGv6L7Dd-iF=mBZL+j4F0bVUWKipcMfY3zOQ@mail.gmail.com>
 <e36fc21f-8dc7-733a-9c43-789c99d9cb36@ti.com>
 <99ed2643-b01d-9e44-daf5-27860b963c27@oracle.com>
 <3cc1537c-a103-2a53-05d9-6e1233715331@ti.com>
 <f98eb356-a21b-2aed-0da0-ccc94acfcd17@oracle.com>
 <e3e07cf4-024b-ce3f-d75b-a73484302178@ti.com>
 <045a94dc-f129-4b22-c952-cb08c87b995c@oracle.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <e1099941-2675-9070-bccf-d78e22949627@ti.com>
Date: Mon, 12 Mar 2018 09:13:04 +0200
MIME-Version: 1.0
In-Reply-To: <045a94dc-f129-4b22-c952-cb08c87b995c@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 09/03/18 21:37, Santosh Shilimkar wrote:
> On 3/9/2018 1:15 AM, Tero Kristo wrote:
>> On 08/03/18 19:48, Santosh Shilimkar wrote:
>>> On 3/8/2018 1:32 AM, Tero Kristo wrote:
>>>> On 26/02/18 01:40, Santosh Shilimkar wrote:
>>>>>
>>>
>>> [...]
>>>
>>>>>> Yeah, I will post patches for those, thanks for review.
>>>>>>
>>>>> Let me know if you have already posted the follow up series ?
>>>>
>>>> Anybody planning to pick this patch for merge? Tony/Santosh?
>>>>
>>> I already did and its part of the pull request [1] I sent
>>> out on 3/5
>>
>> Oh ok thanks Santosh, just didn't get notified of that.
>>
>> How about the corresponding DTS patch for keystone?
>>
>> https://patchwork.kernel.org/patch/10219339/
>>
> Looks like I missed that one. Would have been nice to have both patches
> posted in one series. Could you please repost the patch with my ack and
> will request Arnd to apply it dierctly to arm-soc dts branch.

Sent it. The patches were split around this time due to some 
interdependencies between different subsystems; the dt-binding is needed 
for OMAP family parts also. However, the J6+ support for ddr-ecc is 
pushed to next merge window so its fine the binding goes in via your tree.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
