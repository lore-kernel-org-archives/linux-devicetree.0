From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv3 3/7] EDAC, altera: Share Arria10 check_deps & IRQ
 functions
Date: Fri, 17 Jun 2016 12:09:59 -0500
Message-ID: <57642EE7.4060109@opensource.altera.com>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-4-git-send-email-tthayer@opensource.altera.com>
 <20160617170050.GG3912@pd.tnic>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160617170050.GG3912@pd.tnic>
Sender: linux-doc-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 06/17/2016 12:00 PM, Borislav Petkov wrote:
> On Mon, Jun 13, 2016 at 04:19:08PM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> In preparation for additional memory module ECCs, the IRQ and
>> check_deps() functions are being made available to all the memory
>> buffers. Move them outside of the OCRAM only area.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2  New patch. Move shared functions outside OCRAM only area.
>> v3  Change title line - check_deps & IRQ.
>> ---
>>   drivers/edac/altera_edac.c |   62 ++++++++++++++++++++++++--------------------
>>   1 file changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>> index a9d8fa7..a3f490d 100644
>> --- a/drivers/edac/altera_edac.c
>> +++ b/drivers/edac/altera_edac.c
>> @@ -825,9 +825,9 @@ static struct platform_driver altr_edac_device_driver = {
>>   };
>>   module_platform_driver(altr_edac_device_driver);
>>
>> -/*********************** OCRAM EDAC Device Functions *********************/
>> +/******************* Arria10 Device ECC Shared Functions *****************/
>>
>> -#ifdef CONFIG_EDAC_ALTERA_OCRAM
>> +#if defined(CONFIG_EDAC_ALTERA_OCRAM) || defined(CONFIG_EDAC_ALTERA_ETHERNET)
>
> Do you need the ifdeffery here at all?
>
> IOW, can we leave this function compiled-in unconditionally?
>
Since each peripheral's EDAC can be individually selected, the build 
generates a warning of an unused function if just L2 cache was selected.

The ifdeffery is ugly but it removes that warning in the L2 only case.

Thanks for reviewing!

Thor
