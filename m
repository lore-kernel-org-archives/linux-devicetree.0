From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [kernel PATCH v2 2/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Wed, 10 Dec 2014 15:44:33 +0100
Message-ID: <4812364.sMcv3qmr7s@wuerfel>
References: <1417366282-13527-1-git-send-email-lersek@redhat.com> <548201C0.1060006@redhat.com> <CAFEAcA8xvJMHKPQOdhH1+RF_MzKQaiqOT3uKF3OhrGSmHkzeRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFEAcA8xvJMHKPQOdhH1+RF_MzKQaiqOT3uKF3OhrGSmHkzeRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 05 December 2014 19:08:46 Peter Maydell wrote:
> On 5 December 2014 at 19:04, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On 12/05/14 19:57, Peter Maydell wrote:
> >> On 30 November 2014 at 16:51, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>> +Example:
> >>> +
> >>> +/ {
> >>> +       #size-cells = <0x2>;
> >>> +       #address-cells = <0x2>;
> >>> +
> >>> +       fw-cfg@9020000 {
> >>> +               compatible = "qemu,fw-cfg-mmio";
> >>> +               reg = <0x0 0x9020000 0x0 0x1000>;
> >>> +       };
> >>
> >> I've just noticed that this example claims a register
> >> region size of 0x1000. This seems wrong, because the
> >> underlying device doesn't have a register range that
> >> big. Surely this should be a size of 0x3 ?
> >
> > Arnd said I should round up the region to 0x1000.
> 
> Right; I replied here as a reasonable place to do so
> on an email with the device-tree folk in cc.
> 
> > http://thread.gmane.org/gmane.linux.drivers.devicetree/101173/focus=101176
> 
> Arnd, what was your reasoning in requesting the round-up?
> I would have expected that a dtb with an overlarge range
> is telling the guest it can access things that in fact
> just aren't there (ie the equivalent of unmapped space which
> on h/w would give you an external abort/decode error).

I was expecting that qemu would be allowed to put additional
registers in there for future extensions. My comment was mainly
directed at having two distinct but consecutive register ranges,
which can be better expressed by having a longer one.

As long as qemu knows exactly how long the register area is
(and it better should know), having the correct length in there
is probably best.


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
