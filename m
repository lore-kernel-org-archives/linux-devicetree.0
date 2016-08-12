From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/4] powerpc/mm: allow memory hotplug into a memoryless
 node
Date: Fri, 12 Aug 2016 12:24:03 -0500
Message-ID: <20160812172402.GA31526@arbab-vm.austin.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1470680843-28702-4-git-send-email-arbab@linux.vnet.ibm.com>
 <7d943111-d243-ffb3-ff5f-6d712c268e67@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <7d943111-d243-ffb3-ff5f-6d712c268e67@gmail.com>
Sender: owner-linux-mm@kvack.org
To: Balbir Singh <bsingharora@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 12, 2016 at 11:50:43AM +1000, Balbir Singh wrote:
>On 09/08/16 04:27, Reza Arbab wrote:
>> Remove the check which prevents us from hotplugging into an empty node.
>
>Do we want to do this only for ibm,hotplug-aperture compatible ranges?

We could, but since past discussions and current testing have been 
unable to justify preventing hotplug to a memoryless node in the first 
place, I'm inclined to keep things simple.

If some edge case is discovered, making it conditional as you describe 
will be a good solution.

Thanks for your review! A v2 of this set is pending my investigation of 
Michael's suggestion to get node hotadd working.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
