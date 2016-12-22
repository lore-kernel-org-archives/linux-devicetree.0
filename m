From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Fwd: [PATCH 1/1] of/fdt: failed to mark hotplug range message
Date: Thu, 22 Dec 2016 23:58:21 +0100
Message-ID: <c0796a79-b30a-2e59-c36e-b9d2b4415d04@gmx.de>
References: <20161222053405.27190-1-xypron.glpk@gmx.de>
 <5251e7ef-cadf-7833-9a7e-66ebf78e2e94@gmx.de>
 <20161222214917.7g6ldgkdvrlqsyq3@arbab-laptop.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161222214917.7g6ldgkdvrlqsyq3-qNY8G7rN0TWMBe/gKFfDyNwqlRwYtuWJQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/22/2016 10:49 PM, Reza Arbab wrote:
> On Thu, Dec 22, 2016 at 06:52:45AM +0100, Heinrich Schuchardt wrote:
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index c9b5cac03b36..fd129b6e5396 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -1057,7 +1057,7 @@ int __init early_init_dt_scan_memory(unsigned
>> long node, const char *uname,
>>
>>          if (early_init_dt_mark_hotplug_memory_arch(base, size))
>>              pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
>> -                base, base + size);
>> +                base, base + size - 1);
>>      }
>>
>>      return 0;
> 
> Isn't it implied that ranges printed this way are [start, end)?
> 
> If not, the entire file should be fixed, not just this occurrence.
> 
The output in the file drivers/of/fdt.c is currently inconsistent.
Alternative output formats are

pr_err("Reserved memory not supported, ignoring range %pa - %pa%s\n",
                  &base, &size, nomap ? " (nomap)" : "");

and

pr_debug("Reserved memory: reserved region for node '%s': base %pa, size
%ld MiB\n", uname, &base, (unsigned long)size / SZ_1M);

(Here we will see size = 0 for values less then 1 MiB.)

I expect intervals to be closed and not half open if not explicitly
indicated otherwise.

So I suggest we change all occurrences of interval output in
drivers/of/fdt.c to
0xfirstbyte - 0xlastbyte
where firstbyte = base and lastbyte = base + size - 1.

Using the %pa format code ensures that the length of the output matches
the bitness of address pointers in the system.

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
