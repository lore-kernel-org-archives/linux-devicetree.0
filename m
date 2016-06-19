From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 23:36:19 +0200
Message-ID: <ecb7950d-9e07-5c5d-6668-1c67ba170ddf@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <20160618235634.GD29476@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20160618235634.GD29476@makrotopia.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Daniel Golle <daniel@makrotopia.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, richard@nod.at, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On 06/19/2016 01:56 AM, Daniel Golle wrote:
> Hi!
> 
> I got some remarks here:
> 
> On Sat, Jun 18, 2016 at 09:17:55PM +0200, Hauke Mehrtens wrote:
>> This makes it possible to open a ubi layer in device tree, this is
>> helpful when the rootfs is on a ubi layer. It loops though all mtd
>> partitions and mounts the partition which is compatible with
>> "ubi,volume". The same was only possible with kernel command line
>> arguments before.
> 
> Strictly speaking this doesn't describe what this change does.
> Rather than mounting anything you are creating ubiblock devices...
> 
> More comments in-line.
> 
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/ubi.txt b/Documentation/devicetree/bindings/mtd/ubi.txt
>> new file mode 100644
>> index 0000000..5fcd47e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/ubi.txt
>> @@ -0,0 +1,33 @@
>> +UBI - Unsorted block images
>> +
>> +Describe of a UBI layer in device tree.
>> +
>> + - compatible:		"ubi,device", This marks a partition that contains
>> + 			a ubi layer.
>> + - vid_hdr_offs:	Optional parameter specifies UBI VID header position
>> + 			to be used by UBI. (default value if 0)
>> + - max_beb_per1024:	Optional parameter specifies the maximum expected bad
>> + 			eraseblock per 1024 eraseblocks.
>> + 			(default value CONFIG_MTD_UBI_BEB_LIMIT)
>> + -ubi_num:		Optional parameter specifies UBI device number
>> + 			which have to be assigned to the newly created UBI
>> + 			device (assigned automatically by default)
>> +
>> +Example:
>> +
>> +partitions {
>> +	compatible = "fixed-partitions";
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +
>> +	partition@0 {
>> +		label = "uboot";
>> +		reg = <0x00000 0x100000>;
>> +	};
>> +
>> +	partition@1c0000 {
>> +		label = "system_sw";
>> +		reg = <0x1c0000 0xc800000>;
>> +		compatible = "ubi,device";
>> +	};
>> +};
> 
> Similar to the other patch, the example in the documentation is
> swapped and doesn't match with the code added by the patch.
> 
> 
> 
>> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
>> index ebf46ad..5ed390d 100644
>> --- a/drivers/mtd/ubi/block.c
>> +++ b/drivers/mtd/ubi/block.c
> 
> Wait a moment: What about ubifs being the root filesystem? That
> doesn't need a ubiblock device to be created...

Should I write an error message and do nothing when this is a ubifs
partition?

>> @@ -1,6 +1,7 @@
>>  /*
>>   * Copyright (c) 2014 Ezequiel Garcia
>>   * Copyright (c) 2011 Free Electrons
>> + * Copyright (c) 2016 Hauke Mehrtens <hauke@hauke-m.de>
>>   *
>>   * Driver parameter handling strongly based on drivers/mtd/ubi/build.c
>>   *   Copyright (c) International Business Machines Corp., 2006
>> @@ -41,6 +42,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>>  #include <linux/mutex.h>
>> +#include <linux/of.h>
>>  #include <linux/slab.h>
>>  #include <linux/mtd/ubi.h>
>>  #include <linux/workqueue.h>
>> @@ -628,6 +630,64 @@ static void __init ubiblock_create_from_param(void)
>>  	}
>>  }
>>  
>> +static void __init ubiblock_create_from_device_tree(void)
>> +{
>> +	int ubi_num;
>> +	const char *name;
>> +	u32 mode;
>> +	struct ubi_device *ubi;
>> +	struct ubi_volume_desc *desc;
>> +	struct ubi_volume_info vi;
>> +	struct mtd_info *mtd;
>> +	struct device_node *volume;
>> +	int ret;
>> +
>> +	for (ubi_num = 0; ubi_num < UBI_MAX_DEVICES; ubi_num++) {
>> +		ubi = ubi_get_device(ubi_num);
>> +		if (!ubi)
>> +			continue;
>> +		mtd = ubi->mtd;
>> +		if (!mtd || !of_device_is_compatible(mtd->dev.of_node,
>> +						     "ubi,device")) {
>> +			ubi_put_device(ubi);
>> +			continue;
>> +		}
>> +
>> +		for_each_child_of_node(mtd->dev.of_node, volume) {
>> +			if (!of_device_is_compatible(volume, "ubi,volume"))
>> +				continue;
>> +
>> +			ret = of_property_read_string(volume, "name", &name);
>> +			if (ret)
>> +				continue;
>> +
>> +			ret = of_property_read_u32(volume, "ubi-mode", &mode);
>> +			if (ret)
>> +				continue;
>> +
>> +			desc = ubi_open_volume_nm(ubi_num, name, mode);
>> +			if (IS_ERR(desc)) {
>> +				pr_err(
>> +				       "UBI: block: can't open volume %s on ubi%d, err=%ld",
>> +				       name, ubi_num, PTR_ERR(desc));
>> +				continue;
>> +			}
>> +
>> +			ubi_get_volume_info(desc, &vi);
>> +			ubi_close_volume(desc);
>> +
>> +			ret = ubiblock_create(&vi);
>> +			if (ret) {
>> +				pr_err(
>> +				       "UBI: block: can't add '%s' volume on ubi%d, err=%d",
>> +				       vi.name, ubi_num, ret);
>> +				continue;
>> +			}
>> +		}
>> +		ubi_put_device(ubi);
>> +	}
>> +}
>> +
>>  static void ubiblock_remove_all(void)
>>  {
>>  	struct ubiblock *next;
>> @@ -658,6 +718,9 @@ int __init ubiblock_init(void)
>>  	 */
>>  	ubiblock_create_from_param();
>>  
>> +	/* Attach block devices from device tree */
>> +	ubiblock_create_from_device_tree();
>> +
> 
> Probably you also want to set ROOT_DEV similar to what we currently
> do in
> 
> https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch
> 
>>  	/*
>>  	 * Block devices are only created upon user requests, so we ignore
>>  	 * existing volumes.
>> -- 
>> 2.8.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
