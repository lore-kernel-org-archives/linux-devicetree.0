From: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 13:52:15 +0530
Message-ID: <13846fcb-3aa2-a4fb-1bd8-e624855f105d@codeaurora.org>
References: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
 <5a7793df-725e-608d-778b-cb81fde0cc64@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a7793df-725e-608d-778b-cb81fde0cc64-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 1/26/2018 1:24 AM, Frank Rowand wrote:
> On 01/25/18 02:14, Chintan Pandya wrote:
>> of_find_node_by_phandle() takes a lot of time finding
>> right node when your intended device is too right-side
>> in the fdt. Reason is, we search each device serially
>> from the fdt, starting from left-most to right-most.
> Please give me a pointer to the code that is doing
> this search.
>
> -Frank
You can refer include/linux/of.h

#define for_each_of_allnodes_from(from, dn) \
         for (dn = __of_find_all_nodes(from); dn; dn = 
__of_find_all_nodes(dn))
#define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)

where __of_find_all_nodes() does

struct device_node *__of_find_all_nodes(struct device_node *prev)
{
         struct device_node *np;
         if (!prev) {
                 np = of_root;
         } else if (prev->child) {
                 np = prev->child;
         } else {
                 /* Walk back up looking for a sibling, or the end of 
the structure */
                 np = prev;
                 while (np->parent && !np->sibling)
                         np = np->parent;
                 np = np->sibling; /* Might be null at the end of the 
tree */
         }
         return np;
}

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
