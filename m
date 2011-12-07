From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] tegra: Add tegra keyboard support
Date: Wed, 07 Dec 2011 15:02:01 -0700
Message-ID: <4EDFE259.9080201@nvidia.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>
 <1322881071-11148-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322881071-11148-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/02/2011 07:57 PM, Simon Glass wrote:
> Add support for internal matrix keyboard controller for Nvidia Tegra platforms.
> This driver uses the fdt decode function to obtain its key codes.

> +static int fdt_decode_kbc(const void *blob, int node, struct keyb *config)
> +{
> +       config->kbc = (struct kbc_tegra *)fdtdec_get_addr(blob, node, "reg");
> +       config->plain_keycode = fdtdec_locate_byte_array(blob, node,
> +                               "keycode-plain", KBC_KEY_COUNT);
> +       config->shift_keycode = fdtdec_locate_byte_array(blob, node,
> +                               "keycode-shift", KBC_KEY_COUNT);
> +       config->fn_keycode = fdtdec_locate_byte_array(blob, node,
> +                               "keycode-fn", KBC_KEY_COUNT);
> +       config->ctrl_keycode = fdtdec_locate_byte_array(blob, node,
> +                               "keycode-ctrl", KBC_KEY_COUNT);
> +       if (!config->plain_keycode) {
> +               debug("%s: cannot find keycode-plain map\n", __func__);
> +               return -1;
> +       }
> +       return 0;
> +}

Simon,

Sorry to keep pushing back on everything so much, but I don't believe
the structure of this binding is correct.

>From a purely HW perspective, the only thing that exists is a single
mapping from (row, col) to keycode. I believe that's all the KBC
driver's binding should define.

I'll amend that slightly: keyboards commonly implement the Fn key
internally in HW, since it causes keys to emit completely different raw
codes, so I can see this driver wanting both keycode-plain and keycode-fn.

However, keycode-shift and keycode-ctrl are purely SW concepts. As such,
they shouldn't be part of the KBC's own mapping table. Witness how the
kernel's Tegra KBC driver only contains the plain and fn tables (albeit
merged into a single array for ease of use), and the input core is what
interpets e.g. KEY_LEFTSHIFT as a modifier.

So specifically what I'd like to see changed in this binding is:

a) We need binding documentation for the Tegra KBC binding, in the same
style as found in the kernel's Documentation/devicetree/bindings.

b) The Tegra KBC binding should include only the keycode-plain and
keycode-fn properties; nothing to do with shift/ctrl/alt/.... (Well,
also any standardized properties such as compatible, reg, interrupts).

c) We need binding documentation for the data that is/could-be common
across multiple keyboards: i.e. what does each key code value represent;
which is KEY_A, KEY_LEFTSHIFT, etc.? These values should be common
across (1) all keyboards (2) some standardized meaning for DT that can
be used by U-Boot, the Linux kernel, etc. Perhaps there is already such
a standard?

d) Shift/Ctrl/Alt/... modifier mapping tables should be specified by a
separate binding that can be common to any/all keyboards (probably the
same document as (b) above). The input to this table should be the raw
codes from keycode-plain/keycode-fn. The output would be the values sent
to whatever consumes keyboard input. The naming of these properties
should make it obvious that it's something not specific to Tegra's KBC,
and SW oriented. Perhaps something semantically similar to loadkeys' or
xkbcomp's input, although I haven't looked at those in detail.

Linux probably wouldn't use (d), since it already has its own
SW-oriented methods of setting up such mapping tables. Although perhaps
in the future the default mappings could be set up from these properties.

U-Boot would need (d), since AIUI, there is no handling of such a higher
layer of mapping tables there right now.

Initially, the code to parse and implement the mappings in (d) could be
part of the Tegra KBC driver, if there's nowhere else to put it. I
simply want to ensure that the structure of the mapping table bindings
doesn't require them to be specific to Tegra KBC, or perpetually
implemented by the Tegra KBC driver even when/if U-Boot does acquire a
higher layer that deals with this kind of thing. That's because they're
SW concepts not part of the HW/HW-binding.

-- 
nvpublic
