From: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] mm: enable CONFIG_MOVABLE_NODE on powerpc
Date: Wed, 21 Sep 2016 20:13:37 +0530
Message-ID: <87h999wbxi.fsf@linux.vnet.ibm.com>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com> <1473883618-14998-4-git-send-email-arbab@linux.vnet.ibm.com> <87h99cxv00.fsf@linux.vnet.ibm.com> <20160921054500.lrqktzjqjhuzewqg@arbab-laptop> <87oa3hwwxs.fsf@linux.vnet.ibm.com> <20160921140846.m6wp2ij5f2fx4cps@arbab-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160921140846.m6wp2ij5f2fx4cps@arbab-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> writes:

> On Wed, Sep 21, 2016 at 12:39:51PM +0530, Aneesh Kumar K.V wrote:
>>What I was checking was how will one mark a node movable in ppc64 ? I
>>don't see ppc64 code doing the equivalent of memblock_mark_hotplug().
>
> Post boot, the marking mechanism is not necessary. You can create a 
> movable node by putting all of the node's memory into ZONE_MOVABLE 
> during the hotplug.
>
>>So when you say "Onlining memory into ZONE_MOVABLE requires
>>CONFIG_MOVABLE_NODE" where is that restriction ?. IIUC,
>>should_add_memory_movable() will only return ZONE_MOVABLE only if it is
>>non empty and MOVABLE_NODE will create a ZONE_MOVABLE zone by default
>>only if it finds a memblock marked hotpluggable. So wondering if we
>>are not calling memblock_mark_hotplug() how is it working. Or am I
>>missing something ?
>
> You are looking at the addition step of hotplug. You're correct there, 
> the memory is added to the default zone, not ZONE_MOVABLE. The 
> transition to ZONE_MOVABLE takes place during the onlining step. In 
> online_pages():
>
> 	zone = move_pfn_range(zone_shift, pfn, pfn + nr_pages);
>
> The reason we need CONFIG_MOVABLE_NODE is right before that:
>
> 	if ((zone_idx(zone) > ZONE_NORMAL ||
> 	    online_type == MMOP_ONLINE_MOVABLE) &&
> 	    !can_online_high_movable(zone))
> 		return -EINVAL;
>

So we are looking at two step online process here. The above explained
the details nicely. Can you capture these details in the commit message. ie,
to say that when using 'echo online-movable > state' we allow the move from
normal to movable only if movable node is set. Also you may want to
mention that we still don't support the auto-online to movable.


> where can_online_high_movable() is defined like this:
>
> 	#ifdef CONFIG_MOVABLE_NODE
> 	/*
> 	 * When CONFIG_MOVABLE_NODE, we permit onlining of a node which doesn't have
> 	 * normal memory.
> 	 */
> 	static bool can_online_high_movable(struct zone *zone)
> 	{
> 		return true;
> 	}
> 	#else /* CONFIG_MOVABLE_NODE */
> 	/* ensure every online node has NORMAL memory */
> 	static bool can_online_high_movable(struct zone *zone)
> 	{
> 		return node_state(zone_to_nid(zone), N_NORMAL_MEMORY);
> 	}
> 	#endif /* CONFIG_MOVABLE_NODE */
>
> To be more clear, I can change the commit log to say "Onlining all of a 
> node's memory into ZONE_MOVABLE requires CONFIG_MOVABLE_NODE".
>
> -- 
> Reza Arbab

-aneesh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
