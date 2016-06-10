From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv2 2/8] MAINTAINERS: Add Altera Arria10 System Resource
 Chip
Date: Fri, 10 Jun 2016 13:09:14 -0500
Message-ID: <575B024A.7000208@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-3-git-send-email-tthayer@opensource.altera.com>
 <20160610144714.GF1537@dell>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160610144714.GF1537@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 06/10/2016 09:47 AM, Lee Jones wrote:
> On Thu, 02 Jun 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add maintainer for the Altera Arria10 Max5 System Resource chip files.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> Acked-by: Lee Jones <lee.jones@linaro.org>i
>> ---
>> v2  Remove altera-a10sr-hwmon.c file.
>> ---
>>   MAINTAINERS |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4f74a5f..7683240 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -607,6 +607,13 @@ L:	linux-gpio@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/gpio/gpio-altera.c
>>
>> +ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
>> +M:	Thor Thayer <tthayer@opensource.altera.com>
>> +S:	Maintained
>> +F:	drivers/gpio/gpio-altera-a10sr.c
>> +F:	drivers/mfd/altera-a10sr.c
>> +F:	include/linux/mfd/altera-a10sr.h
>
> When will you upstream the other drivers?
>
I'm finishing up some EDAC drivers right now then I'll start looking at 
adding the other drivers. I should have something in August because of 
vacation interruptions.

Thanks again!

>>   ALTERA TRIPLE SPEED ETHERNET DRIVER
>>   M:	Vince Bridgers <vbridger@opensource.altera.com>
>>   L:	netdev@vger.kernel.org
>
