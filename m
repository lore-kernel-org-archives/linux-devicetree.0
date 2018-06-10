From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Sun, 10 Jun 2018 14:28:12 +0100
Message-ID: <5d1eaf2e-0b8d-3f09-a351-709a95a265eb@linaro.org>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
 <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
 <20180417165420.423a691b@avionic-0020>
 <8c4b48ad-e99e-030a-a4ee-b6df0fa59c79@linaro.org>
 <20180417180040.04f53495@avionic-0020> <20180418134119.2e587621@avionic-0020>
 <9f7d2987-b33e-79b5-ae58-2985fd7334e4@linaro.org>
 <20180418143243.3c23493c@avionic-0020>
 <e34619a4-e9b6-9945-a1cc-a3680aac6819@linaro.org>
 <20180418153440.187ed16e@avionic-0020>
 <d30656d6-f17e-6ed0-251f-2b59d02cd202@linaro.org>
 <20180607184155.6da38a01@tock>
 <0fb0e8e9-e7b8-10c3-fcdd-399c73a33878@linaro.org>
 <20180608125938.4fd457a0@tock>
 <cd7a0085-66cd-308e-a950-cd0eb96db945@linaro.org>
 <20180608190717.55cb185c@tock>
 <02d3cba5-01a3-4d8f-55fc-9c7b7fd5e5c1@linaro.org>
 <20180610133611.51cf6651@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180610133611.51cf6651@tock>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 10/06/18 12:36, Alban wrote:
> On Sun, 10 Jun 2018 11:32:36 +0100
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> 
>> On 08/06/18 18:07, Alban wrote:
>>> On Fri, 8 Jun 2018 12:34:12 +0100
>>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
>>>    
>> ...
>>>
>>> I looked into this. It would work fine for the cells but not so nicely
>>> for the nvmem device API. The phandle for the nvmem device would have
>>> to reference the node passed here and not the real device. We would end
>>> up with a DT like this:
>>>
>>> flash@0 {
>>> 	compatible = "mtd";
>>> 	...
>>> 	nvmem_dev: nvmem-cells {
>>> 		compatible = "nvmem-cells";
>>> 		...
>>>           };
>>> };
>>>
>>> other-device@10 {
>>> 	...
>>> 	nvmem = <&nvmem_dev>;
>>> };
>>>
>>> Now if there is no cell defined we have this empty child node that make
>>> very little sense, it is just there to accommodate the nvmem API.
>>>    
>> NO. This just looks fine!
>> nvmem-cells is the nvmem provider node without which you would not have
>> any provider instance.
>> All this looks as expected!
>> Am not sure what is the problem here!
> 
> The problem is that DT should represent the hardware, not the OS API.
Exactly!! flash/mtd has nvmem provider which should be represented in 
the DT.

There is no change in DT side from your original patch vs the new 
approach. You still are going to have the same subnode.

Isn't it?

AFAIU, the new approach will make it explicit that there is a nvmem 
provider in the DT.
...
> What should be represented is that other drivers can access data stored
> on this device. It is my understanding that this wouldn't be an
> acceptable binding as the nvmem provider node would only exists because
> of how the NVMEM API currently works, a correct binding would just
> directly reference the storage device without this extra node.
> 
...

>> Having a subnode still sounds very fragile to me,
>> and this could be much specific case of MTD provider. We might have
>> instances where this could be sub-sub node of the the original provider
>> for other providers. Also I do not want to bring in Provider specifics
>> layout into nvmem bindings.
>>
>> I can not make myself any clearer than this, Its going to be a NAK from
>> my side for the above reasons!
> 
> I fully understand you concern but I think they are overblown. First I
> highly doubt that more layouts will ever be needed, using a compatible
> string pretty much guarantee that we won't clash with another binding.
> Furthermore even if you consider this extension "MTD specific" the
> amount of code is very small, non intrusive and only run once at
> registration time. I would understand if we were talking about pages of
> code nesting in various place, but not really when it is a single small
> if block with an obvious condition. And finally I don't see that as MTD
> specific as any other device could use this feature without any code
> change.
> 
>> Also, patch I shared should give enough flexibility to various range of
>> providers which have different child node layouts without touching the
>> nvmem bindings. If it works please use it.
> 
> It works from a code POV but it break the basic guidelines of DT
> bindings. As I want to have this done, I'm going to do a patch as you
> want, but I see a high chance that the binding is going to be rejected
> by the DT maintainers and we'll be back here again.

If you think the sub node is going to be a problem from MTD point of 
view then that is worth discussing.
Adding subnode in nvmem bindings is not going to help or make the 
situation any better.

Lets see how this goes!

thanks,
srini

> 
> Alban
> 
