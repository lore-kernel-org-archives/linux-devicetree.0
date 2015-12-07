From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: arizona: Update naming for micd-timeout DT to
 include units
Date: Mon, 07 Dec 2015 10:31:10 +0900
Message-ID: <5664E15E.7040400@samsung.com>
References: <1448290290-19267-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151204210040.GC822@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151204210040.GC822@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On 2015=EB=85=84 12=EC=9B=94 05=EC=9D=BC 06:00, Pavel Machek wrote:
> On Mon 2015-11-23 14:51:30, Charles Keepax wrote:
>> Add time units of -ms (milliseconds) to wlf,micd-timeout.
>>
>> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>> ---
>>  .../devicetree/bindings/extcon/extcon-arizona.txt  |    2 +-
>>  drivers/extcon/extcon-arizona.c                    |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona=
=2Etxt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>> index da9813b..05d85ac 100644
>> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>> @@ -33,7 +33,7 @@ Optional properties:
>>      specified as per the ARIZONA_MICD_TIME_XXX defines.
>>    - wlf,micd-dbtime : Microphone detection hardware debounces speci=
fied as the
>>      number of measurements to take, valid values being 2 and 4.
>> -  - wlf,micd-timeout : Timeout for microphone detection, specified =
in
>> +  - wlf,micd-timeout-ms : Timeout for microphone detection, specifi=
ed in
>>      milliseconds.
>>    - wlf,micd-force-micbias : Force MICBIAS continuously on during m=
icrophone
>>      detection.
>> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon=
-arizona.c
>> index c377030..8647533 100644
>> --- a/drivers/extcon/extcon-arizona.c
>> +++ b/drivers/extcon/extcon-arizona.c
>> @@ -1230,7 +1230,7 @@ static int arizona_extcon_device_get_pdata(str=
uct arizona *arizona)
>>  	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
>>  				 &pdata->micd_dbtime);
>> =20
>> -	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
>> +	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
>>  				 &pdata->micd_timeout);
>> =20
>>  	pdata->micd_force_micbias =3D
> device_property_read_bool(arizona->dev,
>=20
> While the change is nice, new kernel is supposed to work with old
> DTS. So you'd need to check for both properties here..

This is new DT option. There are no dtbs usingt this property
in latest kernel. So, ther is no issue.

Thanks,
Chanwoo Choi
