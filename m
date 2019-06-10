Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCH 2/2] dmagengine: pl330: add code to get reset property
References: <20190524002847.30961-1-dinguyen@kernel.org>
 <20190524002847.30961-2-dinguyen@kernel.org>
 <20190604121424.GW15118@vkoul-mobl>
 <1dd97825-f6a2-7a1b-33ef-e28e00cc8506@kernel.org>
 <CAMuHMdV+_DzS+LD720BeAn05RzYGO9rS51-ucicP=8D0wz9Psg@mail.gmail.com>
 <00841780-ad68-ba8d-bdf0-d3f78fa42c98@kernel.org>
 <55cc6016-f297-539d-df08-777903b79005@kernel.org>
 <CAMuHMdWktznAYLTp5t6PJy2+qcbs-5SHy4zCLUXYjRS3DqUZnw@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <cf47b2d3-129c-fd1a-2d0a-0b662d86cc1d@kernel.org>
Date: Mon, 10 Jun 2019 18:40:52 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWktznAYLTp5t6PJy2+qcbs-5SHy4zCLUXYjRS3DqUZnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On 6/7/19 2:37 AM, Geert Uytterhoeven wrote:
> Hi Dinh,
> 
> On Wed, Jun 5, 2019 at 5:31 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>> On 6/5/19 9:41 AM, Dinh Nguyen wrote:
>>> On 6/4/19 11:31 AM, Geert Uytterhoeven wrote:
>>>> On Tue, Jun 4, 2019 at 4:21 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>>>> On 6/4/19 7:14 AM, Vinod Koul wrote:
>>>>>> On 23-05-19, 19:28, Dinh Nguyen wrote:
>>>>>>> The DMA controller on some SoCs can be held in reset, and thus requires
>>>>>>> the reset signal(s) to deasserted. Most SoCs will have just one reset
>>>>>>> signal, but there are others, i.e. Arria10/Stratix10 will have an
>>>>>>> additional reset signal, referred to as the OCP.
>>>>>>>
>>>>>>> Add code to get the reset property from the device tree for deassert and
>>>>>>> assert.
>>>>>>>
>>>>>>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> 
>>>>>>> --- a/drivers/dma/pl330.c
>>>>>>> +++ b/drivers/dma/pl330.c
> 
>>>>>>> @@ -3028,6 +3032,30 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>>>>>>>
>>>>>>>      amba_set_drvdata(adev, pl330);
>>>>>>>
>>>>>>> +    pl330->rstc = devm_reset_control_get_optional(&adev->dev, "dma");
>>>>>>> +    if (IS_ERR(pl330->rstc)) {
>>>>>>> +            dev_err(&adev->dev, "No reset controller specified.\n");
> 
> "No reset controller specified.\n"
> 
>>>>>>
>>>>>> Wasnt this optional??
>>>>>
>>>>> Yes, this is optional. The call devm_reset_control_get_optional() will
>>>>> just return NULL if the reset property is not there, but an error
>>>>> pointer if something really went wrong. Thus, I'm using IS_ERR() for the
>>>>> error checking.
>>>>
>>>> So the error message is incorrect, as this is a real error condition?
>>>
>>> Yes, you're right! Will correct in V2.
>>
>> Looking at this again, I think the error message is correct. The
>> optional call will return NULL if the resets property is not specified,
>> and will return an error pointer if the reset propert is specified, but
>> the pointer to the reset controller is not found.
>>
>> So I think the error message is correct.
> 
> Please reread the error message, and what you wrote above.
> 
> Error message: "No reset controller specified".
> Rationale: NULL (i.e. no error) if "the resets property is not specified".
> 
> If an error pointer is returned, this may be due to probe deferral (to be
> propagated, but further ignored), or due to a real failure.
> 
> So IMHO the code should read:
> 
>         if (IS_ERR(pl330->rstc)) {
>                 if (PTR_ERR(pl330->rstc) != -EPROBE_DEFER)
>                         dev_err(&adev->dev, "Failed to get reset.\n");
>                 return PTR_ERR(pl330->rstc);
>         } else { ... }
> 

You're right! Will update in v2.

Thanks!

Dinh
