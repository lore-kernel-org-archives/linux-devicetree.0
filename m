From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] kernel/resource: Add new flag IORESOURCE_SHARED
Date: Mon, 8 Jun 2015 22:02:06 +0200
Message-ID: <CAPybu_2-EZoMEkWR9BoRfzGBevxCp-sd+CiVK2DhRjLoy5Pfyg@mail.gmail.com>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com> <20150608182310.1F13FC406AA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150608182310.1F13FC406AA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cliff Wickman <cpw-sJ/iWh9BUns@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant

On Mon, Jun 8, 2015 at 8:23 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri,  5 Jun 2015 12:51:17 +0200
> , Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
>> Some device tree platforms have not defined correctly their memory
>> resources (i.e. Overlapping or duplication of resources).
>> To avoid this issue we have historically avoided to add their resources to
>> the resource tree. This leads to code duplication and oops when trying to
>> unload dynamically a device tree (feature introduced recently).
>>
>> This new flag tells the resource system that a resource can be shared by
>> multiple owners, so we can support device trees with problems at the
>> same time that we do not duplicate code or crash when unloading the
>> device tree.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>
> I'm really not comfortable with this change. The resource tree code is
> complicated enough as is. Adding this exception case quite probably adds
> corner cases that aren't property dealt with. If two regions overlay,
> and then request_region is called? Which region does it become a child
> of? And that's just off the top of my head. I don't want to hack in
> changes to the resource code for what is a corner case.

I see your concern, perhaps you could provide a testcase and we can
find out if it fails or not. So far I have tested a device tree with
two devices on the same memory region, each device managed by a
driver.

I can load and unload the device tree perfectly.

>
> g.
>
>>  include/linux/ioport.h | 1 +
>>  kernel/resource.c      | 6 ++++--
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
>> index 388e3ae94f7a..f4d992381529 100644
>> --- a/include/linux/ioport.h
>> +++ b/include/linux/ioport.h
>> @@ -49,6 +49,7 @@ struct resource {
>>  #define IORESOURCE_WINDOW    0x00200000      /* forwarded by bridge */
>>  #define IORESOURCE_MUXED     0x00400000      /* Resource is software muxed */
>>
>> +#define IORESOURCE_SHARED    0x04000000      /* Resource can be shared */
>>  #define IORESOURCE_EXCLUSIVE 0x08000000      /* Userland may not map this resource */
>>  #define IORESOURCE_DISABLED  0x10000000
>>  #define IORESOURCE_UNSET     0x20000000      /* No address assigned yet */
>> diff --git a/kernel/resource.c b/kernel/resource.c
>> index 90552aab5f2d..4a3626489b62 100644
>> --- a/kernel/resource.c
>> +++ b/kernel/resource.c
>> @@ -210,6 +210,7 @@ static struct resource * __request_resource(struct resource *root, struct resour
>>       resource_size_t start = new->start;
>>       resource_size_t end = new->end;
>>       struct resource *tmp, **p;
>> +     bool root_shared = root && root->flags & IORESOURCE_SHARED;
>>
>>       if (end < start)
>>               return root;
>> @@ -220,14 +221,15 @@ static struct resource * __request_resource(struct resource *root, struct resour
>>       p = &root->child;
>>       for (;;) {
>>               tmp = *p;
>> -             if (!tmp || tmp->start > end) {
>> +             if (!tmp || tmp->start > end ||
>> +                     (root_shared && tmp->start > start)) {
>>                       new->sibling = tmp;
>>                       *p = new;
>>                       new->parent = root;
>>                       return NULL;
>>               }
>>               p = &tmp->sibling;
>> -             if (tmp->end < start)
>> +             if (tmp->end < start || root_shared)
>>                       continue;
>>               return tmp;
>>       }
>> --
>> 2.1.4
>>
>



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
