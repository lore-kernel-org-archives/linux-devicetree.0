From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH] Adding DTB to architecture independent
	vmlinux
Date: Sun, 31 Oct 2010 23:55:55 -0400
Message-ID: <AANLkTi=1t9BDXEYGuLize=A-br+PKkrE_OxaZAs=03Gt@mail.gmail.com>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CC860EF.6060503-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 27, 2010 at 1:27 PM, H. Peter Anvin <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> On 10/27/2010 4:09 AM, Grant Likely wrote:
[...]
>> I don't think it is worth trying to do this in a cross-architecture
>> way. =A0The powerpc zImage wrappers are already very platform-specific
>> code, and there are no assumptions made about how a dtb image is
>> linked into the wrapper. =A0A wrapper could even link in multiple dtb
>> images.
>>
>> For the x86 code, linking the dtb into the vmlinux itself is not
>> something that is desired without the option of selecting it between
>> multiple linked-in dtb files if firmware doesn't pass one in for you.
>> This will require some discussion about how best to manage dtbs before
>> merging a patch like this.
>>
>
> I have to disagree, strongly, that it is not worth doing a
> cross-architectural patch. =A0There is nothing that prevents an architect=
ure
> from having any number of different ones *in addition to* the independent
> way, but that would clearly establish a baseline that everyone can benefit
> from. =A0This is a Very Good Thing[TM]. =A0We already have too many gratu=
itous
> differences between architectures in Linux.

The problem in this case is that it turns into a magic config option
that explicitly restricts the number of platforms a kernel image will
run on down to exactly one.  This (particular) approach is 100%
counter to the direction I've been trying to take embedded platforms
over the last few years.  I'm opposed to linking a single .dtb as a
'baseline' image because embedded system developers will start using
and depending on that feature instead if implementing something that
is multi-platform friendly.

That said, I'm not at all opposed to common infrastructure for linking
one or more .dtb images into the kernel provided that each image is
referred to by a separate symbol, and that it does not implement any
kind of baseline semantics.  Selection of the correct .dtb image from
platform code should always be explicit; not implicit nor controlled
by a single Kconfig setting.

So, if a patch is floated that provides linking multiple and arbitrary
.dtb images into the kernel for use by other code, then I'm all for
it.  The problem of selecting /which/ dtb to use can be addressed (and
debated) in a separate patch.

> As far as linking in multiple dtbs, the one architecture-independent way =
we
> have to pass data into the kernel is the kernel command line, and it might
> make sense to have a command line parameter like "dtb=3Dfoo",

Patches have been floated before to pass the .dtb address via the
kernel command line, but they've not been pursued to completion.  I
have no problems with accepting cross-architecture patches to
implement a dtb=3D kernel parameter, with the caveat that it wouldn't be
applicable when the kernel command line is passed via the .dtb.  :-)

> although I
> expect the vast majority of all users who don't rely on the
> firmware/bootloader to feed them information are going to have one kernel
> image per platform anyway, just for space reasons.

Not really true.  Currently on ARM many SoC family support multiple
boards on a single kernel image with firmware only supplying a unique
integer (machine id) to identify the board.  See
arch/arm/include/asm/mach/arch.h, grep for both MACHINE_START and
lookup_machine_type in arch/arm/mach-*.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
