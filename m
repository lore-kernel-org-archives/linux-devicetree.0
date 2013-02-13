From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Wed, 13 Feb 2013 08:23:28 -0600
Message-ID: <511BA1E0.9000404@gmail.com>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
 <1360570940-17086-2-git-send-email-thierry.reding@avionic-design.de>
 <511949C7.7070604@gmail.com>
 <20130212064523.GA28850@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130212064523.GA28850-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/12/2013 12:45 AM, Thierry Reding wrote:
> On Mon, Feb 11, 2013 at 01:43:03PM -0600, Rob Herring wrote:
>> On 02/11/2013 02:22 AM, Thierry Reding wrote:
>>> From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>

>>> @@ -13,6 +13,7 @@
>>>  #define OF_CHECK_COUNTS(na, ns)	(OF_CHECK_ADDR_COUNT(na) && (ns) > 0)
>>>  
>>>  static struct of_bus *of_match_bus(struct device_node *np);
>>> +static struct of_bus *of_find_bus(const char *name);
>>
>> Can you move this function up to avoid the forward declaration.
> 
> It needs to be defined after the of_busses structure, which is defined
> below the CONFIG_PCI block where of_pci_process_ranges() is defined. I'd
> have to move that one as well and add another #ifdef CONFIG_PCI section.
> If you prefer that I can do that.

Okay, it's fine as is.

>>> +static struct of_bus *of_find_bus(const char *name)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(of_busses); i++)
>>> +		if (strcmp(name, of_busses[i].name) == 0)
>>                                               ^
>> space needed.
> 
> I don't understand. Do you want the space to go between '.' and "name"?

Must have been some dirt on my screen... Never mind.

I'll apply these for 3.9.

Rob

> 
> Thierry
> 
