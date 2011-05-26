From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Pinmux with device tree
Date: Wed, 25 May 2011 20:43:27 -0700
Message-ID: <BANLkTi=ws+018nu6egtufCgr_tFCDamQng@mail.gmail.com>
References: <BANLkTin5wBtR4zkgsQ6dw1jQP8yQGCDS2Q@mail.gmail.com>
	<4DD41F02.4050108@firmworks.com>
	<BANLkTim94SKgWvUF6_PWb9O5YsuNk120Bw@mail.gmail.com>
	<20110519171029.GH3085@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 19, 2011 at 10:10 AM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, May 19, 2011 at 07:30:52PM +0800, Haojian Zhuang wrote:
>> On Thu, May 19, 2011 at 3:33 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
>> > On 5/18/2011 6:34 AM, Simon Glass wrote:
>> >>
>> >> Hi,
>> >>
>> >> I see a new pinmux system in the LKML. Has anyone looked at how to
>> >> represent pinmux settings in the device tree?
>> >>
>> >> On a related topic, the examples that are used for GPIOs assume a
>> >> flags word which describes things like pull-ups, direction, etc. This
>> >> seems pretty cumbersome and gets worse with pinmuxes. People editing
>> >> the device trees want to see symbolic information rather than a coded
>> >> number, a bit like a #define. I can see this can be done with strings
>> >> but this is inefficient in time and space, and is error-prone. =A0Is
>> >> there support for this in device trees that I have missed?
>
> Why is it error prone? =A0It is probably less error prone than using
> magic integer values. =A0:-) =A0As for time and space inefficiencies,
> we're talking about tiny amounts of data and processors now in the GHz
> range with GBs of memory. =A0The time and space required is pretty much
> in the noise.

It strikes me that for a pinmux I want to say:

<&pingroup_gaa spi2 pullup normal>
<&pingroup_gab spi2 pullup tristatel>

or similar, with some definitions something like:

spi2: #4
pullup: #1
normal: #0
tristate: #0

The same for GPIOs since specifying an integer with bitflags is not
great for humans.

>
> A bigger issue is the fact that a GPIO binding has already been
> established using integers. =A0To change it to something else must be
> done in such a way as to not break existing users.

Well we could support bitfields:

bitfield gpio 0:0 {input, output}
bitfield pull 2:1 {normal, reserved, pulldown, pullup}
bitfield tristate 3:3 {tristate, normal}

then some magic could piece it together into a cell:

<&gpio32> <gpio:input, pulldown, tristate>

if you really want to go that far!

>
> However, pinmux description is entirely orthogonal to GPIO
> controllers. =A0The gpio binding is about matching gpio consumers to
> gpio providers. =A0It says nothing about how the gpios are actually
> routed on the chip.
>
> A pinmux binding is more about the specific configuration of the
> chip, and is very likely going to be something chip specific,
> although there may be some common infrastructure and patterns for
> describing the functionality. =A0I have no problem with defining a new
> binding for describing pinmux.
>
> I'll be very nervous if I see any implementation that tries to encode
> pinmux information into the gpio binding.

Yes they are completely separate. I feel that numbers are almost good
enough for GPIOs but are a bit of a stretch for pinmuxes. What sort of
symbolic support is actually available in FDT?

>
>> >
>> > Open Firmware deals with this by defining both a numerical representat=
ion
>> > and a text representation. =A0The numerical representation appears in =
memory
>> > in device tree property values, and the corresponding text representat=
ion is
>> > for display and human input.
>> >
>> Could it be supported by flattened device tree? It seems that open firmw=
are
>> isn't popular in ARM system.
>
> The flat tree is directly derived from the Open Firmware design. =A0Yes,
> this could be expressed by device tree, however we don't have any
> syntax for the dt compiler right now to support the use case. =A0Plus,
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
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
