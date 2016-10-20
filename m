From: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] powerpc/mm: allow memory hotplug into a memoryless
 node
Date: Thu, 20 Oct 2016 14:30:42 +1100
Message-ID: <872f253d-8a55-246c-2be0-636a588e2dd0@gmail.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1475778995-1420-4-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475778995-1420-4-git-send-email-arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Tang Chen <tangchen-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/10/16 05:36, Reza Arbab wrote:
> Remove the check which prevents us from hotplugging into an empty node.
> 
> This limitation has been questioned before [1], and judging by the
> response, there doesn't seem to be a reason we can't remove it. No issues
> have been found in light testing.
> 
> [1] http://lkml.kernel.org/r/CAGZKiBrmkSa1yyhbf5hwGxubcjsE5SmkSMY4tpANERMe2UG4bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
>     http://lkml.kernel.org/r/20160511215051.GF22115-qNY8G7rN0TWMBe/gKFfDyNwqlRwYtuWJQQ4Iyu8u01E@public.gmane.org
> 
> Signed-off-by: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Acked-by: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Cc: Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/powerpc/mm/numa.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 75b9cd6..d7ac419 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1121,7 +1121,7 @@ static int hot_add_node_scn_to_nid(unsigned long scn_addr)
>  int hot_add_scn_to_nid(unsigned long scn_addr)
>  {
>  	struct device_node *memory = NULL;
> -	int nid, found = 0;
> +	int nid;
>  
>  	if (!numa_enabled || (min_common_depth < 0))
>  		return first_online_node;
> @@ -1137,17 +1137,6 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
>  	if (nid < 0 || !node_online(nid))
>  		nid = first_online_node;
>  
> -	if (NODE_DATA(nid)->node_spanned_pages)
> -		return nid;
> -
> -	for_each_online_node(nid) {
> -		if (NODE_DATA(nid)->node_spanned_pages) {
> -			found = 1;
> -			break;
> -		}
> -	}
> -
> -	BUG_ON(!found);
>  	return nid;

FYI, these checks were temporary to begin with

I found this in git history

b226e462124522f2f23153daff31c311729dfa2f (powerpc: don't add memory to empty node/zone)

Balbir Singh.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
