From: Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Tue, 25 Oct 2016 15:08:15 +0530
Message-ID: <ca9f0440-2086-c9bb-104c-5c38c0f741e5@codeaurora.org>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <20161020152017.GE3145@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161020152017.GE3145@hector.attlocal.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/20/2016 8:50 PM, Andy Gross wrote:
> On Thu, Oct 20, 2016 at 07:36:22PM +0530, Imran Khan wrote:
>> The SoC info driver provides information such as Chip ID,
>> Chip family, serial number and other such details about
>> Qualcomm SoCs.
>>
>> Signed-off-by: Imran Khan <kimran@codeaurora.org>
>> ---
>>  .../devicetree/bindings/soc/qcom/qcom,socinfo.txt  |   18 +
>>  drivers/soc/qcom/socinfo.c                         | 1173 ++++++++++++++++++++
> 
> 1173 lines!!!!!!  To latch smem entry and read/process those contents?
> 
The number of code lines will be reduced once we remove the function to setup dummy socinfo.
Also I will try to remove redundant sysfs attributes.

>>  include/linux/soc/qcom/socinfo.h                   |  198 ++++
>>  3 files changed, 1389 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
>>  create mode 100644 drivers/soc/qcom/socinfo.c
>>  create mode 100644 include/linux/soc/qcom/socinfo.h
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
>> new file mode 100644
>> index 0000000..1f26299
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,socinfo.txt
>> @@ -0,0 +1,18 @@
>> +Qualcomm SoC Information (socinfo) Driver binding
>> +
>> +This binding describes the Qualcomm SoC Information Driver, which provides
>> +information such as chip id, chip family, serial number and other such
>> +details about Qualcomm SoCs.
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qcom,socinfo"
>> +
>> += EXAMPLE
>> +
>> +The following example represents a socinfo node.
>> +
>> +	socinfo {
>> +		compatible = "qcom,socinfo";
>> +	};
> 
> Let's drop adding a new binding.  Let's roll this into the smem driver itself.
> 
Okay. I will move the socinfo setup part to smem and will keep only socinfo sysfs related
stuff in this file.
>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>> new file mode 100644
>> index 0000000..dc26028
>> --- /dev/null
>> +++ b/drivers/soc/qcom/socinfo.c
>> @@ -0,0 +1,1173 @@
>> +/*
>> + * Copyright (c) 2009-2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +/*
>> + * SOC Info Routines
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) "%s: " fmt, __func__
>> +
>> +#include <linux/export.h>
>> +#include <linux/module.h>
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/sys_soc.h>
>> +#include <linux/slab.h>
>> +#include <linux/stat.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
>> +#include <linux/soc/qcom/socinfo.h>
>> +#include <linux/soc/qcom/smem.h>
>> +
>> +#include <asm/system_misc.h>
>> +
>> +
>> +#define BUILD_ID_LENGTH 32
> 
> This needs to be more specific.  SMEM_SOCINFO_XXX
> 
>> +#define SMEM_IMAGE_VERSION_BLOCKS_COUNT 32
>> +#define SMEM_IMAGE_VERSION_SINGLE_BLOCK_SIZE 128
>> +#define SMEM_IMAGE_VERSION_SIZE 4096
>> +#define SMEM_IMAGE_VERSION_NAME_SIZE 75
>> +#define SMEM_IMAGE_VERSION_VARIANT_SIZE 20
>> +#define SMEM_IMAGE_VERSION_VARIANT_OFFSET 75
>> +#define SMEM_IMAGE_VERSION_OEM_SIZE 32
>> +#define SMEM_IMAGE_VERSION_OEM_OFFSET 96
>> +#define SMEM_IMAGE_VERSION_PARTITION_APPS 10
>> +#define SMEM_ITEM_SIZE_ALIGN 8
>> +/*
>> + * Shared memory identifiers, used to acquire handles to respective memory
>> + * region.
>> + */
>> +#define SMEM_IMAGE_VERSION_TABLE	469
>> +#define SMEM_HW_SW_BUILD_ID		137
>> +
> 
> <snip>
> 
>> +static enum qcom_cpu cur_cpu;
>> +static int current_image;
>> +static uint32_t socinfo_format;
>> +
>> +static struct socinfo_v0_1 dummy_socinfo = {
>> +	.format = SOCINFO_VERSION(0, 1),
>> +	.version = 1,
>> +};
> 
> Instead of having a dummy, can we just fail if we don't find a match?  And by
> fail, I mean having an 'unknown' cpu?
> 
>> +
>> +static char *socinfo_get_id_string(void)
>> +{
>> +	return (socinfo) ? cpu_of_id[socinfo->v0_1.id].soc_id_string : NULL;
>> +}
>> +
> 
> <snip>
> 
>> +uint32_t socinfo_get_id(void)
>> +{
>> +	return (socinfo) ? socinfo->v0_1.id : 0;
>> +}
>> +EXPORT_SYMBOL_GPL(socinfo_get_id);
> 
> Why do we have EXPORTS at all?  Drivers should be using compatibles to figure
> out what they are.
> 
> <snip>
> 
Okay. 
>> +/* socinfo: sysfs functions */
>> +
>> +static ssize_t
>> +qcom_get_vendor(struct device *dev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	return snprintf(buf, PAGE_SIZE, "Qualcomm\n");
>> +}
>> +
>> +static ssize_t
>> +qcom_get_raw_id(struct device *dev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	return snprintf(buf, PAGE_SIZE, "%u\n",
>> +		socinfo_get_raw_id());
>> +}
>> +
> 
> <snip>
> 
>> +static void * __init setup_dummy_socinfo(void)
>> +{
>> +	if (early_machine_is_apq8064()) {
>> +		dummy_socinfo.id = APQ_8064_ID;
>> +		strlcpy(dummy_socinfo.build_id, "apq8064",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_apq8084()) {
>> +		dummy_socinfo.id = APQ_8084_ID;
>> +		strlcpy(dummy_socinfo.build_id, "apq8084",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_msm8916()) {
>> +		dummy_socinfo.id = MSM_8916_ID;
>> +		strlcpy(dummy_socinfo.build_id, "msm8916",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_msm8660()) {
>> +		dummy_socinfo.id = MSM_8660A_ID;
>> +		strlcpy(dummy_socinfo.build_id, "msm8660",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_msm8960()) {
>> +		dummy_socinfo.id = MSM_8960_ID;
>> +		strlcpy(dummy_socinfo.build_id, "msm8960",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_msm8974()) {
>> +		dummy_socinfo.id = MSM_8974_ID;
>> +		strlcpy(dummy_socinfo.build_id, "msm8974",
>> +			sizeof(dummy_socinfo.build_id));
>> +	} else if (early_machine_is_msm8996()) {
>> +		dummy_socinfo.id = MSM_8996_ID;
>> +		strlcpy(dummy_socinfo.build_id, "msm8996",
>> +			sizeof(dummy_socinfo.build_id));
>> +	}
>> +
>> +	strlcat(dummy_socinfo.build_id, "Dummy socinfo",
>> +		sizeof(dummy_socinfo.build_id));
>> +	return (void *) &dummy_socinfo;
>> +}
> 
> Can we just remove this and just return whatever unknown values for the sysfs
> entries?
> 
Will shorten this function. In case of error I will use 0 as socid and "unknown CPU"
as soc-id.
>> +
>> +static void socinfo_populate_sysfs_files(struct device *qcom_soc_device)
>> +{
>> +	device_create_file(qcom_soc_device, &qcom_soc_attr_vendor);
>> +	device_create_file(qcom_soc_device, &image_version);
>> +	device_create_file(qcom_soc_device, &image_variant);
>> +	device_create_file(qcom_soc_device, &image_crm_version);
>> +	device_create_file(qcom_soc_device, &select_image);
>> +	device_create_file(qcom_soc_device, &images);
>> +
>> +	switch (socinfo_format) {
>> +	case SOCINFO_VERSION(0, 12):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_chip_family);
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_raw_device_family);
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_raw_device_number);
>> +	case SOCINFO_VERSION(0, 11):
>> +	case SOCINFO_VERSION(0, 10):
>> +		 device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_serial_number);
>> +	case SOCINFO_VERSION(0, 9):
>> +		 device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_foundry_id);
>> +	case SOCINFO_VERSION(0, 8):
>> +	case SOCINFO_VERSION(0, 7):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_pmic_model);
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_pmic_die_revision);
>> +	case SOCINFO_VERSION(0, 6):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_platform_subtype);
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_platform_subtype_id);
>> +	case SOCINFO_VERSION(0, 5):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_accessory_chip);
>> +	case SOCINFO_VERSION(0, 4):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_platform_version);
>> +	case SOCINFO_VERSION(0, 3):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_hw_platform);
>> +	case SOCINFO_VERSION(0, 2):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_raw_id);
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_raw_version);
>> +	case SOCINFO_VERSION(0, 1):
>> +		device_create_file(qcom_soc_device,
>> +					&qcom_soc_attr_build_id);
>> +		break;
>> +	default:
>> +		pr_err("Unknown socinfo format: v%u.%u\n",
>> +				SOCINFO_VERSION_MAJOR(socinfo_format),
>> +				SOCINFO_VERSION_MINOR(socinfo_format));
>> +		break;
>> +	}
>> +}
>> +
> 
> <snip>
> 
>> +static int qcom_socinfo_probe(struct platform_device *pdev)
>> +{
>> +	size_t size;
>> +
>> +	socinfo = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID,
>> +			&size);
>> +	if (IS_ERR_OR_NULL(socinfo)) {
>> +		if (PTR_ERR(socinfo) == -EPROBE_DEFER)
>> +			return PTR_ERR(socinfo);
>> +		else {
>> +			dev_warn(&pdev->dev,
>> +				"Can't find SMEM_HW_SW_BUILD_ID; falling back on dummy values.\n");
>> +			socinfo = setup_dummy_socinfo();
>> +		}
>> +	}
>> +
>> +	socinfo_select_format();
>> +
>> +	WARN(!socinfo_get_id(), "Unknown SOC ID!\n");
>> +
>> +	if (socinfo_get_id() >= ARRAY_SIZE(cpu_of_id))
>> +		BUG_ON("New IDs added! ID => CPU mapping needs an update.\n");
>> +	else
>> +		cur_cpu = cpu_of_id[socinfo->v0_1.id].generic_soc_type;
>> +
>> +	socinfo_print();
>> +
>> +	socinfo_init_sysfs();
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id qcom_socinfo_of_match[] = {
>> +	{ .compatible = "qcom,socinfo" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_socinfo_of_match);
>> +
>> +static struct platform_driver qcom_socinfo_driver = {
>> +	.probe = qcom_socinfo_probe,
>> +	.driver  = {
>> +		.name  = "qcom-socinfo",
>> +		.of_match_table = qcom_socinfo_of_match,
>> +	},
>> +};
> 
> As mentioned above:
> Perhaps we can forgo the separate platform driver and just roll this into the
> smem driver that already exists.  You can create a device there and get the
> right attributes for the system and setup your sysfs entries.
> 
> Maybe splitting off the sysfs into a separate file would also be good.  That
> keeps it nice and clean and away from the main smem code.
> 
> 
Okay. I will move the socinfo setup part to smem and will keep only socinfo sysfs related
stuff in this file.
>> +module_platform_driver(qcom_socinfo_driver);
>> +
>> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
>> new file mode 100644
>> index 0000000..17ca50a
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/socinfo.h
>> @@ -0,0 +1,198 @@
>> +/*
>> + * Copyright (c) 2009-2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef _ARCH_ARM_MACH_MSM_SOCINFO_H_
>> +#define _ARCH_ARM_MACH_MSM_SOCINFO_H_
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/errno.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/of.h>
>> +
>> +#include <asm/cputype.h>
>> +/*
>> + * SOC version type with major number in the upper 16 bits and minor
>> + * number in the lower 16 bits.  For example:
>> + *   1.0 -> 0x00010000
>> + *   2.3 -> 0x00020003
>> + */
>> +#define SOCINFO_VERSION_MAJOR(ver) (((ver) & 0xffff0000) >> 16)
>> +#define SOCINFO_VERSION_MINOR(ver) ((ver) & 0x0000ffff)
>> +#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
>> +
>> +#ifdef CONFIG_OF
>> +#define early_machine_is_apq8064()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,apq8064")
>> +#define early_machine_is_apq8084()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,apq8084")
>> +#define early_machine_is_msm8916()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,msm8916")
>> +#define early_machine_is_msm8660()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,msm8660")
>> +#define early_machine_is_msm8960()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,msm8960")
>> +#define early_machine_is_msm8974()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,msm8974")
>> +#define early_machine_is_msm8996()	\
>> +	of_flat_dt_is_compatible(of_get_flat_dt_root(), "qcom,msm8996")
>> +#else
>> +#define early_machine_is_apq8064()	0
>> +#define early_machine_is_apq8084()	0
>> +#define early_machine_is_msm8916()	0
>> +#define early_machine_is_msm8660()	0
>> +#define early_machine_is_msm8960()	0
>> +#define early_machine_is_msm8974()	0
>> +#define early_machine_is_msm8996()	0
>> +#endif
> 
> You don't need this mess.  You could just build a compat match and match against
> the root compatible.
> 
Okay. As we don't intend to use dummy soc information, this part will become 
redundant and hence it will be removed.
>> +
>> +#define PLATFORM_SUBTYPE_MDM	1
>> +#define PLATFORM_SUBTYPE_INTERPOSERV3 2
>> +#define PLATFORM_SUBTYPE_SGLTE	6
>> +
> 
> <snip>
> 
>> +enum msm_cpu socinfo_get_msm_cpu(void);
>> +uint32_t socinfo_get_id(void);
>> +uint32_t socinfo_get_version(void);
>> +uint32_t socinfo_get_raw_id(void);
>> +char *socinfo_get_build_id(void);
>> +uint32_t socinfo_get_platform_type(void);
>> +uint32_t socinfo_get_platform_subtype(void);
>> +uint32_t socinfo_get_platform_version(void);
>> +uint32_t socinfo_get_serial_number(void);
>> +enum qcom_pmic_model socinfo_get_pmic_model(void);
>> +uint32_t socinfo_get_pmic_die_revision(void);
>> +int __init socinfo_init(void) __must_check;
> 
> We shouldn't have APIs for this.  This was supposed to be userspace access only,
> correct?
> 
Yes.I will remove these. Although if some driver needs some data pertaining to soc 
information, I will have to provide an alternate way for that but that can be done 
in a generic way rather than using vendor specific interface
> 
> Andy
> 


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a\nmember of the Code Aurora Forum, hosted by The Linux Foundation
