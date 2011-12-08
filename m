From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/6] tegra: Add tegra keyboard support
Date: Thu, 8 Dec 2011 13:56:00 -0800
Message-ID: <CAPnjgZ3AP2d7kGqawm=CyySd=y0UfXAsYr4r0TvXaX+64pdUuA@mail.gmail.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>
 <1322881071-11148-5-git-send-email-sjg@chromium.org>
 <4EDFE259.9080201@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EDFE259.9080201-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Dec 7, 2011 at 2:02 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 12/02/2011 07:57 PM, Simon Glass wrote:
>> Add support for internal matrix keyboard controller for Nvidia Tegra pla=
tforms.
>> This driver uses the fdt decode function to obtain its key codes.
>
>> +static int fdt_decode_kbc(const void *blob, int node, struct keyb *conf=
ig)
>> +{
>> + =A0 =A0 =A0 config->kbc =3D (struct kbc_tegra *)fdtdec_get_addr(blob, =
node, "reg");
>> + =A0 =A0 =A0 config->plain_keycode =3D fdtdec_locate_byte_array(blob, n=
ode,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "keycode-p=
lain", KBC_KEY_COUNT);
>> + =A0 =A0 =A0 config->shift_keycode =3D fdtdec_locate_byte_array(blob, n=
ode,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "keycode-s=
hift", KBC_KEY_COUNT);
>> + =A0 =A0 =A0 config->fn_keycode =3D fdtdec_locate_byte_array(blob, node,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "keycode-f=
n", KBC_KEY_COUNT);
>> + =A0 =A0 =A0 config->ctrl_keycode =3D fdtdec_locate_byte_array(blob, no=
de,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "keycode-c=
trl", KBC_KEY_COUNT);
>> + =A0 =A0 =A0 if (!config->plain_keycode) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug("%s: cannot find keycode-plain map\n=
", __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 return 0;
>> +}
>
> Simon,
>
> Sorry to keep pushing back on everything so much, but I don't believe
> the structure of this binding is correct.

If I didn't want your feedback I would not have copied you on the
patches :-) It is very useful to know how things are being done in the
kernel and we need to try to keep U-Boot and the kernel as close as
possible on the fdt side (although perhaps not in any other way -
U-Boot is a boot loader not an OS). I'm starting to form the view that
U-Boot will need a few more tweaks on top of the kernel file in some
cases, but let's see. Thanks very much for taking the time to provide
this very useful feedback. If nothing else these discussions might
tease out issues to address later.

>
> From a purely HW perspective, the only thing that exists is a single
> mapping from (row, col) to keycode. I believe that's all the KBC
> driver's binding should define.
>
> I'll amend that slightly: keyboards commonly implement the Fn key
> internally in HW, since it causes keys to emit completely different raw
> codes, so I can see this driver wanting both keycode-plain and keycode-fn.
>
> However, keycode-shift and keycode-ctrl are purely SW concepts. As such,
> they shouldn't be part of the KBC's own mapping table. Witness how the
> kernel's Tegra KBC driver only contains the plain and fn tables (albeit
> merged into a single array for ease of use), and the input core is what
> interpets e.g. KEY_LEFTSHIFT as a modifier.

Yes, certainly for ctrl I agree that we can simply calculate it.
Although interestingly the other two keyboard drivers in U-Boot use
the same approach as here, so maybe there is a fish hook somewhere (I
have not written this code before).

>
> So specifically what I'd like to see changed in this binding is:
>
> a) We need binding documentation for the Tegra KBC binding, in the same
> style as found in the kernel's Documentation/devicetree/bindings.

OK will do - should I just put that in the cover letter? There is no
such file in U-Boot.

>
> b) The Tegra KBC binding should include only the keycode-plain and
> keycode-fn properties; nothing to do with shift/ctrl/alt/.... (Well,
> also any standardized properties such as compatible, reg, interrupts).

OK. I'm not sure how I specify what happens when you press shift...

>
> c) We need binding documentation for the data that is/could-be common
> across multiple keyboards: i.e. what does each key code value represent;
> which is KEY_A, KEY_LEFTSHIFT, etc.? These values should be common
> across (1) all keyboards (2) some standardized meaning for DT that can
> be used by U-Boot, the Linux kernel, etc. Perhaps there is already such
> a standard?

I'm not aware of it.

>
> d) Shift/Ctrl/Alt/... modifier mapping tables should be specified by a
> separate binding that can be common to any/all keyboards (probably the
> same document as (b) above). The input to this table should be the raw
> codes from keycode-plain/keycode-fn. The output would be the values sent
> to whatever consumes keyboard input. The naming of these properties
> should make it obvious that it's something not specific to Tegra's KBC,
> and SW oriented. Perhaps something semantically similar to loadkeys' or
> xkbcomp's input, although I haven't looked at those in detail.

While I agree this would be nice, it involves adding a layer of
software into U-Boot which doesn't currently exist (converting key
codes + modifies into ASCII codes).

>
> Linux probably wouldn't use (d), since it already has its own
> SW-oriented methods of setting up such mapping tables. Although perhaps
> in the future the default mappings could be set up from these properties.

Well, and X already has its own, etc.

>
> U-Boot would need (d), since AIUI, there is no handling of such a higher
> layer of mapping tables there right now.
>
> Initially, the code to parse and implement the mappings in (d) could be
> part of the Tegra KBC driver, if there's nowhere else to put it. I
> simply want to ensure that the structure of the mapping table bindings
> doesn't require them to be specific to Tegra KBC, or perpetually
> implemented by the Tegra KBC driver even when/if U-Boot does acquire a
> higher layer that deals with this kind of thing. That's because they're
> SW concepts not part of the HW/HW-binding.

Do you think for the purposes of this series I should modify it to
remove support for the shift key and make the ctrl key use calculated
values? We can then address shift later. That at least puts the
hardware driver up there.

However, even if I do that, the question of what do do about shift
needs to be resolved. At present we have a 128-byte table and a few
lines of code which allows use to support any keyboard type. Whether
we have @ or " above the 2 key, we can support it. If there is a funny
blue hotkey which means 'boot from USB' when you press it and 'boot
from SD' when you press it with shift, we can support it with a
mapping >=3D ascii 128. It provides maximum flexibility.

The problem is when we have lots of keyboards we may want to do the
translation across all of them to reduce duplicated code in U-Boot.

>From what I can see there will be three keyboard implementations in U-Boot:

- drivers/input/keyboard.c has a translation table
- drivers/input/i8042.c has a translation table also, and supports
German and English
- this driver which has a translation table in the fdt, which seems
like a step forward

We can certainly have a discussion about shift key translation and how
it should work. The same discussion probably applies to un-shifted
keys though, since they may well be printed differently in other
languages. At least with the scheme in this series you can support any
keyboard you like and have complete control over how it behaves.

I think asking for a new input layer in U-Boot. But this does not
exist at present. Don't you think this is taking things a little far?
I am trying to upstream a hardware driver :-)

My reading of the Tegra keyboard driver in the kernel is that it
*could* use the keycode-plain and keycode-fn properties as given in
this series.  They would replace the tegra_kbc_default_keymap[] array.
However, code would need to be added to create that array for use by
the upper layers of linux keyboard input, since presumably it will be
a while before the kernel's drivers/input/keyboard/matrix_keypad.c
supports an fdt-based mapping. It certainly will not use a shift or
ctrl mapping, since these are handled by upper layers of Linux input.

So after all this musing I see two options:

1. Modify this series to remove 'shift' support and make 'ctrl' use a
calculated value (i.e. unlike the other two existing U-Boot drivers).
We lose access to a number of symbols but I could hard-code a mapping
in for the keyboard on Seaboard, say.

2. a. Go with what we have, put a 'u-boot,' prefix on the
keycode-shift property and don't expect the kernel to ever use it.  b.
Start talking on the U-Boot list about the need for a middle input
translation layer and a generic header file which defines key codes in
a standardized way. Then write this layer, get it accepted and
refactor the 3 keyboard drivers to use it.

Thoughts?

Regards,
Simon

>
> --
> nvpublic
