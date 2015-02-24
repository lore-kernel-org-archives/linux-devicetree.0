From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/5] MIPS: Allow platforms to specify the decompressor
 load address
Date: Tue, 24 Feb 2015 13:39:03 -0800
Message-ID: <CAL1qeaHSErgc=W4mGhDAm7cu_J4wrOik27joB0Rd-2P7dk=QuA@mail.gmail.com>
References: <1424741507-8882-1-git-send-email-abrestic@chromium.org>
	<1424741507-8882-3-git-send-email-abrestic@chromium.org>
	<7814815.Q6KYv1fjo1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7814815.Q6KYv1fjo1@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 12:15 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 23 February 2015 17:31:44 Andrew Bresticker wrote:
>> Platforms which use raw zboot images may need to link the image at
>> a fixed address if there is no other way to communicate the load
>> address to the bootloader.  Allow the per-platform Kbuild files
>> to specify an optional zboot image load address (zload-y) and fall
>> back to calc_vmlinuz_load_addr if unset.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>
> No objections to the patch, but have you considered doing the
> same thing as ARM's AUTO_ZRELADDR, where we calculate the
> address at runtime from the entry point?
>
> I assume this is the same kind of address you are talking
> about here; if not, nevermind.

It is the same sort of issue, though I think the only way to solve it
on MIPS would be to copy the image to the address it was linked at,
which could be problematic if there's overlap.  There's also the cache
maintenance we'd have to do, which varies from CPU to CPU (and more so
the ARM I believe).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
