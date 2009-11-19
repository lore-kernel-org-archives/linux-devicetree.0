From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 4/4] Move of_node[attach,
	detach] declarations to	linux/of.h
Date: Thu, 19 Nov 2009 14:32:13 -0600
Message-ID: <4B05AB4D.1080802@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com>
	<4B03629A.9050503@austin.ibm.com>	<4B046B92.3060108@austin.ibm.com>
	<20091119003517.677a5b02@mycelium.queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091119003517.677a5b02-d8A+jLeiQi/1Xlz9cAVuGNHuzzzSOjJt@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andres Salomon <dilinger-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andres Salomon wrote:
>> -/* For updating the device tree at runtime */
>> -extern void of_attach_node(struct device_node *);
>> -extern void of_detach_node(struct device_node *);
>> -
> 
> Minor points, but I'd recommend moving the declarations at the same
> time as the definitions.  That is, move the of_attach_node declaration
> in patch1 and of_detach_node declaration in patch2.
> 

No problem,  I'll update the patches to do this.
---

>> ===================================================================
>> --- test-devicetree.orig/include/linux/of.h	2009-11-18
>> 17:34:36.000000000 -0600 +++
>> test-devicetree/include/linux/of.h	2009-11-18
>> 19:26:53.000000000 -0600 @@ -187,4 +187,10 @@ const char *list_name,
>> const char *cells_name, int index, struct device_node **out_node,
>> const void **out_args); 
>> +#ifdef CONFIG_OF_DYNAMIC
>> +/* For updating the device tree at runtime */
>> +extern void of_attach_node(struct device_node *);
>> +extern void of_detach_node(struct device_node *);
>> +#endif
>> +
>>  #endif /* _LINUX_OF_H */
> 
> The trend seems to be a different header file per config option.
> "of_dynamic.h" would be the logic extension of that..
> 

Works for me, updated patches coming soon.

-Nathan Fontenot
