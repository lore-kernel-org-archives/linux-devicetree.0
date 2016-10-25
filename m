From: Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Tue, 25 Oct 2016 15:23:34 +0530
Message-ID: <550ace3c-f2d3-6f3a-9566-cc1f83432484@codeaurora.org>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <2349770.MVMXr64OoI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2349770.MVMXr64OoI@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/21/2016 4:03 PM, Arnd Bergmann wrote:
> On Thursday, October 20, 2016 7:36:22 PM CEST Imran Khan wrote:
>> +#include <linux/soc/qcom/socinfo.h>
>> +#include <linux/soc/qcom/smem.h>
>> +
>> +#include <asm/system_misc.h>
> 
> I don't see anything here that needs asm/system_misc.h
> 

Okay. I will not use this header file here.

>> +const char *hw_platform[] = {
>> +	[HW_PLATFORM_UNKNOWN] = "Unknown",
>> +	[HW_PLATFORM_SURF] = "Surf",
>> +	[HW_PLATFORM_FFA] = "FFA",
>> +	[HW_PLATFORM_FLUID] = "Fluid",
>> +};
>> +
>> +const char *qrd_hw_platform_subtype[] = {
>> +	[PLATFORM_SUBTYPE_QRD] = "QRD",
>> +	[PLATFORM_SUBTYPE_SKUAA] = "SKUAA",
>> +};
>> +
>> +const char *hw_platform_subtype[] = {
>> +	[PLATFORM_SUBTYPE_UNKNOWN] = "Unknown",
>> +};
> 
> 
> Make these all static
> 

Okay. Will do this.

>> +
>> +/* Used to parse shared memory. Must match the modem. */
>> +struct socinfo_v0_1 {
>> +	uint32_t format;
>> +	uint32_t id;
>> +	uint32_t version;
> 
> s/uint32_t/u32/
>

Okay. Will do this.
 
>> +
>> +uint32_t socinfo_get_id(void)
>> +{
>> +	return (socinfo) ? socinfo->v0_1.id : 0;
>> +}
>> +EXPORT_SYMBOL_GPL(socinfo_get_id);
>> +
>> +uint32_t socinfo_get_version(void)
>> +{
>> +	return (socinfo) ? socinfo->v0_1.version : 0;
>> +}
>> +EXPORT_SYMBOL_GPL(socinfo_get_version);
>> +
>> +char *socinfo_get_build_id(void)
>> +{
>> +	return (socinfo) ? socinfo->v0_1.build_id : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(socinfo_get_build_id);
> 
> Please remove all the exports and mark the functions static,
> we don't want any drivers poking vendor-specific interfaces
> for this.
> 

Yes. I will avoid exporting vendor specific interface.

>> +/* socinfo: sysfs functions */
> 
> This seems overly verbose, having both raw and human-readable
> IDs is generally not necessary, pick one of the two. If you
> need any fields that we don't already support in soc_device,
> let's talk about adding them to the generic structure.
> 
> 

Okay. I will go for human readable IDs. Can we add 2 more fields
in the generic structure.
These 2 fields would be:

vendor: A string for vendor name
serial_number: A string containing serial number for the platform

>> +static ssize_t
>> +qcom_get_image_version(struct device *dev,
>> +			struct device_attribute *attr,
>> +			char *buf)
>> +{
>> +	char *string_address;
>> +
>> +	string_address = socinfo_get_image_version_base_address(dev);
>> +	if (IS_ERR_OR_NULL(string_address)) {
> 
> IS_ERR_OR_NULL() indicates that your interface is not well-designed.
> Please return either NULL on all failures, or return an error pointer
> on all failures, not both.
> 
>> +/* Platform Subtype String is being deprecated. Use Platform
>> + * Subtype ID instead.
>> + */
> 
> If it's deprecated, don't add it to the kernel!
> 
>

Okay.
 
>> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
>> new file mode 100644
>> index 0000000..17ca50a
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/socinfo.h
> 
> Merge the header file into the driver.
> 

okay.

> 	Arnd
> 


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a\nmember of the Code Aurora Forum, hosted by The Linux Foundation
