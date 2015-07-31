From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] mtd: ofpart: move ofpart partitions to a dedicated
 dt node
Date: Sat, 1 Aug 2015 00:32:32 +0200
Message-ID: <CAOMqctS4jXf=Mr=pUk6QLdtsrKAh6usXmj6hRiMUyrC7z_WPzQ@mail.gmail.com>
References: <cover.1438340815.git.hramrach@gmail.com> <4982216b5cb602c71ade6810cecdb9535e0862fc.1438340815.git.hramrach@gmail.com>
 <20150731180614.162852ee@bbrezillon> <CAOMqctROw6wrKa+3jF275m=nd6qy7mRy0k3ztJB5s2Vy8r=DZw@mail.gmail.com>
 <20150731192458.457c6c9d@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150731192458.457c6c9d@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 July 2015 at 19:24, Boris Brezillon
<boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, 31 Jul 2015 18:52:01 +0200
> Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
>> >
>> >>               (*pparts)[i].offset = of_read_number(reg, a_cells);
>> >>               (*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
>> >>
>> >> @@ -92,15 +116,15 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>> >>               i++;
>> >>       }
>> >>
>> >> -     if (!i) {
>> >> -             of_node_put(pp);
>> >> -             pr_err("No valid partition found on %s\n", node->full_name);
>> >> -             kfree(*pparts);
>> >> -             *pparts = NULL;
>> >> -             return -EINVAL;
>> >> -     }
>> >> -
>> >
>> > Are you sure you can safely remove this check?
>>
>> Yes. It was incomplete check to reject some partitioning schemes
>> considered invalid.
>>
>> Now there is stricter checking above so this can be removed.
>
> Indeed, I was worried about resources deallocation, but this is handle
> by the caller, and if nr_parts is zero the master MTD device will
> be exposed.

Due to compatibility with the previous scheme there is still
possibility that partitions are allocated, and no partitions are
returned due to the nr_parts--;

So yes, the pparts could possibly leak in this case if there were more
partition parsers following ofpart and should be deallocated.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
