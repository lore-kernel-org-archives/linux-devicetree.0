From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] mm: enable CONFIG_MOVABLE_NODE on powerpc
Date: Wed, 21 Sep 2016 09:08:47 -0500
Message-ID: <20160921140846.m6wp2ij5f2fx4cps@arbab-laptop>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1473883618-14998-4-git-send-email-arbab@linux.vnet.ibm.com>
 <87h99cxv00.fsf@linux.vnet.ibm.com>
 <20160921054500.lrqktzjqjhuzewqg@arbab-laptop>
 <87oa3hwwxs.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87oa3hwwxs.fsf@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2016 at 12:39:51PM +0530, Aneesh Kumar K.V wrote:
>What I was checking was how will one mark a node movable in ppc64 ? I
>don't see ppc64 code doing the equivalent of memblock_mark_hotplug().

Post boot, the marking mechanism is not necessary. You can create a 
movable node by putting all of the node's memory into ZONE_MOVABLE 
during the hotplug.

>So when you say "Onlining memory into ZONE_MOVABLE requires
>CONFIG_MOVABLE_NODE" where is that restriction ?. IIUC,
>should_add_memory_movable() will only return ZONE_MOVABLE only if it is
>non empty and MOVABLE_NODE will create a ZONE_MOVABLE zone by default
>only if it finds a memblock marked hotpluggable. So wondering if we
>are not calling memblock_mark_hotplug() how is it working. Or am I
>missing something ?

You are looking at the addition step of hotplug. You're correct there, 
the memory is added to the default zone, not ZONE_MOVABLE. The 
transition to ZONE_MOVABLE takes place during the onlining step. In 
online_pages():

	zone = move_pfn_range(zone_shift, pfn, pfn + nr_pages);

The reason we need CONFIG_MOVABLE_NODE is right before that:

	if ((zone_idx(zone) > ZONE_NORMAL ||
	    online_type == MMOP_ONLINE_MOVABLE) &&
	    !can_online_high_movable(zone))
		return -EINVAL;

where can_online_high_movable() is defined like this:

	#ifdef CONFIG_MOVABLE_NODE
	/*
	 * When CONFIG_MOVABLE_NODE, we permit onlining of a node which doesn't have
	 * normal memory.
	 */
	static bool can_online_high_movable(struct zone *zone)
	{
		return true;
	}
	#else /* CONFIG_MOVABLE_NODE */
	/* ensure every online node has NORMAL memory */
	static bool can_online_high_movable(struct zone *zone)
	{
		return node_state(zone_to_nid(zone), N_NORMAL_MEMORY);
	}
	#endif /* CONFIG_MOVABLE_NODE */

To be more clear, I can change the commit log to say "Onlining all of a 
node's memory into ZONE_MOVABLE requires CONFIG_MOVABLE_NODE".

-- 
Reza Arbab

