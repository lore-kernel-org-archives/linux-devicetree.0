From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
Date: Wed, 1 Mar 2017 19:06:54 -0800
Message-ID: <a40b3b32-ba86-66d7-a5bb-4df42eb5cd62@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <7c333d34-fda6-9302-b84e-c0785c23733e@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <7c333d34-fda6-9302-b84e-c0785c23733e@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/22/2017 11:55 PM, Marcin Nowakowski wrote:
> Hi Serge,
> 
> Thanks for this patch series, it's really useful. I've tested it on
> Malta and Ci40 and it seems to work well (I've posted a few small
> comments separately).

I have not tested this yet, but this is definitively a very useful patch
series, thanks a lot for doing this Serge!

One thing that was not obvious to me is that you may have to take care
of the "NOMAP" memblock type and avoid mapping these regions, which may
or may not be relevant on MIPS due to the different virtual memory
model. On ARM it's done in arch/arm/mm/mmu.c::map_lowmem.

Please respin, this is very helpful!

> 
> 
> On 19.12.2016 03:07, Serge Semin wrote:
>> Most of the modern platforms supported by linux kernel have already
>> been cleaned up of old bootmem allocator by moving to nobootmem
>> interface wrapping up the memblock. This patchset is the first
>> attempt to do the similar improvement for MIPS for UMA systems
>> only.
>>
>> Even though the porting was performed as much careful as possible
>> there still might be problem with support of some platforms,
>> especially Loonson3 or SGI IP27, which perform early memory manager
>> initialization by their self.
> 
>> The patchset is split so individual patch being consistent in
>> functional and buildable ways. But the MIPS early memory manager
>> will work correctly only either with or without the whole set being
>> applied. For the same reason a reviewer should not pay much attention
>> to methods bootmem_init(), arch_mem_init(), paging_init() and
>> mem_init() until they are fully refactored.
> 
> I'm not sure this can be merged that way? It would be up to Ralf to
> decide, but it is generally expected that all intermediate patches not
> only build, but also work correctly. I understand that this might be
> difficult to achieve given the scale of changes required here.
> 
>> The patchset is applied on top of kernel v4.9.
> 
> Can you please work on cleaning up the issues discussed in the comments
> so far as well as rebasing (and updating) the changes onto linux-next?
> There are a few patches I made related to kexec and kernel relocation
> that will force changes in your code (although I admit that the changes
> I did for kexec/relocation were in some places unnecessarily complex
> because of the mess in the bootmem handling in MIPS that you are now
> trying to clean up).
> 
> 
> Thanks,
> Marcin
> 
>> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
>>
>> Serge Semin (21):
>>   MIPS memblock: Unpin dts memblock sanity check method
>>   MIPS memblock: Add dts mem and reserved-mem callbacks
>>   MIPS memblock: Alter traditional add_memory_region() method
>>   MIPS memblock: Alter user-defined memory parameter parser
>>   MIPS memblock: Alter initrd memory reservation method
>>   MIPS memblock: Alter kexec-crashkernel parameters parser
>>   MIPS memblock: Alter elfcorehdr parameters parser
>>   MIPS memblock: Move kernel parameters parser into individual method
>>   MIPS memblock: Move kernel memory reservation to individual method
>>   MIPS memblock: Discard bootmem allocator initialization
>>   MIPS memblock: Add memblock sanity check method
>>   MIPS memblock: Add memblock print outs in debug
>>   MIPS memblock: Add memblock allocator initialization
>>   MIPS memblock: Alter IO resources initialization method
>>   MIPS memblock: Alter weakened MAAR initialization method
>>   MIPS memblock: Alter paging initialization method
>>   MIPS memblock: Alter high memory freeing method
>>   MIPS memblock: Slightly improve buddy allocator init method
>>   MIPS memblock: Add print out method of kernel virtual memory layout
>>   MIPS memblock: Add free low memory test method call
>>   MIPS memblock: Deactivate old bootmem allocator
>>
>>  arch/mips/Kconfig        |   2 +-
>>  arch/mips/kernel/prom.c  |  32 +-
>>  arch/mips/kernel/setup.c | 958 +++++++++++++++--------------
>>  arch/mips/mm/init.c      | 234 ++++---
>>  drivers/of/fdt.c         |  47 +-
>>  include/linux/of_fdt.h   |   1 +
>>  6 files changed, 739 insertions(+), 535 deletions(-)
>>
> 

-- 
Florian
