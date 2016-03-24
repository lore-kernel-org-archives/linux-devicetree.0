From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 04/12] ARM: dts: dragonboard-600c: add board support with
 serial
Date: Wed, 23 Mar 2016 18:48:46 -0700
Message-ID: <56F3477E.8090205@codeaurora.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762442-9492-1-git-send-email-srinivas.kandagatla@linaro.org>
 <56F2F78E.8050002@codeaurora.org> <56F2FCD0.1000708@linaro.org>
 <CAOCOHw7TyzDf4jvAMChOFFEgsL4Z1+CcESLOuckT=Q7W9hQvCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOCOHw7TyzDf4jvAMChOFFEgsL4Z1+CcESLOuckT=Q7W9hQvCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/23/2016 06:04 PM, Bjorn Andersson wrote:
> On Wed, Mar 23, 2016 at 1:30 PM, Srinivas Kandagatla
> <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> On 23/03/16 20:07, Stephen Boyd wrote:
>>> On 03/23/2016 12:47 PM, Srinivas Kandagatla wrote:
>>>> diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
>>>> b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
>>>> new file mode 100644
>>>> index 0000000..e96aab6
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
>>>> @@ -0,0 +1,36 @@
>>>> +#include "qcom-apq8064-v2.0.dtsi"
>>>> +
>>>> +/ {
>>>> +       model = "Qualcomm Technologies, Inc. APQ8064 DragonBoard600c";
>>>> +       compatible = "qcom,apq8064-dragonboard600c", "qcom,apq8064";
>>>
>>> Does the bootloader look at this string at all or is it using appended
>>> DTB design? I'm mostly worried about having that
>> Not at least on APQ8064 bootloaders, as they are still missing DT support.
>> Currently we append dtb to the kernel.
>>> qcom,apq8064-dragonboard600c part. It should probably be
>>> qcom,apq8064-sbc or something like that instead.
>> Will do that in next version.
>>
> This "sbc" isn't that just the abbreviation for "single board
> computer"? I find it hard to believe this is _the_ 8064 sbc or the
> only 8064 sbc.

I don't make up the names, but for other qcom sbc products the
bootloader is looking for sbc there to make sure it picks the right dtb
blob. So I guess this is _the_ qcom 8064 sbc? Definitely not _the_ 8064
sbc though.

If this device won't get those bootloaders that look for this then it
doesn't really matter and I don't care what this is named. Please take a
look at Documentation/devicetree/bindings/arm/qcom.txt for what I'm
talking about though.

>
> Also, if I make a product based of this board, with some minor
> changes, is that still the sbc?
>
> I think the compatible should be "qcom,apq8064-db600c",
> "qcom,apq8064-sbc", "qcom,apq8064"
>
>

I really hope that people don't keep using the qcom bootloader dtb
picking design if they make a new product based off qcom boards with a
slight variation. They should replace the vendor part of the compatible
anyway with their own vendor prefix, and then the bootloader would need
to be updated to look for that string or something else. I really don't
want to get in the business of updating dtbTool for all the non-qcom
designs that pop up because they keep using the qcom dtb identification
scheme. It almost doesn't scale right now and that's just qcom designs.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
