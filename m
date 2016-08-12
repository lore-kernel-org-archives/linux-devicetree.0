From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/mm: allow memory hotplug into a memoryless
 node
Date: Fri, 12 Aug 2016 11:50:43 +1000
Message-ID: <7d943111-d243-ffb3-ff5f-6d712c268e67@gmail.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1470680843-28702-4-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1470680843-28702-4-git-send-email-arbab@linux.vnet.ibm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 09/08/16 04:27, Reza Arbab wrote:
> Remove the check which prevents us from hotplugging into an empty node.
> 
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 80d067d..bc70c4f 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1127,7 +1127,7 @@ static int hot_add_node_scn_to_nid(unsigned long scn_addr)
>  int hot_add_scn_to_nid(unsigned long scn_addr)
>  {
>  	struct device_node *memory = NULL;
> -	int nid, found = 0;
> +	int nid;
>  

Do we want to do this only for ibm,hotplug-aperture compatible ranges?

I'm OK either ways

Acked-by: Balbir Singh <bsingharora@gmail.com>
