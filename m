From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V3 PATCH 6/7] arm64: dts: msm8994 default serial config
Date: Fri, 21 Oct 2016 01:42:01 -0700
Message-ID: <3e68d7be-07b9-05c6-2419-3a4579898a72@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-7-git-send-email-jeremymc@redhat.com>
 <20161012132806.GA21050@remoulade>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161012132806.GA21050@remoulade>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-12 6:28 AM, Mark Rutland wrote:
> On Wed, Oct 12, 2016 at 02:37:33AM -0700, Jeremy McNicoll wrote:
>> From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> As per Documentation/devicetree/bindings/chosen.txt so that we
>> are not relying on implicit defaults.
>
> Please fold this patch into the patch introducing the dts file.
>
> There's no need for this to be separate.

agreed.

-jeremy

>
> Thanks,
> Mark.
>
>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>> index 5cff29f..799aec0 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>> @@ -27,7 +27,7 @@
>>  	};
>>
>>  	chosen {
>> -		stdout-path = "serial0";
>> +		stdout-path = "serial0:115200n8";
>>  	};
>>
>>  	soc {
>> --
>> 2.6.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
