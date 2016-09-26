From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 4/5] powerpc/mm: restore top-down allocation when
 using movable_node
Date: Mon, 26 Sep 2016 15:48:40 -0500
Message-ID: <20160926204839.bugxlsyd4p3or5p2@arbab-laptop>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1474828616-16608-5-git-send-email-arbab@linux.vnet.ibm.com>
 <8760piacio.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8760piacio.fsf@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 26, 2016 at 09:17:43PM +0530, Aneesh Kumar K.V wrote:
>> +	/* bottom-up allocation may have been set by movable_node */
>> +	memblock_set_bottom_up(false);
>> +
>
>By then we have done few memblock allocation right ?

Yes, some allocations do occur while bottom-up is set.

>IMHO, we should do this early enough in prom.c after we do 
>parse_early_param, with a comment there explaining that, we don't 
>really support hotplug memblock and when we do that, this should be 
>moved to a place where we can handle memblock allocation such that we 
>avoid spreading memblock allocation to movable node.

Sure, we can do it earlier. The only consideration is that any potential 
calls to memblock_mark_hotplug() happen before we reset to top-down.  
Since we don't do that at all on power, the call can go anywhere.

-- 
Reza Arbab

