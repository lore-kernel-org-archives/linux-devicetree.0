From: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH] of: adding devres version of of_iomap
Date: Thu, 30 Aug 2012 15:31:02 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7041AD2CC@DFLE12.ent.ti.com>
References: <1346340581-21967-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1346340581-21967-1-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Please ignore this patch. I am re-sending this with a minor typo fixed.

Murali Karicheri
Software Design Engineer

>> -----Original Message-----
>> From: Karicheri, Muralidharan
>> Sent: Thursday, August 30, 2012 11:30 AM
>> To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org; devicetree-
>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Karicheri, Muralidharan
>> Subject: [PATCH] of: adding devres version of of_iomap
>> 
>> This adds devres version of the of_iomap() to allow resource to be cleaned
>> through devres.
>> 
>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>> 
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 7e262a6..d3da426 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -602,10 +602,9 @@ struct device_node
>> *of_find_matching_node_by_address(struct device_node *from,
>>  	return NULL;
>>  }
>> 
>> -
>>  /**
>>   * of_iomap - Maps the memory mapped IO for a given device_node
>> - * @device:	the device whose io range will be mapped
>> + * @device_node: Ptr to the device node that has the reg property
>>   * @index:	index of the io range
>>   *
>>   * Returns a pointer to the mapped memory
>> @@ -620,3 +619,26 @@ void __iomem *of_iomap(struct device_node *np, int index)
>>  	return ioremap(res.start, resource_size(&res));
>>  }
>>  EXPORT_SYMBOL(of_iomap);
>> +
>> +/**
>> + * of_devm_iomap - devres version of of_iomap
>> + * @device:	the device whose io range will be mapped
>> + * @index:	index of the io range
>> + *
>> + * Returns a pointer to the mapped memory
>> + */
>> +void __iomem *of_devm_iomap(struct device *dev, int index)
>> +{
>> +	struct device_node *np;
>> +	struct resource res;
>> +
>> +	if (!dev)
>> +		return NULL;
>> +
>> +	np = dev->of_node;
>> +	if (of_address_to_resource(np, index, &res))
>> +		return NULL;
>> +
>> +	return devm_ioremap(dev, res.start, resource_size(&res));
>> +}
>> +EXPORT_SYMBOL(of_devm_iomap);
>> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
>> index 01b925a..67efa5f 100644
>> --- a/include/linux/of_address.h
>> +++ b/include/linux/of_address.h
>> @@ -3,6 +3,7 @@
>>  #include <linux/ioport.h>
>>  #include <linux/errno.h>
>>  #include <linux/of.h>
>> +#include <linux/device.h>
>> 
>>  #ifdef CONFIG_OF_ADDRESS
>>  extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
>> @@ -13,6 +14,7 @@ extern struct device_node *of_find_matching_node_by_address(
>>  					const struct of_device_id *matches,
>>  					u64 base_address);
>>  extern void __iomem *of_iomap(struct device_node *device, int index);
>> +extern void __iomem *of_devm_iomap(struct device *dev, int index);
>> 
>>  /* Extract an address from a device, returns the region size and
>>   * the address space flags too. The PCI version uses a BAR number
>> --
>> 1.7.9.5
