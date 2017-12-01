From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v4 3/8] MIPS: Octeon: Add a global resource manager.
Date: Thu, 30 Nov 2017 17:51:11 -0800
Message-ID: <a5e99796-154a-8950-3a38-4788f64fafa2@caviumnetworks.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-4-david.daney@cavium.com>
 <20171130225333.GI27409@jhogan-linux.mipstec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171130225333.GI27409@jhogan-linux.mipstec.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: James Hogan <james.hogan@mips.com>, David Daney <david.daney@cavium.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Steven J. Hill" <steven.hill@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On 11/30/2017 02:53 PM, James Hogan wrote:
> On Tue, Nov 28, 2017 at 04:55:35PM -0800, David Daney wrote:
>> From: Carlos Munoz <cmunoz@cavium.com>
>>
>> Add a global resource manager to manage tagged pointers within
>> bootmem allocated memory. This is used by various functional
>> blocks in the Octeon core like the FPA, Ethernet nexus, etc.
>>
>> Signed-off-by: Carlos Munoz <cmunoz@cavium.com>
>> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>   arch/mips/cavium-octeon/Makefile       |   3 +-
>>   arch/mips/cavium-octeon/resource-mgr.c | 371 +++++++++++++++++++++++++++++++++
>>   arch/mips/include/asm/octeon/octeon.h  |  18 ++
>>   3 files changed, 391 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/mips/cavium-octeon/resource-mgr.c
>>
>> diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
>> index 7c02e542959a..0a299ab8719f 100644
>> --- a/arch/mips/cavium-octeon/Makefile
>> +++ b/arch/mips/cavium-octeon/Makefile
>> @@ -9,7 +9,8 @@
>>   # Copyright (C) 2005-2009 Cavium Networks
>>   #
>>   
>> -obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
>> +obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o \
>> +	 resource-mgr.o
> 
> Maybe put that on a separate line like below.

OK

> 
>>   obj-y += dma-octeon.o
>>   obj-y += octeon-memcpy.o
>>   obj-y += executive/
>> diff --git a/arch/mips/cavium-octeon/resource-mgr.c b/arch/mips/cavium-octeon/resource-mgr.c
>> new file mode 100644
>> index 000000000000..ca25fa953402
>> --- /dev/null
>> +++ b/arch/mips/cavium-octeon/resource-mgr.c
>> @@ -0,0 +1,371 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Resource manager for Octeon.
>> + *
>> + * This file is subject to the terms and conditions of the GNU General Public
>> + * License.  See the file "COPYING" in the main directory of this archive
>> + * for more details.
>> + *
>> + * Copyright (C) 2017 Cavium, Inc.
>> + */
>> +#include <linux/module.h>
>> +
>> +#include <asm/octeon/octeon.h>
>> +#include <asm/octeon/cvmx-bootmem.h>
>> +
>> +#define RESOURCE_MGR_BLOCK_NAME		"cvmx-global-resources"
>> +#define MAX_RESOURCES			128
>> +#define INST_AVAILABLE			-88
>> +#define OWNER				0xbadc0de
>> +
>> +struct global_resource_entry {
>> +	struct global_resource_tag tag;
>> +	u64 phys_addr;
>> +	u64 size;
>> +};
>> +
>> +struct global_resources {
>> +#ifdef __LITTLE_ENDIAN_BITFIELD
>> +	u32 rlock;
>> +	u32 pad;
>> +#else
>> +	u32 pad;
>> +	u32 rlock;
>> +#endif
>> +	u64 entry_cnt;
>> +	struct global_resource_entry resource_entry[];
>> +};
>> +
>> +static struct global_resources *res_mgr_info;
>> +
>> +
>> +/*
>> + * The resource manager interacts with software running outside of the
>> + * Linux kernel, which necessitates locking to maintain data structure
>> + * consistency.  These custom locking functions implement the locking
>> + * protocol, and cannot be replaced by kernel locking functions that
>> + * may use different in-memory structures.
>> + */
>> +
>> +static void res_mgr_lock(void)
>> +{
>> +	unsigned int tmp;
>> +	u64 lock = (u64)&res_mgr_info->rlock;
> 
> presumably this could be a u32 *, avoid the cast to u64, and still work
> just fine below.

I will rewrite to just use cmpxchg()


> 
>> +
>> +	__asm__ __volatile__(
>> +		".set noreorder\n"
>> +		"1: ll   %[tmp], 0(%[addr])\n"
>> +		"   bnez %[tmp], 1b\n"
>> +		"   li   %[tmp], 1\n"
> 
> I believe the convention for .S files is for instructions in branch
> delay slots to be indented an additional space for readability. Maybe
> that would be worthwhile here.
> 
>> +		"   sc   %[tmp], 0(%[addr])\n"
>> +		"   beqz %[tmp], 1b\n"
>> +		"   nop\n"
> 
> and here also.
> 
>> +		".set reorder\n" :
> 
> nit: strictly speaking there's no need for \n on the last line.
> 
>> +		[tmp] "=&r"(tmp) :
>> +		[addr] "r"(lock) :
>> +		"memory");
> 
> minor style thing: its far more common to have : at the beginning of the
> line rather than the end.
> 
>> +}
>> +
>> +static void res_mgr_unlock(void)
>> +{
>> +	u64 lock = (u64)&res_mgr_info->rlock;
> 
> same again
> 

Will rewrite to use WRITE_ONCE().

>> +
>> +	/* Wait until all resource operations finish before unlocking. */
>> +	mb();
>> +	__asm__ __volatile__(
>> +		"sw $0, 0(%[addr])\n" : :
>> +		[addr] "r"(lock) :
>> +		"memory");
>> +
>> +	/* Force a write buffer flush. */
>> +	mb();
>> +}
>> +
>> +static int res_mgr_find_resource(struct global_resource_tag tag)
>> +{
>> +	struct global_resource_entry *res_entry;
>> +	int i;
>> +
>> +	for (i = 0; i < res_mgr_info->entry_cnt; i++) {
>> +		res_entry = &res_mgr_info->resource_entry[i];
>> +		if (res_entry->tag.lo == tag.lo && res_entry->tag.hi == tag.hi)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
>> +
>> +/**
>> + * res_mgr_create_resource - Create a resource.
>> + * @tag: Identifies the resource.
>> + * @inst_cnt: Number of resource instances to create.
>> + *
>> + * Returns 0 if the source was created successfully.
>> + * Returns <0 for error codes.
> 
> Only -1 seems to be returned. Is it worth returning some standard Linux
> error codes instead?

Yep.  I fixed this and everything below for the next version of the 
patch set.

Thanks,
David Daney
