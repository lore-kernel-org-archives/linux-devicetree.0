From: Cyril Chemparathy <cyril@ti.com>
Subject: Re: [PATCH] of: specify initrd location using 64-bit
Date: Wed, 12 Sep 2012 19:45:57 -0400
Message-ID: <50511EB5.800@ti.com>
References: <1347465937-7056-1-git-send-email-cyril@ti.com> <5050EF3F.6030003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <5050EF3F.6030003@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux@openrisc.net, linuxppc-dev@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au, x86@kernel.org, david.daney@cavium.com, benh@kernel.crashing.org, bigeasy@linutronix.de, grant.likely@secretlab.ca, paul.gortmaker@windriver.com, paulus@samba.org, hpa@zytor.com, m.szyprowski@samsung.com, jonas@southpole.se, linux@arm.linux.org.uk, nico@linaro.org, a-jacquiot@ti.com, mingo@redhat.com, suzuki@in.ibm.com, mahesh@linux.vnet.ibm.com, linus.walleij@linaro.org, arnd@arndb.de, msalter@redhat.com, rob.herring@calxeda.com, tglx@linutronix.de, blogic@openwrt.orgd
List-Id: devicetree@vger.kernel.org

On 9/12/2012 4:23 PM, Rob Herring wrote:
> On 09/12/2012 11:05 AM, Cyril Chemparathy wrote:
>> On some PAE architectures, the entire range of physical memory could reside
>> outside the 32-bit limit.  These systems need the ability to specify the
>> initrd location using 64-bit numbers.
>>
>> This patch globally modifies the early_init_dt_setup_initrd_arch() function to
>> use 64-bit numbers instead of the current unsigned long.
>
> S-o-B?
>

Sorry about that, will include in v2.

[...]
>> --- a/arch/arm/mm/init.c
>> +++ b/arch/arm/mm/init.c
>> @@ -76,7 +76,7 @@ static int __init parse_tag_initrd2(const struct tag *tag)
>>   __tagtable(ATAG_INITRD2, parse_tag_initrd2);
>>
>>   #ifdef CONFIG_OF_FLATTREE
>> -void __init early_init_dt_setup_initrd_arch(unsigned long start, unsigned long end)
>> +void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
>
> phys_initrd_start/size need to change too. Not sure about similar things
> on other arches.
>

I've fixed phys_initrd_start (not size) in another patch, please see [1].

> Does u-boot need similar fixes?
>

We aren't there yet :-)  We are currently running this platform without 
u-boot.


[1] http://permalink.gmane.org/gmane.linux.kernel/1356713

-- 
Thanks
- Cyril
