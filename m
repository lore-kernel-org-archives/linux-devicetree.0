From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 5/6] arm64: arch_timer: apci: Introduce a generic
 aquirk framework for erratum
Date: Mon, 14 Nov 2016 19:15:36 +0800
Message-ID: <f796cd8f-1d96-ab3b-ca53-5d746c51eec2@huawei.com>
References: <1478264794-14652-1-git-send-email-dingtianhong@huawei.com>
 <1478264794-14652-5-git-send-email-dingtianhong@huawei.com>
 <582971E0.4070403@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582971E0.4070403-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

OK, will wait more feedback and fix them together in the next version.

Thanks.
Ding

On 2016/11/14 16:12, Hanjun Guo wrote:
> On 2016/11/4 21:06, Ding Tianhong wrote:
>> From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Introduce a general quirk framework for each timer erratum in ACPI,
>> which use the oem information in GTDT table for platform specific erratums.
>> The struct gtdt_arch_timer_fixup is introduced to record the oem
>> information to match the quirk and handle the erratum.
>>
>> v3: Introduce a generic aquick framework for erratum in ACPI mode.
>>
>> Signed-off-by: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clocksource/arm_arch_timer.c | 37 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
>> index 3d59af1..9bc93e5 100644
>> --- a/drivers/clocksource/arm_arch_timer.c
>> +++ b/drivers/clocksource/arm_arch_timer.c
>> @@ -1068,6 +1068,40 @@ CLOCKSOURCE_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem",
>>  		       arch_timer_mem_init);
>>  
>>  #ifdef CONFIG_ACPI
>> +struct gtdt_arch_timer_fixup {
>> +	char oem_id[ACPI_OEM_ID_SIZE];
>> +	char oem_table_id[ACPI_OEM_TABLE_ID_SIZE];
>> +	u32 oem_revision;
>> +
>> +	/* quirk handler for arch timer erratum */
>> +	void (*handler)(u32 erratum);
>> +	u32 erratum;
> 
> Hmm, I think we just use
> 
> void *context;
> 
> and we convert it in the platform specific handler, then this struct
> can be reused for other type of quirks.
> 
>> +};
>> +
>> +/* note: this needs to be updated according to the doc of OEM ID
>> + * and TABLE ID for different board.
>> + */
>> +struct gtdt_arch_timer_fixup arch_timer_quirks[] __initdata = {
>> +};
>> +
>> +void __init arch_timer_acpi_quirks_handler(char *oem_id,
>> +						  char *oem_table_id,
>> +						  u32 oem_revision)
>> +{
>> +	struct gtdt_arch_timer_fixup *quirks = arch_timer_quirks;
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(arch_timer_quirks); i++, quirks++) {
>> +		if (!memcmp(quirks->oem_id, oem_id, ACPI_OEM_ID_SIZE) &&
>> +		    !memcmp(quirks->oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE) &&
>> +		    quirks->oem_revision == oem_revision) {
>> +			if (quirks->handler && quirks->erratum)
>> +				quirks->handler(quirks->erratum);
>> +			break;
> 
> we can't just break because we have multi quirks for different handlers.
> 
> Thanks
> Hanjun
> 
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
