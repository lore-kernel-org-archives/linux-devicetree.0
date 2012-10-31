From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [U-Boot] Merging device trees at runtime for module-based systems
Date: Wed, 31 Oct 2012 13:56:26 -1000
Message-ID: <5091BAAA.5010809@firmworks.com>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
 <5091AD78.3060701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5091AD78.3060701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/31/2012 1:00 PM, Daniel Mack wrote:
> cc devicetree-discuss. Here's a reference to the full thread:
> 
>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/
> 
> On 26.10.2012 20:39, Stephen Warren wrote:
>> On 10/24/2012 03:47 AM, Daniel Mack wrote:
>>> Hi,
>>>
>>> a project I'm involved in uses a module/baseboard combo, and components
>>> on either board are described in DT. I'm currently using separate dts
>>> files which build upon each other with include statements, which works
>>> fine for development.
>>>
>>> In production though, we will certainly have running changes (and hence
>>> different versions) over the lifetime of the product for both the
>>> baseboard and the module, and the hardware has support for identifying
>>> the versions of both sides at runtime.
>>>
>>> So let's say we have n versions of the baseboard and m versions of the
>>> module, we would much like to only prepare n + m files, instead of n * m
>>> by pre-compiling every possible combination (some of which may actually
>>> never occur 'in the wild').
>>>
>>> So my question is: is it possible to do that kind of assembly of a
>>> number of files at runtime in U-Boot? I guess all it takes is merging a
>>> number of trees together, right? I browsed through the APIs but couldn't
>>> yet find an clear approach to that kind of problem. If not, what would
>>> it take to add that functionality? I can probably help with the
>>> implementation if someone tells me what would be the right way.
>>
>> Yes, solving this would be very useful; it's a wide-spread problem.
>>
>> Some thoughts though:
>>
>> Simply overlaying two DTBs on top of each-other (in the same fashion
>> that dtc's /include/ statement would do at compile-time) might not be
>> fully general enough, although perhaps it would be sufficient for your
>> immediate needs.
>>
>> For example, lets say that a GPIO is routed from a device on the main
>> board to a device on a daughter board, or even from one daughter board
>> into the main board and back out to a different daughter board. Now,
>> consider that the different board(s) that are the source of the GPIO
>> might use completely different SoCs or versions of the SoC, which might
>> require using a different GPIO specifier to represent the signal. That
>> means you need to change the .dtb file for the "client" of the GPIO
>> depending on the HW or .dtb that provides the GPIO. That's certainly not
>> a simple matter of merging multiple .dtb blobs together.
> 
> Hmm. After implementing a very simple overlay approach, I can now see
> your point :) Yes in fact, that's a real problem.
> 
>> The same issue could easily apply to I2C or SPI buses, chip selects, etc.
>>
>> One solution would be to explicitly represent a connector or
>> connection-point in DT, such that the connector can implement the naming
>> of all signals that pass through it, and provide a translation point for
>> hooking the two DT fragments together. This seems within the spirit of DT.
> 
> Yes, but you still can't handle references that way.
> 
> Let me try and conclude this for others. Say the "module" tree "A" looks
> something like this:
> 
> 	/ {
> 		multi-regulator {
> 			vcc1v8: regulator@0 {
> 				/* ... */
> 			};
> 		};
> 	};
> 
> ... and the baseboard ("B"), that makes use of (and hence depends on)
> the module, has something like this:
> 
> 	/ {
> 		consumer {
> 			main-supply = <&vcc1v8>;
> 		};
> 	};
> 
> Now, let's say in a subsequent version of the module, we change whatever
> provides that supply for 1.8 volts, but the consumer on the baseboard
> shouldn't care much of course, thanks to all the abstraction layers that
> we have now in the kernel.
> 
> However, the problem here is that I can't just compile trees A and B
> individually into .dtbs that get merged later, because dtc will bail on
> the unresolved reference of &vcc1v8 of course. And cases like this are
> the whole reason why I started to think about modularization of trees in
> the first place.
> 
> So the simple overlay method doesn't help here at all, even though I can
> share the code if anyone's interested.
> 
>> Another solution might be some form of variables/macros/code in the DTB
>> that can be used to parameterize other DTBs that get merged with it.
>> This is probably an enormous can of worms.
> 
> Yes, exactly, a can of worms and most probably unmaintainble in real
> life. I start to believe that the cleanest solution to this would be to
> have full DTC functionality in U-Boot and compile the tree

... which is exactly the way that Open Firmware does it, since the
invention of the device tree.  The model is that the boot firmware,
which needs to know the system configuration to do its job anyway,
exports that configuration via the device tree.

 from dts, but
> then again I have no clue on how to handle the file lookups that arise
> from includes. Do you think it would it be worth going that way?
> 
> If not, I guess we're down to n*m files eventually, which is really sad
> as they might even become a storage problem at some point.
> 
> 
> Thanks for your input,
> Daniel
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
