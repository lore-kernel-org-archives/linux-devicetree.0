From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] dt-bindings: qcom: clocks: Add msm8994 clock bindings
Date: Wed, 2 Nov 2016 17:01:43 -0700
Message-ID: <b8aa5e01-cdc1-be9e-9852-1f056d75addf@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-3-git-send-email-jeremymc@redhat.com>
 <20161028000811.GI26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028000811.GI26139-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-27 5:08 PM, Stephen Boyd wrote:
> On 10/25, Jeremy McNicoll wrote:
>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,gcc.txt         |   2 +
>>  include/dt-bindings/clock/qcom,gcc-msm8994.h       | 145 +++++++++++++++++++++
>>  2 files changed, 147 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index 3cf4421..58c7e76 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -14,6 +14,8 @@ Required properties :
>>  			"qcom,gcc-msm8974"
>>  			"qcom,gcc-msm8974pro"
>>  			"qcom,gcc-msm8974pro-ac"
>> +			"qcom,gcc-msm8994"
>> +			"qcom,gcc-msm8994v2"
>
> Just drop the v2 and treat it like gcc-msm8994.


Right got it, so the 8994v2 is really the 8994.

-jeremy
>
>>  			"qcom,gcc-msm8996"
>>  			"qcom,gcc-mdm9615"
>>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
