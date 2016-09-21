From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] mm: enable CONFIG_MOVABLE_NODE on powerpc
Date: Wed, 21 Sep 2016 00:45:01 -0500
Message-ID: <20160921054500.lrqktzjqjhuzewqg@arbab-laptop>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1473883618-14998-4-git-send-email-arbab@linux.vnet.ibm.com>
 <87h99cxv00.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <87h99cxv00.fsf@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2016 at 11:59:35AM +0530, Aneesh Kumar K.V wrote:
>Movable node also does.
>	memblock_set_bottom_up(true);
>What is the impact of that. Do we need changes equivalent to that ? Also
>where are we marking the nodes which can be hotplugged, ie where do we
>do memblock_mark_hotplug() ?

These are related to the mechanism x86 uses to create movable nodes at 
boot. The SRAT is parsed to mark any hotplug memory. That marking is 
used later when initializing ZONE_MOVABLE for each node. [1]

The bottom-up allocation is due to a timing issue [2]. There is a window 
where kernel memory may be allocated before the SRAT is parsed. Any 
bottom-up allocations done during that time will likely be in the same 
(nonmovable) node as the kernel image.

On power, I don't think we have a heuristic equivalent to that SRAT 
memory hotplug info. So, we'll be limited to dynamically adding movable 
nodes after boot.

1. http://events.linuxfoundation.org/sites/events/files/lcjp13_chen.pdf
2. commit 79442ed189ac ("mm/memblock.c: introduce bottom-up allocation 
mode")

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
