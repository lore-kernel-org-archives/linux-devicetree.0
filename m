From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 2/7] dt/powerpc: Use of_get_child_by_name to get a
 named child.
Date: Fri, 14 Sep 2012 14:15:08 +0100
Message-ID: <50532DDC.4020805@st.com>
References: <1347610724-20152-1-git-send-email-srinivas.kandagatla@st.com>
 <50532BEC.70201@gmail.com>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50532BEC.70201-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bergner-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

My bad...
Will skip this patch in next patch-set...


On 14/09/12 14:06, Rob Herring wrote:
> On 09/14/2012 03:18 AM, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> As follow-up to "dt: introduce of_get_child_by_name to get child node by
>> name." patch, This patch removes some of the code duplication in the
>> driver by replacing it with of_get_child_by_name instead.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>> ---
>>  arch/powerpc/kernel/prom.c |    5 +----
>>  1 files changed, 1 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index f191bf0..80e5b6c 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -735,7 +735,6 @@ void __init early_init_devtree(void *params)
>>   */
>>  struct device_node *of_find_next_cache_node(struct device_node *np)
>>  {
>> -	struct device_node *child;
>>  	const phandle *handle;
>>  
>>  	handle = of_get_property(np, "l2-cache", NULL);
>> @@ -749,9 +748,7 @@ struct device_node *of_find_next_cache_node(struct device_node *np)
>>  	 * beneath CPU nodes.
>>  	 */
>>  	if (!strcmp(np->type, "cpu"))
>> -		for_each_child_of_node(np, child)
>> -			if (!strcmp(child->type, "cache"))
> name and type are not the same thing.
>
> Rob
>
>> -				return child;
>> +		return of_get_child_by_name(np, "cache");
>>  
>>  	return NULL;
>>  }
>>
>
>
