From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: hisilicon: add bindings for
 hi3798cv200 SoC and Poplar board
Date: Mon, 27 Feb 2017 09:24:34 +0800
Message-ID: <798bfd0e-bd8d-a75d-e841-53d82b513f94@hisilicon.com>
References: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
 <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
 <ef8cca92-7f1f-40bd-4023-2e64dcf69a68@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ef8cca92-7f1f-40bd-4023-2e64dcf69a68-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.gregotski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On 2017/2/26 9:32, Andreas Färber wrote:
> Am 22.02.2017 um 09:38 schrieb Jiancheng Xue:
>> Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.
>>
>> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> index f1c1e21..1fd3dd7 100644
>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> @@ -4,6 +4,10 @@ Hi3660 SoC
>>  Required root node properties:
>>  	- compatible = "hisilicon,hi3660";
>>  
>> +Hi3798cv200 Poplar Board
>> +Required root node properties:
>> +	- compatible = "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798cv200";
> 
> Please remember to CC previous reviewers.
> 
Sorry for that.

> This still looks wrong: Why is this not "hisilicon,poplar" if you choose
> against "tocoding,poplar"? 

I didn't think it was very important thing whether the compatbile string contained
a preceding SoC name or not. I just referred to the hikey board and some other
HiSilicon boards. I wanted to keep using the same rule with them.

> Is there a second Poplar board with a different SoC? 

I can't tell about this now.

> Even then it would be redundant with the second
> compatible string.
> 
The second compatilbe string can be removed here. Thanks.

Regards,
Jiancheng

> Regards,
> Andreas
> 
>> +
>>  Hi4511 Board
>>  Required root node properties:
>>  	- compatible = "hisilicon,hi3620-hi4511";
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
