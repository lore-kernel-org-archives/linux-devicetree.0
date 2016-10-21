From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Fri, 21 Oct 2016 12:33:40 +0200
Message-ID: <2349770.MVMXr64OoI@wuerfel>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday, October 20, 2016 7:36:22 PM CEST Imran Khan wrote:
> +#include <linux/soc/qcom/socinfo.h>
> +#include <linux/soc/qcom/smem.h>
> +
> +#include <asm/system_misc.h>

I don't see anything here that needs asm/system_misc.h

> +const char *hw_platform[] = {
> +	[HW_PLATFORM_UNKNOWN] = "Unknown",
> +	[HW_PLATFORM_SURF] = "Surf",
> +	[HW_PLATFORM_FFA] = "FFA",
> +	[HW_PLATFORM_FLUID] = "Fluid",
> +};
> +
> +const char *qrd_hw_platform_subtype[] = {
> +	[PLATFORM_SUBTYPE_QRD] = "QRD",
> +	[PLATFORM_SUBTYPE_SKUAA] = "SKUAA",
> +};
> +
> +const char *hw_platform_subtype[] = {
> +	[PLATFORM_SUBTYPE_UNKNOWN] = "Unknown",
> +};


Make these all static

> +
> +/* Used to parse shared memory. Must match the modem. */
> +struct socinfo_v0_1 {
> +	uint32_t format;
> +	uint32_t id;
> +	uint32_t version;

s/uint32_t/u32/

> +
> +uint32_t socinfo_get_id(void)
> +{
> +	return (socinfo) ? socinfo->v0_1.id : 0;
> +}
> +EXPORT_SYMBOL_GPL(socinfo_get_id);
> +
> +uint32_t socinfo_get_version(void)
> +{
> +	return (socinfo) ? socinfo->v0_1.version : 0;
> +}
> +EXPORT_SYMBOL_GPL(socinfo_get_version);
> +
> +char *socinfo_get_build_id(void)
> +{
> +	return (socinfo) ? socinfo->v0_1.build_id : NULL;
> +}
> +EXPORT_SYMBOL_GPL(socinfo_get_build_id);

Please remove all the exports and mark the functions static,
we don't want any drivers poking vendor-specific interfaces
for this.

> +/* socinfo: sysfs functions */

This seems overly verbose, having both raw and human-readable
IDs is generally not necessary, pick one of the two. If you
need any fields that we don't already support in soc_device,
let's talk about adding them to the generic structure.


> +static ssize_t
> +qcom_get_image_version(struct device *dev,
> +			struct device_attribute *attr,
> +			char *buf)
> +{
> +	char *string_address;
> +
> +	string_address = socinfo_get_image_version_base_address(dev);
> +	if (IS_ERR_OR_NULL(string_address)) {

IS_ERR_OR_NULL() indicates that your interface is not well-designed.
Please return either NULL on all failures, or return an error pointer
on all failures, not both.

> +/* Platform Subtype String is being deprecated. Use Platform
> + * Subtype ID instead.
> + */

If it's deprecated, don't add it to the kernel!


> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> new file mode 100644
> index 0000000..17ca50a
> --- /dev/null
> +++ b/include/linux/soc/qcom/socinfo.h

Merge the header file into the driver.

	Arnd
