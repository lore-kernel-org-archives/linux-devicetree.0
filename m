From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Thu, 28 Jun 2012 10:58:17 -1000
Message-ID: <4FECC569.1000108@firmworks.com>
References: <4FEB7A8E.1090409@wwwdotorg.org> <4FEBABE0.2050503@firmworks.com>
 <4FEC994A.4030507@wwwdotorg.org> <4FECA092.60307@firmworks.com>
 <4FECA72F.9080601@firmworks.com> <4FECBE5B.1090300@firmworks.com>
 <4FECC3D5.2030507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FECC3D5.2030507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On 6/28/2012 10:51 AM, Stephen Warren wrote:
> On 06/28/2012 02:28 PM, Mitch Bradley wrote:
>> On 6/28/2012 8:49 AM, Mitch Bradley wrote:
>>> On 6/28/2012 8:21 AM, Mitch Bradley wrote:
>>>> On 6/28/2012 7:50 AM, Stephen Warren wrote:
>>>>> On 06/27/2012 06:57 PM, Mitch Bradley wrote:
>>>>>> On 6/27/2012 11:26 AM, Stephen Warren wrote:
>>>>>>> I believe I've seen the following construct bandied about as the
>>>>>>> correct
>>>>>>> way of representing a bunch of nodes that have the same name (since
>>>>>>> they
>>>>>>> represent the same type of object) within device-tree.
>>>>>>>
>>>>>>>       regulators {
>>>>>>>           compatible = "simple-bus";
>>>>>>>           #address-cells = <1>;
>>>>>>>           #size-cells = <0>;
>>>>>>>
>>>>>>>           regulator@0 {
>>>>>>>               compatible = "regulator-fixed";
>>>>>>>               reg = <0>;
>>>>>>> ...
>>>>>>>           };
>>>>>>>
>>>>>>>           regulator@1 {
>>>>>>>               compatible = "regulator-fixed";
>>>>>>>               reg = <1>;
>>>>>>> ...
>>>>>>>           };
>>>>>>>       };
>>>>>>>
>>>>>>> However, when the kernel parses that, it issues messages such as:
>>>>>>>
>>>>>>> prom_parse: Bad cell count for /regulators/regulator@0
>>>>>>> prom_parse: Bad cell count for /regulators/regulator@1
>>>>>>
>>>>>> The message comes from __of_translate_address(), which has the
>>>>>> comment:
>>>>>>
>>>>>>    * Note: We consider that crossing any level with #size-cells == 0
>>>>>> to mean
>>>>>>    * that translation is impossible (that is we are not dealing with a
>>>>>> value
>>>>>>    * that can be mapped to a cpu physical address). This is not really
>>>>>> specified
>>>>>>    * that way, but this is traditionally the way IBM at least do things
>>>>>>
>>>>>> So it seems that the problem only occurs if something tries to
>>>>>> translate
>>>>>> the regulator's "reg" address to a CPU address.  Is that
>>>>>> possible/meaningful
>>>>>> in your case?
>>>>>
>>>>> That's quite likely.
>>>>>
>>>>> Note that the regulators node is compatible = "simple-bus", and I'm
>>>>> doing that so that the child regulator nodes are automatically recursed
>>>>> into, and a platform device created for each. Part of creating those
>>>>> platform devices is to convert the reg and interrupts properties to
>>>>> platform device resources, which is almost certainly what's calling
>>>>> __of_translate_address(). This is a compatibility thing on ARM; I guess
>>>>> pure OF-style drivers call something like of_get_address()/of_iomap()
>>>>> themselves in their probe() function if appropriate, rather than
>>>>> relying
>>>>> on calling platform_get_resource(), and hence forcing the DT parsing
>>>>> code to convert resources beforehand in all cases, even if not used.
>>>>>
>>>>> Perhaps simple-bus could be enhanced to detect when size-cells==0 and
>>>>> know that this means the bus is really just a container/grouping of
>>>>> non-addressed objects, and hence not provide the memory resources. Or,
>>>>> perhaps we should introduce a new compatible value that only triggers
>>>>> child instantiation but not resource setup, or something like that?
>>>>
>>>> ISTM that if you want different semantics, a different compatible value
>>>> is the best approach.  My mental model is that "simple-bus" has
>>>> memory-mapped children. Perhaps something like "enumerated-bus" for
>>>> non-memory-mapped ?
>>>
>>>
>>> I just looked at the code in platform.c that calls
>>> of_translate_address() (in of_device_make_bus_id()).  It appears that
>>> the reason for translating the address is to create a unique device name
>>> via:
>>>
>>>       dev_set_name(dev, "%llx.%s", addr, node->name);
>>>
>>> Failure of_translate_address() is not treated as an error, rather the
>>> code falls back to naming the device with an incrementing number:
>>>
>>>       dev_set_name(dev, "%s.%d", node->name, magic - 1);
>>>
>>> Perhaps the solution is add an additional step to the heuristic.  If
>>> of_translate_address() fails, try to use the untranslated reg property
>>> value to make the name unique, generating a name like:
>>>
>>>       name.N,M
>>>
>>> where N,M is a list of #address-cells numbers from the first entry of
>>> the reg property value.
>>>
>>> That would be better than the existing heuristic (which includes the
>>> phrase "(and pray ...)" in its commentary), and fully consistent with
>>> device tree dogma.
>>>
>>> One could still add a new compatible value to distinguish that from a
>>> "simple-bus", as platform.c has a match table that includes simple-bus
>>> and others.  The heuristic for making the unique name is not contingent
>>> upon a specific bus name.
>>
>>
>> Hmmm.
>>
>> 1) The "KERN_ERR "prom_parse: Bad cell count ..." message is
>> presumptuous, if one treats failure of of_translate_address() other than
>> as a hard failure.  So if the device naming heuristic were to be
>> improved as suggested above, that message should probably be removed, or
>> at least downgraded to a warning or debug message.
>>
>> 2) of_get_address() also uses OF_CHECK_COUNTS(), which is unhappy with
>> #size-cells == 0.  That's not right.  #size-cells==0 is perfectly
>> reasonable for enumerated children and should be supported.
>>
>> I'm reasonably certain that the right fix is simply to remove:
>>
>>      if (!OF_CHECK_COUNTS(na, ns))
>>          return NULL;
>>
>> from of_get_address().  I looked at all of the places that use
>> of_get_address().  With two exceptions, of_get_address() is followed by
>> of_translate_address(), which will (correctly) fail if #size-cells is 0.
>>   The two exceptions are for devices that can only exist below specific
>> buses, which presumably are known to have nonzero #size-cells.
>
> There's more needed than that:-(
>
> I think of_get_address() still wants to check the address-cells value.
> Splitting up OF_CHECK_COUNTS as follows:
>
> #define OF_CHECK_ADDR_COUNTS(na) ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
> #define OF_CHECK_COUNTS(na, ns)	(OF_CHECK_ADDR_COUNTS(na) && (ns) > 0)
>
> ... and using OF_CHECK_ADDR_COUNTS in place of OF_CHECK_COUNTS in
> of_get_address() would allow that.

I agree.

>
> However, that still leaves of_device_make_bus_id() calling
> of_translate_address() in order to generate the device name. That will
> issue the diagnostic and fall back to the global counter.


My suggestion was to eliminate the diagnostic message or downgrade it to 
warning or debug level.  Then the naming heuristic would be:

    First try of_translate_address() to get a globally-unique address.
    Failing that, try of_get_address() to get a locally-unique bound 
address.
    Failing that, use a counter.


It seems like
> we could make of_device_make_bus_id() call of_get_address() instead of
> of_translate_address(). However, that would only give the value of the
> reg property, and not apply the translations all the way to the top of
> the tree. That in turn means that the following two nodes would be named
> the same:
>
> / {
>      bus-a {
>          compatible = "simple-bus";
>          ranges = <...>;
>          foo {
>              reg = <0x8000>;
>          };
>      };
>      bus-b {
>          compatible = "simple-bus";
>          ranges = <...>;
>          foo {
>              reg = <0x8000>;
>          };
>      };
> };
>
> ... since they have the same bus-local offset.
>
> So, at /least/ we could only make that switch for nodes that were
> children of an "enumerated-bus" and not a "simple-bus". That'd be pretty
> easy to code up.
>
> But that would still expose us to the same non-unique-name issue if
> those were enumerated buses:
>
> / {
>      container-a {
>          compatible = "enumerated-bus";
>          ranges = <...>;
>          regulator {
>              reg = <0>;
>          };
>      };
>      container-b {
>          compatible = "enumerated-bus";
>          ranges = <...>;
>          regulator {
>              reg = <0>;
>          };
>      };
> };
>
> Do we need to include the full DT path to an enumerated device, or some
> other unique data for the node's bus, in the device name of a child of
> an enumerated bus?


I don't know.  Is the device name space flat?
