From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Thu, 28 Jun 2012 08:21:06 -1000
Message-ID: <4FECA092.60307@firmworks.com>
References: <4FEB7A8E.1090409@wwwdotorg.org> <4FEBABE0.2050503@firmworks.com>
 <4FEC994A.4030507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FEC994A.4030507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/28/2012 7:50 AM, Stephen Warren wrote:
> On 06/27/2012 06:57 PM, Mitch Bradley wrote:
>> On 6/27/2012 11:26 AM, Stephen Warren wrote:
>>> I believe I've seen the following construct bandied about as the correct
>>> way of representing a bunch of nodes that have the same name (since they
>>> represent the same type of object) within device-tree.
>>>
>>>      regulators {
>>>          compatible = "simple-bus";
>>>          #address-cells = <1>;
>>>          #size-cells = <0>;
>>>
>>>          regulator@0 {
>>>              compatible = "regulator-fixed";
>>>              reg = <0>;
>>> ...
>>>          };
>>>
>>>          regulator@1 {
>>>              compatible = "regulator-fixed";
>>>              reg = <1>;
>>> ...
>>>          };
>>>      };
>>>
>>> However, when the kernel parses that, it issues messages such as:
>>>
>>> prom_parse: Bad cell count for /regulators/regulator@0
>>> prom_parse: Bad cell count for /regulators/regulator@1
>>
>> The message comes from __of_translate_address(), which has the comment:
>>
>>   * Note: We consider that crossing any level with #size-cells == 0 to mean
>>   * that translation is impossible (that is we are not dealing with a value
>>   * that can be mapped to a cpu physical address). This is not really
>> specified
>>   * that way, but this is traditionally the way IBM at least do things
>>
>> So it seems that the problem only occurs if something tries to translate
>> the regulator's "reg" address to a CPU address.  Is that
>> possible/meaningful
>> in your case?
>
> That's quite likely.
>
> Note that the regulators node is compatible = "simple-bus", and I'm
> doing that so that the child regulator nodes are automatically recursed
> into, and a platform device created for each. Part of creating those
> platform devices is to convert the reg and interrupts properties to
> platform device resources, which is almost certainly what's calling
> __of_translate_address(). This is a compatibility thing on ARM; I guess
> pure OF-style drivers call something like of_get_address()/of_iomap()
> themselves in their probe() function if appropriate, rather than relying
> on calling platform_get_resource(), and hence forcing the DT parsing
> code to convert resources beforehand in all cases, even if not used.
>
> Perhaps simple-bus could be enhanced to detect when size-cells==0 and
> know that this means the bus is really just a container/grouping of
> non-addressed objects, and hence not provide the memory resources. Or,
> perhaps we should introduce a new compatible value that only triggers
> child instantiation but not resource setup, or something like that?

ISTM that if you want different semantics, a different compatible value 
is the best approach.  My mental model is that "simple-bus" has 
memory-mapped children. Perhaps something like "enumerated-bus" for 
non-memory-mapped ?

>
