From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] nvmem: Convert to using %pOF instead of full_name
Date: Thu, 10 Aug 2017 09:57:48 +0100
Message-ID: <45abedcc-d343-2878-9cd2-a78df8fd3d88@linaro.org>
References: <20170718214339.7774-40-robh@kernel.org>
 <CAL_Jsq+bJjdfdNjpx=URP4EHPJt=MDc2V-eVr8OaPAftVph4cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+bJjdfdNjpx=URP4EHPJt=MDc2V-eVr8OaPAftVph4cg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 09/08/17 23:14, Rob Herring wrote:
> On Tue, Jul 18, 2017 at 4:43 PM, Rob Herring <robh@kernel.org> wrote:
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>> of the full path string for each node.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/nvmem/core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Ping?
I have already sent this patch to Greg to queue up for next.

Thanks,
srini

> 
>>
>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>> index 4c49285168fb..b0c60338296a 100644
>> --- a/drivers/nvmem/core.c
>> +++ b/drivers/nvmem/core.c
>> @@ -794,8 +794,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>>
>>          addr = of_get_property(cell_np, "reg", &len);
>>          if (!addr || (len < 2 * sizeof(u32))) {
>> -               dev_err(&nvmem->dev, "nvmem: invalid reg on %s\n",
>> -                       cell_np->full_name);
>> +               dev_err(&nvmem->dev, "nvmem: invalid reg on %pOF\n",
>> +                       cell_np);
>>                  rval  = -EINVAL;
>>                  goto err_mem;
>>          }
>> --
>> 2.11.0
>>
