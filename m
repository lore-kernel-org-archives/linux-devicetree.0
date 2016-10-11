From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V3 PATCH] dt-bindings: qcom: Add msm899(2/4) bindings
Date: Tue, 11 Oct 2016 14:25:06 -0700
Message-ID: <ab018442-c929-e328-11a3-6e7fd21e56b8@redhat.com>
References: <20161009012847.GG18158@rob-hp-laptop>
 <1476147156-4474-1-git-send-email-jeremymc@redhat.com>
 <20161011164207.GT7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161011164207.GT7509@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-11 9:42 AM, Bjorn Andersson wrote:
> On Mon 10 Oct 17:52 PDT 2016, Jeremy McNicoll wrote:
>
>> From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> V2->V3:
>>    Added 8994 and 8994v2
>>
>>
>>  Documentation/devicetree/bindings/arm/qcom.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
>> index 3e24518..a473989 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.txt
>> +++ b/Documentation/devicetree/bindings/arm/qcom.txt
>> @@ -22,6 +22,9 @@ The 'SoC' element must be one of the following strings:
>>  	msm8916
>>  	msm8974
>>  	msm8996
>> +	msm8992
>> +	msm8994
>
> Please keep these sorted.
>
>> +	msm8994v2
>
> What's different with v2? Why do we list it here?
>

I'll have to defer to QC folks on this one.

-jeremy

> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
