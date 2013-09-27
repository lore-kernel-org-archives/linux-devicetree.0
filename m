From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 10:51:17 +0800
Message-ID: <20130927025116.GG25146@S2101-09.ap.freescale.net>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
 <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
 <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 11:35:43PM +0200, Linus Walleij wrote:
> On Thu, Sep 26, 2013 at 10:29 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, Sep 26, 2013 at 4:51 PM, Russell King - ARM Linux
> 
> >> I mean the stuff which looks like this:
> >>
> >> #define MX6QDL_PAD_ENET_MDC__ESAI_TX5_RX0           0x1e8 0x5b8 0x858 0x2 0x0
> >
> > Let me try to decode it:
> >
> > 0x1e8: Offset of IOMUXC_SW_MUX_CTL_PAD_ENET_MDC register
> >
> > 0x5b8: Offset of IOMUXC_SW_PAD_CTL_PAD_ENET_MDC register
> >
> > 0x2: This means that the MUX_MODE field selects the ESAI_TX5_RX0 function
> > in this pad
> >
> > 0x0: SELECT_INPUT not used for this pad
> 
> This I guess predates the inctroduction of defines into the DTC,
> but we can do a lot better now.
> 
> Can someone from the i.MX camp take a sweep and convert this
> to defines in some include/dt-bindings/imx.h or similar file so
> this thing becomes readable?

We call those macros like MX6QDL_PAD_ENET_MDC__ESAI_TX5_RX0 in
imx6q-pinfunc.h pin function ID.  It's all about choosing a pinmux
function (ESAI_TX5_RX0) for given pad (MX6QDL_PAD_ENET_MDC), and
that's all what users care and need to read from the macro.  The
decoding of the macro is the register details that users do not care in
general.  But fsl,pinctrl bindings doc documented these details anyway.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
