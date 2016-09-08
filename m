From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 00/16] fix some type infos and bugs for arm64/of numa
Date: Thu, 8 Sep 2016 12:01:19 +0100
Message-ID: <20160908110119.GG1493@arm.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472712907-12700-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-mm <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 02:54:51PM +0800, Zhen Lei wrote:
> v7 -> v8:
> Updated patches according to Will Deacon's review comments, thanks.
> 
> The changed patches is: 3, 5, 8, 9, 10, 11, 12, 13, 15
> Patch 3 requires an ack from Rob Herring.
> Patch 10 requires an ack from linux-mm.
> 
> Hi, Will:
> Something should still be clarified:
> Patch 5, I modified it according to my last reply. BTW, The last sentence
>          "srat_disabled() ? -EINVAL : 0" of arm64_acpi_numa_init should be moved
>          into acpi_numa_init, I think.
>          
> Patch 9, I still leave the code in arch/arm64.
>          1) the implementation of setup_per_cpu_areas on all platforms are different.
>          2) Although my implementation referred to PowerPC, but still something different.
> 
> Patch 15, I modified the description again. Can you take a look at it? If this patch is
> 	  dropped, the patch 14 should also be dropped.
> 
> Patch 16, How many times the function node_distance to be called rely on the APP(need many tasks
>           to be scheduled), I have not prepared yet, so I give up this patch as your advise. 

Ok, I'm trying to pick the pieces out of this patch series and it's not
especially easy. As far as I can tell:

  Patch 3 needs an ack from the device-tree folks

  Patch 10 needs an ack from the memblock folks

  Patch 11 depends on patch 10

  Patches 14,15,16 can wait for the time being (I still don't see their
  value).

So, I could pick up patches 1-2, 4-9 and 12-13 but it's not clear whether
that makes any sense. The whole series seems to be a mix of trivial printk
cleanups, a bunch of core OF stuff, some new features and then some
questionable changes at the end.

Please throw me a clue,

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
