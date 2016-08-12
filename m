From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: create numa nodes for hotplug memory
Date: Fri, 12 Aug 2016 11:43:32 +1000
Message-ID: <7ddeb774-1eb7-5529-912c-eb767b8623ce@gmail.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1470680843-28702-3-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1470680843-28702-3-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 09/08/16 04:27, Reza Arbab wrote:
> When scanning the device tree to initialize the system NUMA topology,
> process dt elements with compatible id "ibm,hotplug-aperture" to create
> memoryless numa nodes.
> 
> These nodes will be filled when hotplug occurs within the associated
> address range.
> 
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---

Looks good to me

Acked-by: Balbir Singh <bsingharora@gmail.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
