From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 5/5] mm: enable CONFIG_MOVABLE_NODE on powerpc
Date: Mon, 26 Sep 2016 19:19:19 -0500
Message-ID: <20160927001919.sriijnhnu3c2jkck@arbab-laptop>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1474828616-16608-6-git-send-email-arbab@linux.vnet.ibm.com>
 <1474924541.2857.258.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <1474924541.2857.258.camel@kernel.crashing.org>
Sender: owner-linux-mm@kvack.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 07:15:41AM +1000, Benjamin Herrenschmidt wrote:
>What is that business with a command line argument ? Do that mean that
>we'll need some magic command line argument to properly handle LPC memory
>on CAPI devices or GPUs ? If yes that's bad ... kernel arguments should
>be a last resort.

Well, movable_node is just a boolean, meaning "allow nodes which contain 
only movable memory". It's _not_ like "movable_node=10,13-15,17", if 
that's what you were thinking.

>We should have all the information we need from the device-tree.
>
>Note also that we shouldn't need to create those nodes at boot time,
>we need to add the ability to create the whole thing at runtime, we may know
>that there's an NPU with an LPC window in the system but we won't know if it's
>used until it is and for CAPI we just simply don't know until some PCI device
>gets turned into CAPI mode and starts claiming LPC memory...

Yes, this is what is planned for, if I'm understanding you correctly.

In the dt, the PCI device node has a phandle pointing to the memory 
node. The memory node describes the window into which we can hotplug at 
runtime.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
