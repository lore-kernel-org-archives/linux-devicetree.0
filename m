From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [RFC PATCH v3 1/6] of: Allow scripts/dtc/libfdt to be used from
 kernel code
Date: Fri, 06 May 2011 10:14:26 -0700
Message-ID: <4DC42C72.1010306@caviumnetworks.com>
References: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com> <1304614949-30460-2-git-send-email-ddaney@caviumnetworks.com> <4DC3D3D5.6060007@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DC3D3D5.6060007@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/06/2011 03:56 AM, Michal Marek wrote:
> On 5.5.2011 19:02, David Daney wrote:
>> --- /dev/null
>> +++ b/drivers/of/libfdt/Makefile
>> @@ -0,0 +1,8 @@
>> +ccflags-y := -include linux/libfdt_env.h
>> -I$(src)/../../../scripts/dtc/libfdt
>> +
>> +obj-y = fdt.o fdt_wip.o fdt_ro.o
>> +
>> +
>> +$(obj)/%.o: $(src)/../../../scripts/dtc/libfdt/%.c FORCE
>> + $(call cmd,force_checksrc)
>> + $(call if_changed_rule,cc_o_c)
>
> It's just three source files, so you could use three one-line wrappers
> that #include ../../../scripts/dtc/libfdt/<file>.c instead of copying
> the %.c -> %.o rule here.
>

Good idea, that does seem cleaner.

I will adjust the patch.

David Daney
