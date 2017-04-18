From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] of: fix "/cpus" reference leak in
 of_numa_parse_cpu_nodes()
Date: Tue, 18 Apr 2017 08:16:58 -0700
Message-ID: <1005a5c3-22d1-b082-0383-d8f74e711315@caviumnetworks.com>
References: <1492475357-10784-1-git-send-email-tyreld@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492475357-10784-1-git-send-email-tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/17/2017 05:29 PM, Tyrel Datwyler wrote:
> The call to of_find_node_by_path("/cpus") returns the cpus device_node
> with its reference count incremented. There is no matching of_node_put()
> call in of_numa_parse_cpu_nodes() which results in a leaked reference
> to the "/cpus" node.
> 
> This patch adds an of_node_put() to release the reference.

Good catch:
Acked-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

> 
> fixes: 298535c00a2c ("of, numa: Add NUMA of binding implementation.")
> Signed-off-by: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/of/of_numa.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> index a53982a..2db1f7a 100644
> --- a/drivers/of/of_numa.c
> +++ b/drivers/of/of_numa.c
> @@ -57,6 +57,8 @@ static void __init of_numa_parse_cpu_nodes(void)
>   		else
>   			node_set(nid, numa_nodes_parsed);
>   	}
> +
> +	of_node_put(cpus);
>   }
>   
>   static int __init of_numa_parse_memory_nodes(void)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
