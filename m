From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: msm8996-pcie-phy: Add support to msm8996 pcie
 phy
Date: Fri, 16 Sep 2016 17:48:08 +0100
Message-ID: <2296a3a9-164a-c46c-ef98-2bd2d97039c8@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-3-git-send-email-srinivas.kandagatla@linaro.org>
 <57D82403.9080004@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D82403.9080004-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 13/09/16 17:06, Archit Taneja wrote:
>
>
> On 9/7/2016 4:25 PM, Srinivas Kandagatla wrote:
>> This patch adds support to msm8996 pcie phy which supports 3 ports,
>> Port A, Port B and Port C.
>>
>> Each port is independent and connected to a pcie host controller,
>> there is
>> also a common block which is shared across all the 3 ports.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   drivers/phy/Kconfig                 |   7 +
>>   drivers/phy/Makefile                |   1 +
>>   drivers/phy/phy-qcom-msm8996-pcie.c | 492
>> ++++++++++++++++++++++++++++++++++++

>> +#define PCIE_LANE_PCS_BASE 0x1400
>
> I've seen the reg offsets of another SoC using the same
> IP, but the above offsets aren't the same relative to the
> phy base. We might want to create more reg properties in
> DT to accommodate register maps on other SoCs.

Yep, I got some more info on this from Vivek and It looks like this IP 
has been reused on other Host controllers and SOCs.
So plan is to write a common driver for all of them.

Thanks,
srini
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
