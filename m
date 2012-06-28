From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Thu, 28 Jun 2012 16:02:09 -0600
Message-ID: <4FECD461.9030802@wwwdotorg.org>
References: <4FEB7A8E.1090409@wwwdotorg.org> <4FEBABE0.2050503@firmworks.com>
 <4FEC994A.4030507@wwwdotorg.org> <4FECA092.60307@firmworks.com>
 <4FECA72F.9080601@firmworks.com> <4FECBE5B.1090300@firmworks.com>
 <4FECC3D5.2030507@wwwdotorg.org> <4FECC569.1000108@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FECC569.1000108-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/28/2012 02:58 PM, Mitch Bradley wrote:
> On 6/28/2012 10:51 AM, Stephen Warren wrote:
>> On 06/28/2012 02:28 PM, Mitch Bradley wrote:
...
>>> Hmmm.
>>>
>>> 1) The "KERN_ERR "prom_parse: Bad cell count ..." message is
>>> presumptuous, if one treats failure of of_translate_address() other than
>>> as a hard failure.  So if the device naming heuristic were to be
>>> improved as suggested above, that message should probably be removed, or
>>> at least downgraded to a warning or debug message.
>>>
>>> 2) of_get_address() also uses OF_CHECK_COUNTS(), which is unhappy with
>>> #size-cells == 0.  That's not right.  #size-cells==0 is perfectly
>>> reasonable for enumerated children and should be supported.
>>>
>>> I'm reasonably certain that the right fix is simply to remove:
>>>
>>>      if (!OF_CHECK_COUNTS(na, ns))
>>>          return NULL;
>>>
>>> from of_get_address().  I looked at all of the places that use
>>> of_get_address().  With two exceptions, of_get_address() is followed by
>>> of_translate_address(), which will (correctly) fail if #size-cells is 0.
>>>   The two exceptions are for devices that can only exist below specific
>>> buses, which presumably are known to have nonzero #size-cells.
>>
>> There's more needed than that:-(
>>
>> I think of_get_address() still wants to check the address-cells value.
>> Splitting up OF_CHECK_COUNTS as follows:
>>
>> #define OF_CHECK_ADDR_COUNTS(na) ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
>> #define OF_CHECK_COUNTS(na, ns)    (OF_CHECK_ADDR_COUNTS(na) && (ns) > 0)
>>
>> ... and using OF_CHECK_ADDR_COUNTS in place of OF_CHECK_COUNTS in
>> of_get_address() would allow that.
> 
> I agree.
> 
>> However, that still leaves of_device_make_bus_id() calling
>> of_translate_address() in order to generate the device name. That will
>> issue the diagnostic and fall back to the global counter.
> 
> My suggestion was to eliminate the diagnostic message or downgrade it to
> warning or debug level.  Then the naming heuristic would be:
> 
>    First try of_translate_address() to get a globally-unique address.
>    Failing that, try of_get_address() to get a locally-unique bound
>      address.
>    Failing that, use a counter.

Ah yes.

I'd somewhat prefer to avoid calling of_translate_address() when we
know it's going to fail though, by passing a parameter to
of_device_make_bus_id() indicating whether to use that or
of_get_address(). The parameter would be set based on enumerated-bus vs.
any other bus type. I coded that locally and it seems to work OK. That
way, the diagnostic in of_translate_address() can be left unchanged; it
seems like it really is an error.

>> It seems like
>> we could make of_device_make_bus_id() call of_get_address() instead of
>> of_translate_address(). However, that would only give the value of the
>> reg property, and not apply the translations all the way to the top of
>> the tree. That in turn means that the following two nodes would be named
>> the same:
...
>> But that would still expose us to the same non-unique-name issue if
>> those were enumerated buses:
>>
>> / {
>>      container-a {
>>          compatible = "enumerated-bus";
>>          ranges = <...>;
>>          regulator {
>>              reg = <0>;
>>          };
>>      };
>>      container-b {
>>          compatible = "enumerated-bus";
>>          ranges = <...>;
>>          regulator {
>>              reg = <0>;
>>          };
>>      };
>> };
>>
>> Do we need to include the full DT path to an enumerated device, or some
>> other unique data for the node's bus, in the device name of a child of
>> an enumerated bus?
> 
> I don't know.  Is the device name space flat?

Hmmm. It depends on where you look.

I end up with /sys/devices/regulators.3/[01].regulator/ this way, the
path structure of which is defined by the parent/child device
relationship, and implies that device names are relative to their parent.

However, device names are treated as a flat namespace in many other
places. For example, clocks, regulators, pinctrl settings, etc. are
looked up by device name, and the names in the lookup tables are just
the device name itself, with no reference to the device's parent.
