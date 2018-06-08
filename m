From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Fri, 8 Jun 2018 12:34:12 +0100
Message-ID: <cd7a0085-66cd-308e-a950-cd0eb96db945@linaro.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608125938.4fd457a0@tock>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 08/06/18 11:59, Alban wrote:
> On Thu, 7 Jun 2018 18:03:16 +0100
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> 
>> On 07/06/18 17:41, Alban wrote:
>>> AFAIU the only thing that we disagree on now is if the nodes
>>> representing the cells should be direct children of the provider
>>> or in a dedicated subnode. For the MTD case both solution would solve
>>> the binding clash. I would really appreciate if the DT people could
>> Am reluctant in changing the nvmem generic bindings for a special case.
> 
> Where I think the generic binding is fundamentally flawed, as this
> problem will most probably appear again. But do note that my proposal

It depends from which side you are looking at this!!

There are more than 16 nvmem providers in kernel which use this bindings 
and they are fine!!

I obviously take some of your concerns w.r.t bindings and there is a 
scope of making the bindings much robust, most importantly the #address 
and #size-cells. But having a subnode still sounds very fragile to me, 
and this could be much specific case of MTD provider. We might have 
instances where this could be sub-sub node of the the original provider 
for other providers. Also I do not want to bring in Provider specifics 
into this bindings. If single level of subnode works for your case and 
the below patch works for you then I would recommend lets move on and 
try to get this going.

> doesn't require updating the dts using the original binding, both are
> still supported. I proposed deprecating the current binding because I
> think it is flawed, but we could also "officially" support both style.
> 
>> Can you try this with your original subnode proposal:
>> just pass the subnode node pointer in np of nvmem_config:
>>
>> ------------------------->cut<------------------------------------
>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>> index b05aa8e81303..c9621632bbfb 100644
>> --- a/drivers/nvmem/core.c
>> +++ b/drivers/nvmem/core.c
>> @@ -472,7 +472,11 @@ struct nvmem_device *nvmem_register(const struct
>> nvmem_config *config)
>>           nvmem->priv = config->priv;
>>           nvmem->reg_read = config->reg_read;
>>           nvmem->reg_write = config->reg_write;
>> -       nvmem->dev.of_node = config->dev->of_node;
>> +
>> +       if (config->np)
>> +               nvmem->dev.of_node = config->np;
>> +       else
>> +               nvmem->dev.of_node = config->dev->of_node;
>>
>>           if (config->id == -1 && config->name) {
>>                   dev_set_name(&nvmem->dev, "%s", config->name);
>> diff --git a/include/linux/nvmem-provider.h
>> b/include/linux/nvmem-provider.h index f89598bc4e1c..743345ffe2c8
>> 100644 --- a/include/linux/nvmem-provider.h
>> +++ b/include/linux/nvmem-provider.h
>> @@ -49,6 +49,7 @@ typedef int (*nvmem_reg_write_t)(void *priv,
>> unsigned int offset,nvmem_device_get(
>>     */
>>    struct nvmem_config {
>>           struct device           *dev;
>> +       struct device_node      *np;
>>           const char              *name;
>>           int                     id;
>>           struct module           *owner;
>>
>> ------------------------->cut<------------------------------------
> 
> That should work just fine to allow next to any kind of binding.
> I'll do a new patch using this approach for the code side and leaving
> the generic binding as it is.
Sure!!
This will give more flexibility to other provider drivers!


thanks,
srini
> 
> Alban
> 
