From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: fix "/cpus" reference leak in of_numa_parse_cpu_nodes()
Date: Tue, 18 Apr 2017 11:08:53 -0500
Message-ID: <CAL_Jsq+_SO-Uzkp5MoCQkF0BWVuU4TFZEFb0tU8TjXE09PC4Ew@mail.gmail.com>
References: <1492475357-10784-1-git-send-email-tyreld@linux.vnet.ibm.com> <1005a5c3-22d1-b082-0383-d8f74e711315@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1005a5c3-22d1-b082-0383-d8f74e711315-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 10:16 AM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On 04/17/2017 05:29 PM, Tyrel Datwyler wrote:
>>
>> The call to of_find_node_by_path("/cpus") returns the cpus device_node
>> with its reference count incremented. There is no matching of_node_put()
>> call in of_numa_parse_cpu_nodes() which results in a leaked reference
>> to the "/cpus" node.
>>
>> This patch adds an of_node_put() to release the reference.
>
>
> Good catch:
> Acked-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
