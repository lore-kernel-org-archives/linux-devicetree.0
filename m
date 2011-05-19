From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Pinmux with device tree
Date: Thu, 19 May 2011 09:59:57 -1000
Message-ID: <4DD576BD.7090307@firmworks.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
	<4DD41F02.4050108@firmworks.com>
	<BANLkTim94SKgWvUF6_PWb9O5YsuNk120Bw@mail.gmail.com>
	<20110519171029.GH3085@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110519171029.GH3085-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/19/2011 7:10 AM, Grant Likely wrote:
> On Thu, May 19, 2011 at 07:30:52PM +0800, Haojian Zhuang wrote:
>> On Thu, May 19, 2011 at 3:33 AM, Mitch Bradley<wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>  wrote:
>>> On 5/18/2011 6:34 AM, Simon Glass wrote:
>>>>
>>>> Hi,
>>>>
>>>> I see a new pinmux system in the LKML. Has anyone looked at how to
>>>> represent pinmux settings in the device tree?
>>>>
>>>> On a related topic, the examples that are used for GPIOs assume a
>>>> flags word which describes things like pull-ups, direction, etc. This
>>>> seems pretty cumbersome and gets worse with pinmuxes. People editing
>>>> the device trees want to see symbolic information rather than a coded
>>>> number, a bit like a #define. I can see this can be done with strings
>>>> but this is inefficient in time and space, and is error-prone.  Is
>>>> there support for this in device trees that I have missed?
>
> Why is it error prone?  It is probably less error prone than using
> magic integer values.  :-)  As for time and space inefficiencies,
> we're talking about tiny amounts of data and processors now in the GHz
> range with GBs of memory.  The time and space required is pretty much
> in the noise.


Ideally, the device tree is exported by the firmware, whose storage 
device is often much much smaller than the RAM size.  Since I began 
doing firmware, average RAM sizes have increased by a factor of 4000 and 
RAM speed has increased by a factor of about 1000.  In that time, boot 
ROM size has increased by a factor of about 8 and the speed, in some 
cases, has decreased.

During a substantial portion of the firmware startup sequence, the CPU 
may be executing in a crippled mode, with caches unavailable.

On my current project, I have to fit everything in 1 MiB of slow SPI 
FLASH.  "Everything" includes microcode wads for things like the 
wireless module, extensive manufacturing and field diagnostics for every 
hardware device, crypto code and keys for boot security, drivers for 
on-board devices and a myriad of USB devices, sound clips for a startup 
jingle, graphics images for "pretty boot" and for language-neutral 
reporting of diagnostic results, unit-specific manufacturing info, 
filesystem and network protocol code, and a wireless multicast facility 
for mass updating of the OS onto an arbitrary number of units.

So, in my world, space is always an issue.


>
> A bigger issue is the fact that a GPIO binding has already been
> established using integers.  To change it to something else must be
> done in such a way as to not break existing users.
>
> However, pinmux description is entirely orthogonal to GPIO
> controllers.  The gpio binding is about matching gpio consumers to
> gpio providers.  It says nothing about how the gpios are actually
> routed on the chip.
>
> A pinmux binding is more about the specific configuration of the
> chip, and is very likely going to be something chip specific,
> although there may be some common infrastructure and patterns for
> describing the functionality.  I have no problem with defining a new
> binding for describing pinmux.
>
> I'll be very nervous if I see any implementation that tries to encode
> pinmux information into the gpio binding.
>
>>>
>>> Open Firmware deals with this by defining both a numerical representation
>>> and a text representation.  The numerical representation appears in memory
>>> in device tree property values, and the corresponding text representation is
>>> for display and human input.
>>>
>> Could it be supported by flattened device tree? It seems that open firmware
>> isn't popular in ARM system.
>
> The flat tree is directly derived from the Open Firmware design.  Yes,
> this could be expressed by device tree, however we don't have any
> syntax for the dt compiler right now to support the use case.  Plus,
> I want to tread carefully here since it may also be possible that
> firmware will want to modify the data, and it becomes a lot more
> complex if it needs to keep two separate representations within the
> same tree in sync.
>
> One option would be to allow interrupt controllers to have a static
> lookup property which matches bitfields in the interrupt specifier
> with human readable names.
>
> g.
>
