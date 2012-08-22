From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device tree node names
Date: Wed, 22 Aug 2012 13:20:19 -0500
Message-ID: <503522E3.2050900@gmail.com>
References: <502D4B28.4020108@wwwdotorg.org> <502D67DF.7010605@firmworks.com>
 <5034F870.2010604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5034F870.2010604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/22/2012 10:19 AM, Stephen Warren wrote:
> Grant, Rob, Segher, Arnd, Olof,
> 
> Can you please state if you agree with Mitch's opinion below? Thanks.
> 
> On 08/16/2012 03:36 PM, Mitch Bradley wrote:
>> On 8/16/2012 9:34 AM, Stephen Warren wrote:
>>> As I understand it, there is a rule when writing device tree files (and
>>> bindings) that nodes should be named after the type of object they
>>> represent, and not the particular instance of the object. Related, node
>>> names should not be interpreted as data.
>>>
>>> This rules makes perfect sense when talking about nodes on a bus that
>>> represent devices; something like:
>>>
>>>     i2c@7000c000 {
>>>         compatible = "nvidia,tegra20-i2c";
>>>         reg = <0x7000c000 0x100>;
>>>         ...
>>>     };
>>>
>>>     i2c@7000c400 {
>>>         compatible = "nvidia,tegra20-i2c";
>>>         reg = <0x7000c400 0x100>;
>>>         ...
>>>     };
>>>
>>> However, when nodes are being used to represent configuration
>>> information inside a device node, or even when representing
>>> pseudo-devices that don't directly exist on a specific bus, this rules
>>> becomes quite annoying.
>>>
>>> As an example, consider a device that contains 10 voltage regulators
>>> (named "ldon" in the chip documentation), and each needs some
>>> configuration provided through DT. A simple binding might result in:
>>>
>>>     i2c@7000c000 {
>>>         ldo0 {
>>>             ... (configuration data here)
>>>         };
>>>         ldo1 {
>>>             ...
>>>         };
>>>         ...
>>>     };
>>>
>>> Where regulator "name"'s configuration is encoded into node "name".
>>>
>>> Instead, if we follow this rule precisely, we end up with something more
>>> like:
>>>
>>>     i2c@7000c000 {
>>>         #address-cells = <1>;
>>>         #size-cells = <0>;
>>>
>>>         ldo@0 {
>>>             reg = <0>;
>>>             regulator-id = "ldo0";
>>>             ...
>>>         };
>>>         ldo@1 {
>>>             reg = <1>;
>>>             regulator-id = "ldo1";
>>>             ...
>>>         };
>>>         ...
>>>     };
>>>
>>> This is a fair bit more wordy, and the only advantage appears to be that
>>> it correctly conforms to some apparently arbitrary rule for node naming.
>>>
>>> Similar situations exist when describing the set of power sequences
>>> needed to enable/disable a device [1] or pinctrl configurations (see
>>> Linux kernel file arch/arm/boot/dts/tegra20-harmony.dts, node
>>> /pinmux/pinmux where I haven't actually followed this rule correctly) etc.
>>>
>>> So, my question is: Can/should we relax this rule? Can we allow drivers
>>> (bindings) to require specific node names for things, lookup up specific
>>> configuration data by node name and/or enumerate all nodes, and parse
>>> data out of the node names (e.g. the value n for nodes named LDOn in the
>>> above example)?
>>
>> As far as I'm concerned, within the privacy of your own node, you can do
>> whatever you want.  Perhaps others will disagree...
> 
> If everyone agrees with this, it'll certainly give a lot more
> flexibility for individual bindings to come up with simple
> representations for configuration data within their own node.
> 
> Nodes that represent addressable buses would of course continue to use
> standardized conventions in my opinion.

I don't really have a strong opinion on this. So I guess I'm okay with
it, but I still reserve the right to object to how it gets (ab)used. :)

In fact, the nodes for the highbank clocks does exactly this. In this
case it is only used to get the clock names when no clock-output-names
property is present.

Rob

>> The main "rule" for node names is that a user browsing the device tree
>> can easily determine what something is.  Thus "ethernet" instead of
>> "DEC,21140".
>>
>> As an historical note, in early Open Boot, it was just the other way
>> around.  I originally thought that node names should be precise - and
>> the ill-considered "device_type" property gave the "generic"
>> identification.   But it soon became clear that "precise" names were
>> neither human-understandable nor actually precise. Pathnames looked like
>> gobbledygook with strings of part numbers that only an expert could
>> remember, and the evolution of part numbers, coupled with companies
>> going out of business and other companies making compatible parts, made
>> "precise" names change semi-randomly.  Thus was born the "generic names"
>> rethink, in which the name became human-meaningful (but generally
>> meaningless to software in any precise sense), device_type was
>> deprecated, and compatible appeared, as a list.
>>
>>>
>>> [1]
>>> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-August/018433.html
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
