From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] tegra: Add tegra keyboard support
Date: Mon, 12 Dec 2011 11:00:21 -0700
Message-ID: <4EE64135.5070300@nvidia.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>	<1322881071-11148-5-git-send-email-sjg@chromium.org>	<4EDFE259.9080201@nvidia.com>
 <CAPnjgZ3AP2d7kGqawm=CyySd=y0UfXAsYr4r0TvXaX+64pdUuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ3AP2d7kGqawm=CyySd=y0UfXAsYr4r0TvXaX+64pdUuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2011 02:56 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Wed, Dec 7, 2011 at 2:02 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/02/2011 07:57 PM, Simon Glass wrote:
>>> Add support for internal matrix keyboard controller for Nvidia Tegra platforms.
>>> This driver uses the fdt decode function to obtain its key codes.
...
>> From a purely HW perspective, the only thing that exists is a single
>> mapping from (row, col) to keycode. I believe that's all the KBC
>> driver's binding should define.
>>
>> I'll amend that slightly: keyboards commonly implement the Fn key
>> internally in HW, since it causes keys to emit completely different raw
>> codes, so I can see this driver wanting both keycode-plain and keycode-fn.
>>
>> However, keycode-shift and keycode-ctrl are purely SW concepts. As such,
>> they shouldn't be part of the KBC's own mapping table. Witness how the
>> kernel's Tegra KBC driver only contains the plain and fn tables (albeit
>> merged into a single array for ease of use), and the input core is what
>> interpets e.g. KEY_LEFTSHIFT as a modifier.
> 
> Yes, certainly for ctrl I agree that we can simply calculate it.
> Although interestingly the other two keyboard drivers in U-Boot use
> the same approach as here, so maybe there is a fish hook somewhere (I
> have not written this code before).

>> So specifically what I'd like to see changed in this binding is:
>>
>> a) We need binding documentation for the Tegra KBC binding, in the same
>> style as found in the kernel's Documentation/devicetree/bindings.
> 
> OK will do - should I just put that in the cover letter? There is no
> such file in U-Boot.

Right now, the canonical location for binding documentation appears to
be the kernel's Documentation/devicetree/bindings/ directory. Perhaps we
should add the documentation there first?

At least, we should post the binding document in the standard kernel
style to the linux-input and devicetree-discuss mailing lists even if it
doesn't get immediately checked in.

I recall from the kernel summit that Grant Likely was thinking of
creating an outside-the-kernel repository for either/both of binding
documentation and .dts/.dtsi. I'm not sure if any progress has been made
there yet.

>> b) The Tegra KBC binding should include only the keycode-plain and
>> keycode-fn properties; nothing to do with shift/ctrl/alt/.... (Well,
>> also any standardized properties such as compatible, reg, interrupts).
> 
> OK. I'm not sure how I specify what happens when you press shift...
> 
>>
>> c) We need binding documentation for the data that is/could-be common
>> across multiple keyboards: i.e. what does each key code value represent;
>> which is KEY_A, KEY_LEFTSHIFT, etc.? These values should be common
>> across (1) all keyboards (2) some standardized meaning for DT that can
>> be used by U-Boot, the Linux kernel, etc. Perhaps there is already such
>> a standard?
> 
> I'm not aware of it.

I looked around for any kind of existing keyboard mapping binding, and I
couldn't find anything.

I did find a Samsung matrix KBC binding in the kernel
(Documentation/devicetree/bindings/input/samsung-keypad.txt) which is
conceptually at the same level as having a "plain" table, although no
"fn" table in their case. I prefer the proposed Tegra binding's table
approach rather than having a separate node per key myself.

>> d) Shift/Ctrl/Alt/... modifier mapping tables should be specified by a
>> separate binding that can be common to any/all keyboards (probably the
>> same document as (b) above). The input to this table should be the raw
>> codes from keycode-plain/keycode-fn. The output would be the values sent
>> to whatever consumes keyboard input. The naming of these properties
>> should make it obvious that it's something not specific to Tegra's KBC,
>> and SW oriented. Perhaps something semantically similar to loadkeys' or
>> xkbcomp's input, although I haven't looked at those in detail.
> 
> While I agree this would be nice, it involves adding a layer of
> software into U-Boot which doesn't currently exist (converting key
> codes + modifies into ASCII codes).

It doesn't have to be a separate lyaer in U-Boot; the binding just has
to be defined in a way that doesn't tie it to the Tegra KBC driver, so
it can be re-used.

In other words:

Tegra KBC's binding defines:

nvidia,keycode-plain
nvidia,keycode-fn

(these should output "shift" and "ctrl" keycodes for later processing)

Generic key mapping binding defines:

modifier-mapping-shift
modifier-mapping-ctrl

... which take as input the values generated by keycode-plain/keycode-fn
and output the rewritten keycodes.

(the difference here is that the input to those tables is the output
from the nvidia,keycode-foo tables, rather than the raw HW keycodes)

As far as implementation goes, all of that can be handled inside the
Tegra KBC driver for now, so no new layer is required.

I think we should run this plan, and both binding definitions past the
linux-input mailing list; people there will be far more aware of any
previous work in this area, whether this plan makes sense, etc.

...
> I think asking for a new input layer in U-Boot. But this does not
> exist at present. Don't you think this is taking things a little far?
> I am trying to upstream a hardware driver :-)

Yes, I'd like a clear documentation/naming separation between the
HW-specific plain/fn keycode array and the higher-level shift/ctrl
mappings. I certainly am not requesting that you create a separate input
layer in U-Boot to handle those mappings; it can all be done in the
Tegra KBC driver for now.

> My reading of the Tegra keyboard driver in the kernel is that it
> *could* use the keycode-plain and keycode-fn properties as given in
> this series.  They would replace the tegra_kbc_default_keymap[] array.

Yes, that seems quite reasonable.

> However, code would need to be added to create that array for use by
> the upper layers of linux keyboard input, since presumably it will be
> a while before the kernel's drivers/input/keyboard/matrix_keypad.c
> supports an fdt-based mapping. It certainly will not use a shift or
> ctrl mapping, since these are handled by upper layers of Linux input.
> 
> So after all this musing I see two options:
> 
> 1. Modify this series to remove 'shift' support and make 'ctrl' use a
> calculated value (i.e. unlike the other two existing U-Boot drivers).
> We lose access to a number of symbols but I could hard-code a mapping
> in for the keyboard on Seaboard, say.
> 
> 2. a. Go with what we have, put a 'u-boot,' prefix on the
> keycode-shift property and don't expect the kernel to ever use it.  b.
> Start talking on the U-Boot list about the need for a middle input
> translation layer and a generic header file which defines key codes in
> a standardized way. Then write this layer, get it accepted and
> refactor the 3 keyboard drivers to use it.

I'd like to ask for comments in linux-input in case they have any other
ideas, e.g. whether a set of separately documented modifier mapping
properties makes sense. If not, I suppose the following set of
properties would suffice:

nvidia,keycode-plain
nvidia,keycode-fn
u-boot,keycode-shift
u-boot,keycode-ctrl

(although the last two seem to want both nvidia, and u-boot, prefixes)

-- 
nvpublic
