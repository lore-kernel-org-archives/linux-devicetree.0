From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 4/5] powerpc/mm: restore top-down allocation when
 using movable_node
Date: Mon, 26 Sep 2016 19:14:14 -0500
Message-ID: <20160927001413.o72fqpfsnsxpu5qq@arbab-laptop>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1474828616-16608-5-git-send-email-arbab@linux.vnet.ibm.com>
 <1474924351.2857.255.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <1474924351.2857.255.camel@kernel.crashing.org>
Sender: owner-linux-mm@kvack.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 07:12:31AM +1000, Benjamin Herrenschmidt wrote:
>In any case, if the memory hasn't been hotplug, this shouldn't be 
>necessary as we shouldn't be considering it for allocation.

Right. To be clear, the background info I put in the commit log refers 
to x86, where the SRAT can describe movable nodes which exist at boot.  
They're trying to avoid allocations from those nodes before they've been 
identified.

On power, movable nodes can only exist via hotplug, so that scenario 
can't happen. We can immediately go back to top-down allocation. That is 
the missing call being added in the patch.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
