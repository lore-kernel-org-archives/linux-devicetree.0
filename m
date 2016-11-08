From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 4/4] of/fdt: mark hotpluggable memory
Date: Tue, 8 Nov 2016 13:59:21 -0600
Message-ID: <20161108195921.5iltumzajxlkpayz@arbab-laptop.austin.ibm.com>
References: <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
 <201611080920.t1iTxguA%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201611080920.t1iTxguA%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Alistair Popple <apopple@au1.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 08, 2016 at 09:59:26AM +0800, kbuild test robot wrote:
>All errors (new ones prefixed by >>):
>
>   drivers/of/fdt.c: In function 'early_init_dt_scan_memory':
>>> drivers/of/fdt.c:1064:3: error: implicit declaration of function 'memblock_mark_hotplug'
>   cc1: some warnings being treated as errors
>
>vim +/memblock_mark_hotplug +1064 drivers/of/fdt.c
>
>  1058				continue;
>  1059			pr_debug(" - %llx ,  %llx\n", (unsigned long long)base,
>  1060			    (unsigned long long)size);
>  1061	
>  1062			early_init_dt_add_memory_arch(base, size);
>  1063	
>> 1064			if (hotpluggable && memblock_mark_hotplug(base, size))
>  1065				pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
>  1066					base, base + size);
>  1067		}

Ah, I need to adjust for !CONFIG_HAVE_MEMBLOCK. Will correct in v7.

-- 
Reza Arbab
