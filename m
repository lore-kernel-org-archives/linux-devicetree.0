From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Mon, 02 Jul 2012 11:43:25 -0600
Message-ID: <4FF1DDBD.9050106@wwwdotorg.org>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
 <4FF0A6B6.8040902@gmail.com> <4FF1C567.4060809@wwwdotorg.org>
 <4FF1D8F9.9040005@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF1D8F9.9040005-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/02/2012 11:23 AM, Mitch Bradley wrote:
> On 7/2/2012 5:59 AM, Stephen Warren wrote:
>> On 07/01/2012 01:36 PM, Rob Herring wrote:
>>> On 06/28/2012 06:05 PM, Stephen Warren wrote:
>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> An "enumerated" bus is one that is not memory-mapped, hence hence
>>>> typically has #address-cells=1, and #size-cells=0. Such buses would be
>>>> used to group related non-memory-mapped nodes together, often just
>>>> under
>>>> the top-level of the device tree. The ability to group nodes into a
>>>> non-
>>>> memory-mapped subnode of the root is important, since if nodes exist to
>>>> describe multiple entities of the same type, the nodes will have the
>>>> same name, and hence require a unit address to differentiate them. It
>>>> doesn't make sense to assign bogus unit addresses from the CPU's own
>>>> address space for this purpose. An example:
>>>>
>>>>     regulators {
>>>>         compatible = "enumerated-bus";
>>>>         #address-cells = <1>;
>>>>         #size-cells = <0>;
>>>>
>>>>         regulator@0 {
>>>>             compatible = "regulator-fixed";
>>>>             reg = <0>;
>>>>         };
>>>>
>>>>         regulator@1 {
>>>>             compatible = "regulator-fixed";
>>>>             reg = <1>;
>>>>         };
>>>>     };
>>>>
>>>> Finally, because such buses are not memory-mapped, we avoid creating
>>>> any IO/memory resources for the device.
>>>
>>> This seems like a work-around to use reg instead of using cell-index
>>> (which is discouraged). reg in this case is really not a hardware
>>> description. Do you have an intended use or just trying to fix the error
>>> messages?
>>
>> I'm not familiar with cell-index; can you please describe it some more.
>> Looking at some existing files in arch/powerpc/boot/dts, it looks like
>> something that exists alongside reg rather than replacing it, so I don't
>> see how it'd solve the problem.
>>
>> The portion of .dts file quoted above is the use-case. In more general
>> terms, I need to add a bunch of non-memory-mapped devices to DT. There
>> are multiple devices of a given type. The DT node names should be named
>> after the class of device not the instance, and hence all get named the
>> same. Hence, I need a unit address to differentiate the node names.
>> Hence I need to use the reg property in order that the unit address
>> matches the reg property. Is there some other way of solving these
>> requirements other than using a unit address to make the node names
>> unique?
> 
> One of Rob's objections was that, in this case, the reg property is not
> a hardware description.  That's an interesting point.  If in fact
> numerous such devices exist, there must be some mechanism for software
> to choose which device to talk to, typically a number.  Is that the case
> for these devices?  If so, that number is a perfectly valid "reg"
> property value.  If not, how does software choose to talk to a specific
> device?

Yes, the reg value is purely a unique ID that exists to satisfy DT
semantics.

These regulators will eventually be referenced by phandles from the
drivers that use them, just like interrupts/GPIOs/... I just haven't
hooked up any clients that do so yet.
