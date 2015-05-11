From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 04/13] musb: Do not use musb_read[b|w] / _write[b|w] wrappers in generic fifo functions
Date: Mon, 11 May 2015 18:21:26 +0200
Message-ID: <23713585.ok6F49RAiY@wuerfel>
References: <1426878682-14521-1-git-send-email-hdegoede@redhat.com> <1426878682-14521-5-git-send-email-hdegoede@redhat.com> <20150511155846.GH19476@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150511155846.GH19476-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 11 May 2015 10:58:46 Felipe Balbi wrote:
> On Fri, Mar 20, 2015 at 08:11:13PM +0100, Hans de Goede wrote:
> > The generic fifo functions already use non wrapped accesses in various
> > cases through the iowrite#_rep functions, and all platforms which override
> > the default musb_read[b|w] / _write[b|w] functions also provide their own
> > fifo access functions, so we can safely drop the unnecessary indirection
> > from the fifo access functions.
> > 
> > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/usb/musb/musb_core.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> > index 01ed3a6..016b5b9 100644
> > --- a/drivers/usb/musb/musb_core.c
> > +++ b/drivers/usb/musb/musb_core.c
> > @@ -313,7 +313,7 @@ static void musb_default_write_fifo(struct musb_hw_ep *hw_ep, u16 len,
> >                               index += len & ~0x03;
> >                       }
> >                       if (len & 0x02) {
> > -                             musb_writew(fifo, 0, *(u16 *)&src[index]);
> > +                             __raw_writew(*(u16 *)&src[index], fifo);
> 
> not all architectures provide __raw_* accessors, right ?
> 
> 

They do, but you shouldn't use them for MMIO registers normall because of
endianess concerns.

However, FIFOs are special, and I'd assume that the code before this patch
does not work on big-endian systems on which musb_writew is defined
as a little-endian accessor (writew, writew_relaxed, or iowrite16).

The reason is that a FIFO generally exposes bytes in streaming order,
so the first byte in the FIFO has to be copied from a memory buffer
first, while writew would do a byte swap here that is used for MMIO.

This should be reflected in the changelog, and possibly tested with a
big-endian kernel, but the patch looks correct to me.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
