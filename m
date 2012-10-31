From: Daniel Mack <zonque@gmail.com>
Subject: Re: Merging device trees at runtime for module-based
	systems
Date: Thu, 01 Nov 2012 00:21:16 +0100
Message-ID: <5091B26C.4070505@gmail.com>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
	<5091AD78.3060701@gmail.com> <5091B095.9080704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5091B095.9080704@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, u-boot@lists.denx.de, Jerry Van Baren <vanbaren@cideas.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On 01.11.2012 00:13, Stephen Warren wrote:
> On 10/31/2012 05:00 PM, Daniel Mack wrote:
>> cc devicetree-discuss. Here's a reference to the full thread:
>>
>>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/
>>
>> On 26.10.2012 20:39, Stephen Warren wrote:
>>> On 10/24/2012 03:47 AM, Daniel Mack wrote:
>>>> Hi,
>>>>
>>>> a project I'm involved in uses a module/baseboard combo, and components
>>>> on either board are described in DT. I'm currently using separate dts
>>>> files which build upon each other with include statements, which works
>>>> fine for development.
>>>>
>>>> In production though, we will certainly have running changes (and hence
>>>> different versions) over the lifetime of the product for both the
>>>> baseboard and the module, and the hardware has support for identifying
>>>> the versions of both sides at runtime.
>>>>
>>>> So let's say we have n versions of the baseboard and m versions of the
>>>> module, we would much like to only prepare n + m files, instead of n * m
>>>> by pre-compiling every possible combination (some of which may actually
>>>> never occur 'in the wild').
>>>>
>>>> So my question is: is it possible to do that kind of assembly of a
>>>> number of files at runtime in U-Boot? I guess all it takes is merging a
>>>> number of trees together, right? I browsed through the APIs but couldn't
>>>> yet find an clear approach to that kind of problem. If not, what would
>>>> it take to add that functionality? I can probably help with the
>>>> implementation if someone tells me what would be the right way.
>>>
>>> Yes, solving this would be very useful; it's a wide-spread problem.
>>>
>>> Some thoughts though:
>>>
>>> Simply overlaying two DTBs on top of each-other (in the same fashion
>>> that dtc's /include/ statement would do at compile-time) might not be
>>> fully general enough, although perhaps it would be sufficient for your
>>> immediate needs.
>>>
>>> For example, lets say that a GPIO is routed from a device on the main
>>> board to a device on a daughter board, or even from one daughter board
>>> into the main board and back out to a different daughter board. Now,
>>> consider that the different board(s) that are the source of the GPIO
>>> might use completely different SoCs or versions of the SoC, which might
>>> require using a different GPIO specifier to represent the signal. That
>>> means you need to change the .dtb file for the "client" of the GPIO
>>> depending on the HW or .dtb that provides the GPIO. That's certainly not
>>> a simple matter of merging multiple .dtb blobs together.
>>
>> Hmm. After implementing a very simple overlay approach, I can now see
>> your point :) Yes in fact, that's a real problem.
>>
>>> The same issue could easily apply to I2C or SPI buses, chip selects, etc.
>>>
>>> One solution would be to explicitly represent a connector or
>>> connection-point in DT, such that the connector can implement the naming
>>> of all signals that pass through it, and provide a translation point for
>>> hooking the two DT fragments together. This seems within the spirit of DT.
>>
>> Yes, but you still can't handle references that way.
>>
>> Let me try and conclude this for others. Say the "module" tree "A" looks
>> something like this:
>>
>> 	/ {
>> 		multi-regulator {
>> 			vcc1v8: regulator@0 {
>> 				/* ... */
>> 			};
>> 		};
>> 	};
>>
>> ... and the baseboard ("B"), that makes use of (and hence depends on)
>> the module, has something like this:
>>
>> 	/ {
>> 		consumer {
>> 			main-supply = <&vcc1v8>;
>> 		};
>> 	};
>>
>> Now, let's say in a subsequent version of the module, we change whatever
>> provides that supply for 1.8 volts, but the consumer on the baseboard
>> shouldn't care much of course, thanks to all the abstraction layers that
>> we have now in the kernel.
>>
>> However, the problem here is that I can't just compile trees A and B
>> individually into .dtbs that get merged later, because dtc will bail on
>> the unresolved reference of &vcc1v8 of course. And cases like this are
>> the whole reason why I started to think about modularization of trees in
>> the first place.
>>
>> So the simple overlay method doesn't help here at all, even though I can
>> share the code if anyone's interested.
> 
> Yes, you've understood me exactly.
> 
> The connector-base approach I was thinking about might look (very very)
> roughly as follows:
> 
> main board:
> 
> 	/ {
> 		multi-regulator {
> 			vcc1v8: regulator@0 {
> 				/* ... */
> 			};
> 		};
> 		connector {
> 			compatible = "vendor,board-socket-a";
> 			vcc1v8-supply = <&vcc1v8>;
> 		};
> 	};
> 
> child board:
> 
> 	/ {
> 		connector {
> 			compatible = "vendor,board-plug-a";
> 			vcc1v8: regulator {
> 			};
> 		};
> 		consumer {
> 			main-supply = <&vcc1v8>;
> 		};
> 	};

... which doesn't eally make the individual bits more readable.

> ... plus some logic so that the "driver"s for the two connector nodes
> get linked together, such that the code forwards "requests" for the
> regulator that the plug receives on to the node for the socket, which
> then lists the actual provider.
> 
> Obviously, the above DT is an extremely rough sketch, and we need to
> think about:
> 
> a) Exactly how the plug/socket get linked together.
> 
> b) Can we make a generic driver for the plug/socket, so we don't have to
> write a driver for each board's connector design. The driver would have
> to forward all kinds of regulator, GPIO, interrupt, ... requests it
> receives at one node, on to the node that's listed in the other
> connector node. Kinda like "ranges" but for arbitrary resources, not
> just memory maps, in a way.

I really wonder if that's not fixing the wrong end after all. I mean, in
dts files and using includes, all this works just beautifully, and what
I really want is the same kind of flexibility in the bootloader.

Any good reason for not doing the dt complilation at runtime? For the
include issue, one could argue that /include/ statements are not
allowed, but the same behaviour can be achieved by simply concatinating
all the dts files right away.


Daniel
