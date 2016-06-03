From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of/numa: fix a memory@ node can only contains one
 memory block
Date: Fri, 3 Jun 2016 10:45:20 +0100
Message-ID: <20160603094520.GF9915@arm.com>
References: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
 <1464427377-12712-3-git-send-email-thunder.leizhen@huawei.com>
 <CAL_JsqJO1jXpmAJWUhCW+OK2mpTvtwzCuy_--3sQNUQhTvyFdA@mail.gmail.com>
 <574F8DA8.4040503@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <574F8DA8.4040503-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 02, 2016 at 09:36:40AM +0800, Leizhen (ThunderTown) wrote:
> On 2016/6/2 4:13, Rob Herring wrote:
> > I believe you still need this and not the one above. You only need it
> > within the loop if you return. Otherwise, the last node always need to
> > be put.
> 
> OK. Thanks.
> 
> Addition with Matthias's suggestion, I will move "return" into this patch,
> so that this of_node_put(np) can be safely removed.

Do you want to include Kefeng's [1] patches in your series too? We don't
need two sets of related NUMA cleanups :)

Will

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-June/432715.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
