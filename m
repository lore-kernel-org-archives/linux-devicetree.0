From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH 2/5] MIPS: Allow platforms to specify the decompressor
 load address
Date: Tue, 24 Feb 2015 23:42:57 +0100
Message-ID: <20150224224257.GB9748@linux-mips.org>
References: <1424741507-8882-1-git-send-email-abrestic@chromium.org>
 <1424741507-8882-3-git-send-email-abrestic@chromium.org>
 <7814815.Q6KYv1fjo1@wuerfel>
 <CAL1qeaHSErgc=W4mGhDAm7cu_J4wrOik27joB0Rd-2P7dk=QuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaHSErgc=W4mGhDAm7cu_J4wrOik27joB0Rd-2P7dk=QuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 01:39:03PM -0800, Andrew Bresticker wrote:

> It is the same sort of issue, though I think the only way to solve it
> on MIPS would be to copy the image to the address it was linked at,
> which could be problematic if there's overlap.  There's also the cache
> maintenance we'd have to do, which varies from CPU to CPU (and more so
> the ARM I believe).

On MIPS it's significantly less complex to implement than the in-kernel
cache maintenance code because only one flush operation needs to be
implemented that will be invoked only once so performance is less of
an issue.  Also oddball hardware such as the S-caches controlled by
an external controller can be ignored for purpose of kernel decomporession.
That pretty much leaves to treat the standard R4000 style of caches
and a few oddballs like R2000 class processors.

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
