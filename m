From: Michael Bringmann <mwb@linux.vnet.ibm.com>
Subject: Re: [PATCH v03] powerpc/mobility: Fix node detach/rename problem
Date: Tue, 11 Dec 2018 10:43:37 -0600
Message-ID: <6026321f-5818-26ff-f21f-375fa2dca51d@linux.vnet.ibm.com>
References: <a2d46622-a957-dffe-04d1-8087bbf0f8b5@linux.vnet.ibm.com>
 <871s6oxkdf.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s6oxkdf.fsf@concordia.ellerman.id.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Juliet Kim <minkim@us.ibm.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

--- Snip ---

>>
>> The mobility.c code continues on during the second migration, accepts
>> the definitions of the new nodes from the PHYP and ends up renaming
>> the new properties e.g.
>>
>> [ 4565.827296] Duplicate name in base, renamed to "ibm,platform-facilities#1"
>>
>> There is no check like 'of_node_check_flag(np, OF_DETACHED)' within
>> of_find_node_by_phandle to skip nodes that are detached, but still
>> present due to caching or use count considerations.  Also, note that
>> of_find_node_by_phandle also uses a 'phandle_cache' which does not
>> appear to be updated when of_detach_node() is invoked.
> 
> This seems like the real bug. Since the phandle cache was added we can
> now find detached nodes when we shouldn't be able to.
> 
> Does the patch below work?
> 
> cheers
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 09692c9b32a7..d8e4534c0686 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1190,6 +1190,10 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>  		if (phandle_cache[masked_handle] &&
>  		    handle == phandle_cache[masked_handle]->phandle)
>  			np = phandle_cache[masked_handle];
> +
> +		/* If we find a detached node, remove it */
> +		if (of_node_check_flag(np, OF_DETACHED))
> +			np = phandle_cache[masked_handle] = NULL;
>  	}
> 
>  	if (!np) {
> 
> 

I think this would be a bit better for cases where masked values overlap:

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 09692c9..ec79129 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1188,8 +1188,13 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 
 	if (phandle_cache) {
 		if (phandle_cache[masked_handle] &&
-		    handle == phandle_cache[masked_handle]->phandle)
-			np = phandle_cache[masked_handle];
+		    handle == phandle_cache[masked_handle]->phandle) {
+				np = phandle_cache[masked_handle];
+
+			/* If we find a detached node, remove it */
+			if (of_node_check_flag(np, OF_DETACHED))
+				np = phandle_cache[masked_handle] = NULL;
+		}
 	}
 
 	if (!np) {


Will try it out.  Wouldn't it be better to do this when the node is detached
in drivers/of/dynamic.c:__of_detach_node()?

Thanks.
Michael

-- 
Michael W. Bringmann
Linux Technology Center
IBM Corporation
Tie-Line  363-5196
External: (512) 286-5196
Cell:       (512) 466-0650
mwb@linux.vnet.ibm.com
