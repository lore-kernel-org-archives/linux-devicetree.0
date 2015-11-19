From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v7 25/50] powerpc/powernv: Reserve PE for root bus
Date: Thu, 19 Nov 2015 11:21:48 +1100
Message-ID: <564D161C.3020603@ozlabs.ru>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-26-git-send-email-gwshan@linux.vnet.ibm.com>
 <564AC37A.2060701@ozlabs.ru> <20151117090653.GA20134@gwshan>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20151117090653.GA20134@gwshan>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 11/17/2015 08:06 PM, Gavin Shan wrote:
> On Tue, Nov 17, 2015 at 05:04:42PM +1100, Alexey Kardashevskiy wrote:
>> On 11/05/2015 12:12 AM, Gavin Shan wrote:
>>> We're going to reserve/assign PEs when pcibios_setup_bridge() is
>>> called. The function won't be called for root bus as it doesn't
>>> have parent bridge. However, the root bus still needs a PE to be
>>> covered.
>>>
>>> This reserves PE numbers that are adjacent to the reserved one
>>> for root buses.
>>
>>
>> Somewhere in the patchset you need to describe why you need a separate PE for
>> a root bus and why reserved_pe_idx is not enough for this.
>>
>
> Please confirm if it's fine to add the descrption in this patch's chagelog.

Yes, it is fine. Thanks!


-- 
Alexey
