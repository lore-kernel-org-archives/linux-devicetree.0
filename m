From: Alistair Popple <apopple@au1.ibm.com>
Subject: Re: [PATCH v4 2/5] drivers/of: do not add memory for unavailable nodes
Date: Fri, 21 Oct 2016 17:22:54 +1100
Message-ID: <2344394.NlaWgtFOqB@new-mexico>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com> <1475778995-1420-3-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475778995-1420-3-git-send-email-arbab@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Reza Arbab <arbab@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Stewart Smith <stewart@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tang Chen <tangchen@cn.fujitsu.com>, linux-mm@kvack.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Hi Reza,

On Thu, 6 Oct 2016 01:36:32 PM Reza Arbab wrote:
> Respect the standard dt "status" property when scanning memory nodes in
> early_init_dt_scan_memory(), so that if the node is unavailable, no
> memory will be added.

What happens if a kernel without this patch is booted on a system with some 
status="disabled" device-nodes? Do older kernels just ignore this memory or do 
they try to use it?

>From what I can tell it seems that kernels without this patch will try and use 
this memory even if it is marked in the device-tree as status="disabled" which 
could lead to problems for older kernels when we start exporting this property 
from firmware.

Arguably this might not be such a problem in practice as we probably don't 
have many (if any) existing kernels that will boot on hardware exporting these 
properties. However given this patch seems fairly independent perhaps it is 
worth sending as a separate fix if it is not going to make it into this 
release?

Regards,

Alistair

> The use case at hand is accelerator or device memory, which may be
> unusable until post-boot initialization of the memory link. Such a node
> can be described in the dt as any other, given its status is "disabled".
> Per the device tree specification,
> 
> "disabled"
> 	Indicates that the device is not presently operational, but it
> 	might become operational in the future (for example, something
> 	is not plugged in, or switched off).
> 
> Once such memory is made operational, it can then be hotplugged.
> 
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  drivers/of/fdt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index b138efb..08e5d94 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1056,6 +1056,9 @@ int __init early_init_dt_scan_memory(unsigned long 
node, const char *uname,
>  	} else if (strcmp(type, "memory") != 0)
>  		return 0;
>  
> +	if (!of_flat_dt_device_is_available(node))
> +		return 0;
> +
>  	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
>  	if (reg == NULL)
>  		reg = of_get_flat_dt_prop(node, "reg", &l);
> 
