From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Wed, 20 Jun 2012 10:14:37 -0600
Message-ID: <4FE1F6ED.6060406@wwwdotorg.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com> <4FE0A546.1010707@linaro.org> <4FE0B79D.4090201@wwwdotorg.org> <4FE1772A.2010806@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FE1772A.2010806@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 01:09 AM, Lee Jones wrote:
> On 19/06/12 18:32, Stephen Warren wrote:
>> On 06/19/2012 10:13 AM, Lee Jones wrote:
>>> >  On 19/06/12 15:28, Laxman Dewangan wrote:
>>>> >>  Device's regulator matches their hardware counterparts with the
>>>> >>  property "regulator-compatible" of each child regulator node in
>>>> >>  place of the child node.
>>>> >>  Add the property "regulator-compatible" for each regulator with
>>>> >>  their name.
>>>> >>
>>>> >>  Signed-off-by: Laxman Dewangan<ldewangan@nvidia.com>
>>>> >>  ---
>>>> >>  Changes from V1:
>>>> >>     - This is new change in V2.
>>>> >>
>>>> >>     arch/arm/boot/dts/db8500.dtsi |  128
>>>> >>  +++++++++++++++++++++++++++++++----------
>>>> >>     1 files changed, 97 insertions(+), 31 deletions(-)
>>>> >>
>>>> >>  diff --git a/arch/arm/boot/dts/db8500.dtsi
>>>> >>  b/arch/arm/boot/dts/db8500.dtsi
>>>> >>  index 4ad5160..9548f80 100644
>>>> >>  --- a/arch/arm/boot/dts/db8500.dtsi
>>>> >>  +++ b/arch/arm/boot/dts/db8500.dtsi
>>>> >>  @@ -203,107 +203,149 @@
>>>> >>
>>>> >>                 db8500-prcmu-regulators {
>>>> >>                     compatible =
>>>> "stericsson,db8500-prcmu-regulator";
>>>> >>  +                #address-cells =<1>;
>>>> >>  +                #size-cells =<0>;
>>> >
>>> >  Why are these and the reg properties required?
>>
>> DT nodes should be named after the type of object they describe (e.g.
>> "regulator") rather than the name of the object they're describing (e.g.
>> "vape").
>>
>> Once you've made that change, you end up with many nodes with the same
>> name in the same parent, so you need to make their names unique. You do
>> this by adding a "unit address" to each of them - "@0", "@1", ... But,
>> in order to be "allowed" to use such a unit address, you need a reg
>> property that matches the unit address, and #address-cells/#size-cells
>> in the parent node.
> 
> I don't like it. By doing this you are preventing any regulator from
> being registered by of_platform_populate().

That isn't true.

The binding for a regulator chip can choose to either use one of two
schemes to identify which regulator the child nodes apply to:

1) Use the regulator-compatible property, and the Linux driver would use
of_regulator_match() to parse the DT.

2) Use the compatible property, and the Linux driver would use
of_platform_populate().

Now, the binding does need to choose the identification scheme up-front,
but simply so that there's a single way to write the binding for the
device; nothing to do with the driver code to parse it.

Note that the way the existing db8500.dtsi regulator binding is defined
already has chosen option (1) above, since there's no compatible
property within each regulator node.

> Also, the nodes are already
> placed under an identifying node "db8500-prcmu-regulators", so we know
> they are regulators, making the regulator@x, the reg property and the
> *-cells properties unnecessary cruft.

What we "know" isn't the issue here; DT is defined such that node names
are supposed to encode the class of device. That's a rule that was
accidentally overlooked here, and we're hoping to correct that.

> I'd prefer to have the second label removed and just to call the
> regulators by their correct name. The property names become functionally
> redundant after the previous patch has been applied in any case.
> 
> Something like this:
> 
>>              db8500-prcmu-regulators {
>>                  compatible = "stericsson,db8500-prcmu-regulator";
>>
>>                  // DB8500_REGULATOR_VAPE
>> -                db8500_vape_reg: db8500_vape {
>> +                db8500_vape {
>> +                    regulator-compatible = "db8500_vape";
>>                      regulator-name = "db8500-vape";
>>                      regulator-always-on;
>>                  };

The node name isn't a label. However, you can in fact remove the label
if you want. Instead of referencing the label in the client node:

	foo = <&db8500_vape_reg ...>;

you can reference the path to the node:

	foo = <&{/soc-u9500/prcmu@80157000/db8500-prcmu-regulators\
/db8500_vape}>;

However, that's quite unwieldy, hence why labels are typically used to
provide a more succinct name. Also, when the nodes are named according
the to DT rules, the last name component is something like
"regulator@0", so isn't very readable.

> It's also a shame we can't do anything about the regulator-name, or
> regulator-compatible property naming conventions. They are almost always
> going to be either extremely similar or even the same. Seems like a bit
> of a wasted property to me at this point.

The two properties name different things:

regulator-compatible names the regulator HW unit within the chip. This
should be invariant across all boards that use this chip; it's something
defined internally to the chip and/or the chip's
documentation/specification. An example might be "LDO1".

regulator-name defines what the regulator is used for in a particular
scenario. This may be the signal name on a particular board's schematic
or similar function name. Examples might be "SDMMC3_VDDIO" or "SD slot
power".
