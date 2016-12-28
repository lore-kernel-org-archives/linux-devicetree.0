From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Wed, 28 Dec 2016 11:10:02 +0530
Message-ID: <CAFp+6iE+7ta4dwNBj59Nro+kGWHuERNEj0gwF9AkfFvcy7oxWQ@mail.gmail.com>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-2-git-send-email-vivek.gautam@codeaurora.org>
 <20161222211633.ldk3ykqiat6peyw7@rob-hp-laptop> <CAFp+6iESYfFrLpidhAXrPm7LQtYa6dV1xOL=AjdMfLXgL8Fv8g@mail.gmail.com>
 <a4fc38f0-425d-5d4f-7fe9-8245b5b9c3af@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a4fc38f0-425d-5d4f-7fe9-8245b5b9c3af@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, kishon <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2016 at 6:43 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/22/2016 08:52 PM, Vivek Gautam wrote:
>>
>>>> +
>>>> +Optional properties:
>>>> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
>>>> +             tuning parameters for qusb2 phy, one for each entry
>>>> +             in nvmem-cell-names.
>>>> + - nvmem-cell-names: must be "tune2_hstx_trim" for cell containing
>>>> +                  HS Tx trim value.
>>> ditto.
>> nvmem doesn't allow, at this point, to get the cells by index.
>> Its APIs take 'const char' cell id and get the cell.
>>
>> We should add this support to get the cell by index.
>> Will create a patch for that, and drop the '-names' property from bindings.
>>
>
> If we introduce a cells based API just for this case of one phandle it
> may make sense to allow the cell id to be NULL and default to whatever
> cell is there without a names property. We do something similar with
> clks where a NULL connection id defaults to the first phandle in the
> list. Then we can avoid having a new set of DT specific APIs here. Of
> course, documentation should be updated to indicate that a NULL cell_id
> means use index 0 with DT.

Right. This makes sense. I didn't notice that we do something
similar in clocks.
I will post a new change for this (which should be pretty small
in comparison to earlier patchset that introduced new dt based APIs).

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
