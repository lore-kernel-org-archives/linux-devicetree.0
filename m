From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 2/9] drm/msm: Drop the gpu binding
Date: Wed, 4 May 2016 12:15:29 +0530
Message-ID: <57299A89.5040905@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1462273081-5814-3-git-send-email-architt@codeaurora.org>
 <CAL_JsqJJsdxW7a4cbGNs5oC6j-+Cq7+7rwh9W8D7OO+NJK351g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJJsdxW7a4cbGNs5oC6j-+Cq7+7rwh9W8D7OO+NJK351g@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 05/03/2016 06:12 PM, Rob Herring wrote:
> On Tue, May 3, 2016 at 5:57 AM, Archit Taneja <architt@codeaurora.org> wrote:
>> The driver currently identifies the GPU components it needs by parsing
>> a phandle list from the 'gpus' DT property.
>>
>> This isn't the right binding to go with. So, for now, just search all
>> device nodes and find the gpu node we need by parsing a list of
>> compatible strings.
>>
>> Once we know how to link the kms and gpu drivers, we'll drop this method
>> and use the correct binding.
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++-------
>>   1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 30b8f3b..f717a69 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1068,20 +1068,32 @@ static int compare_of(struct device *dev, void *data)
>>          return dev->of_node == data;
>>   }
>>
>> -static int add_components(struct device *dev, struct component_match **matchptr,
>> -               const char *name)
>> +static const char * const msm_compatible_gpus[] = {
>> +       "qcom,adreno-3xx",
>> +       "qcom,kgsl-3d0",
>> +};
>> +
>> +/*
>> + * We don't know what's the best binding to link the gpu with the drm device.
>> + * Fow now, we just hunt for all the possible gpus that we support, and add them
>> + * as components.
>> + */
>> +static int add_gpu_components(struct device *dev,
>> +                             struct component_match **matchptr)
>>   {
>> -       struct device_node *np = dev->of_node;
>>          unsigned i;
>>
>> -       for (i = 0; ; i++) {
>> +       for (i = 0; i < ARRAY_SIZE(msm_compatible_gpus); i++) {
>
> You can use of_find_matching_node() here instead of a loop.

I'll switch to that.

Thanks,
Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
