From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 02/15] x86: Add device tree support
Date: Mon, 03 Jan 2011 13:20:39 +0100
Message-ID: <4D21BF17.6090209@linutronix.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-3-git-send-email-bigeasy@linutronix.de>
	<20101230084311.GD11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101230084311.GD11721-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
>> +extern char cmd_line[COMMAND_LINE_SIZE];
>> +/* This number is used when no interrupt has been assigned */
>> +#define NO_IRQ		(-1)
> 
> 0 means NO_IRQ on x86 and most architectures.  I will change this when
> I pick up the patch.

cat /proc/interrupts
            CPU0
   0:         40   IO-APIC-edge      timer

>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 577d06b..26f2c9a 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -113,6 +113,7 @@
>>  #endif
>>  #include <asm/mce.h>
>>  #include <asm/alternative.h>
>> +#include <asm/prom.h>
>>  
>>  /*
>>   * end_pfn only includes RAM, while max_pfn_mapped includes all e820 entries.
>> @@ -445,6 +446,9 @@ static void __init parse_setup_data(void)
>>  		case SETUP_E820_EXT:
>>  			parse_e820_ext(data);
>>  			break;
>> +		case SETUP_DTB:
>> +			add_dtb(pa_data);
>> +			break;
> 
> Why is the physical address being passed in when the virtual address
> is needed to be stored in initial_boot_params by add_dtb()?

add_dtb() changes it via phys_to_virt() so it is stored as virtual. I
can't touch this memory that early in the boot process so it is passed as
phys. phys_to_virt() isn't working (yet) so you need a fixmap or an
early_ioremap(). Earlier I used the device tree very late so the
phys_to_virt() memory was working.

Later in the series add_dtb() stores it in a custom u64 variable because I 
might have to use the built-in dtb, I have to relocate the dtb (so the
boot loader does not have to care about kernel's memory layout) and I have
to use it "early" so I create a fixmap for it.

The dtb is not usable before the ->get_config() hook (x86_dtb_get_config, 
patch #5) is called. After that initial_boot_params is set and can be used.

>>  		default:
>>  			break;
>>  		}
>> -- 
>> 1.7.3.2

Sebastian
