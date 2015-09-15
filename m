From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND 5/5] mfd: arizona: Update DT doc for new mic
 detection bindings
Date: Tue, 15 Sep 2015 13:10:40 +0900
Message-ID: <55F79A40.2070004@samsung.com>
References: <1441787690-30148-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441787690-30148-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <55F2884A.5000707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55F2884A.5000707-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 09=EC=9B=94 11=EC=9D=BC 16:52, Chanwoo Choi wrote:
> On 2015=EB=85=84 09=EC=9B=94 09=EC=9D=BC 17:34, Charles Keepax wrote:
>> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/arizona.txt |   21 ++++++++++=
+++++++++++
>>  include/dt-bindings/mfd/arizona.h                 |    5 +++++
>>  2 files changed, 26 insertions(+), 0 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Doc=
umentation/devicetree/bindings/mfd/arizona.txt
>> index a8fee60..b98a11b 100644
>> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
>> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
>> @@ -73,6 +73,27 @@ Optional properties:
>>      If this node is not mentioned or if the value is unknown, then
>>      headphone detection mode is set to HPDETL.
>> =20
>> +  - wlf,micd-software-compare : Use a software comparison to determ=
ine mic
>> +    presence
>> +  - wlf,micd-detect-debounce : Additional software microphone detec=
tion
>> +    debounce specified in milliseconds.
>> +  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the=
 headset
>> +    polarity if one exists.
>> +  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup =
prior to
>> +    performing microphone detection, specified as per the ARIZONA_M=
ICD_TIME_XXX
>> +    defines.
>> +  - wlf,micd-rate : Delay between successive microphone detection m=
easurements,
>> +    specified as per the ARIZONA_MICD_TIME_XXX defines.
>> +  - wlf,micd-dbtime : Microphone detection hardware debounces speci=
fied as the
>> +    number of measurements to take, valid values being 2 and 4.
>> +  - wlf,micd-timeout : Timeout for microphone detection, specified =
in
>> +    milliseconds.
>> +  - wlf,micd-force-micbias : Force MICBIAS continuously on during m=
icrophone
>> +    detection.
>> +
>> +  - wlf,gpsw : Settings for the general purpose switch, set as one =
of the
>> +    ARIZONA_GPSW_XXX defines.
>> +
>>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be s=
pecified if
>>      they are being externally supplied. As covered in
>>      Documentation/devicetree/bindings/regulator/regulator.txt
>> diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings=
/mfd/arizona.h
>> index c40f665..dedf46f 100644
>> --- a/include/dt-bindings/mfd/arizona.h
>> +++ b/include/dt-bindings/mfd/arizona.h
>> @@ -110,4 +110,9 @@
>>  #define ARIZONA_ACCDET_MODE_HPM 4
>>  #define ARIZONA_ACCDET_MODE_ADC 7
>> =20
>> +#define ARIZONA_GPSW_OPEN           0
>> +#define ARIZONA_GPSW_CLOSED         1
>> +#define ARIZONA_GPSW_CLAMP_ENABLED  2
>> +#define ARIZONA_GPSW_CLAMP_DISABLED 3
>> +
>>  #endif
>>
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
> You may need the ack message by DT maintainer.

I think that you need to add the patch description for this patch.

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
