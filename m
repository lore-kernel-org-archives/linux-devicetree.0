From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [RFC] OF: make of_property_for_each_u32() use parameters if OF
 is not enabled
Date: Mon, 17 Jun 2013 08:59:34 +0200
Message-ID: <51BEB3D6.4090307@linutronix.de>
References: <1371137331-4652-1-git-send-email-bigeasy@linutronix.de>
 <20130615140018.572793E0A2E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130615140018.572793E0A2E@localhost>
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
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/15/2013 04:00 PM, Grant Likely wrote:
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -507,8 +507,8 @@ static inline int of_machine_is_compatible(const char *compat)
>>  
>>  #define of_match_ptr(_ptr)	NULL
>>  #define of_match_node(_matches, _node)	NULL
>> -#define of_property_for_each_u32(np, propname, prop, p, u) \
>> -	while (0)
>> +#define of_property_for_each_u32(np, propname, prop, p, u)	\
> 
> Unrelated whitespace change
> 
>> +	for (prop = NULL, p = NULL; 0; prop++, p++)
> 
> The prop++ and p++ bits should be dropped. It would probably be better

The ++ ensure that gcc does spit a "set but not used warning".

> to move the of_property_for_each_* macros outside the #ifdef/#else block
> and have an empty definition of of_prop_next_string/of_prop_next_u32.

so let me look at that.

> 
> g.
> 

Sebastian
