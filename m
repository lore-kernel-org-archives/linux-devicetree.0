From: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH v2] auxdisplay: ht16k33: Driver for LED controller.
Date: Mon, 15 Feb 2016 10:35:29 +0100
Message-ID: <20160215103529.69002c3b@erd979>
References: <1455017468-4431-1-git-send-email-robin@protonic.nl>
	<20160212151243.GA21022@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160212151243.GA21022@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Feb 2016 09:12:43 -0600
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Tue, Feb 09, 2016 at 12:31:08PM +0100, Robin van der Gracht wrote:
> > This is a driver for the Holtek HT16K33 LED controller with keyscan.
> > 
> > Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> > ---
> > Changes in v2:
> >   - Fixed build error reported by kbuild test robot by including
> > mm.h
> > 
> >  .../devicetree/bindings/display/ht16k33.txt        |  42 ++
> >  drivers/auxdisplay/Kconfig                         |   9 +
> >  drivers/auxdisplay/Makefile                        |   1 +
> >  drivers/auxdisplay/ht16k33.c                       | 573
> > +++++++++++++++++++++ 4 files changed, 625 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/ht16k33.txt create mode
> > 100644 drivers/auxdisplay/ht16k33.c
> > 
> > diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt
> > b/Documentation/devicetree/bindings/display/ht16k33.txt new file
> > mode 100644 index 0000000..45fbabb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> > @@ -0,0 +1,42 @@
> > +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> > +-------------------------------------------------------------------------------
> > +
> > +Required properties:
> > +- compatible:			"ht,ht16k33"
> > +- reg:					I2C slave address of
> > the chip. +- interrupt-parent: 	A phandle pointing to the
> > interrupt controller
> > +						serving the
> > interrupt for this chip. +- interrupts:
> > Interrupt specification for the key pressed interrupt. +-
> > refresh-rate:			Display update interval in HZ.
> 
> Add units: "-hz"
> 
> > +- debounce-delay-ms:	Debouncing interval time in
> > microseconds. +- linux,keymap:			The keymap
> > for keys as described in the binding
> > +						document
> > (devicetree/bindings/input/matrix-keymap.txt).
> 
> The alignment of the descriptions here seem to be random. Please line 
> them up.
> 
> > +
> > +Optional properties:
> > +- linux,no-autorepeat:	Disable keyrepeat.
> > +- default-brightness:	Initial brightness setting [0-15] (15
> > if not set).
> 
> default-brightness-level seem a bit more common.
> 

Thanks for reviewing Rob. I'll take your comments into account and
resend an adjusted patch.

Best regards,

-- 
Robin van der Gracht
Protonic Holland
tel.: +31 (0) 229 212928
fax.: +31 (0) 229 210930
Factorij 36 / 1689 AL Zwaag
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
