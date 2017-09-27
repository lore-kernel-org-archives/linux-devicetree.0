From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: enable gpio for pin groups
Date: Wed, 27 Sep 2017 08:43:52 +0200
Message-ID: <20170927064352.cscr47rzjbeshjx6@pengutronix.de>
References: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
 <CACRpkdacz+oC_8J5VHSsKXHGqxn96ETziu+ifUp4XHHrwcqbtA@mail.gmail.com>
 <20170922180219.chvjuxmrharnw332@pengutronix.de>
 <CACRpkdZn=DogDy8-iXavmrkd1d=FoeL94jb-Sb4iPwb-s+GJjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZn=DogDy8-iXavmrkd1d=FoeL94jb-Sb4iPwb-s+GJjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 27, 2017 at 01:52:45AM +0200, Linus Walleij wrote:
> On Fri, Sep 22, 2017 at 8:02 PM, Uwe Kleine-König
> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > On Fri, Sep 22, 2017 at 03:23:05PM +0200, Linus Walleij wrote:
> >> On Thu, Sep 21, 2017 at 8:28 AM, Uwe Kleine-König
> >> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> >>
> >> > on an i.MX25 machine on my desk a UART RX line is guarded by a transistor
> >> > like this:
> >> >
> >> >         ,------------------------.
> >> >         | ,---------.            |
> >> >         | |  imx25  o--RX----◁---o---
> >> >         | |         o--GPIO--'   |
> >> >         | `---------'            |
> >> >         `------------------------'
> >>
> >> This is inside the SoC, right, not outside it?
> >>
> >> In the rest of my answer I assume this.
> >
> > No, that's on the board. So your reply unfortunately doesn't match the
> > problem :-|
> 
> OK sorry for my stupid and pointless assumption about this being
> inside the SoC, I should ask before I talk.
> 
> >> If this is on the board, using enable-gpios is proper.
> >
> > enable-gpios as I suggested below that is? If so I assume you will be
> > open for a generic approach to implement this?
> 
> So the enable-gpios as part of the pin control state like below:
> 
> >> > My first idea was to make this a property of the UART and added a
> >> > enable-gpios property for it[1]. But now I wonder if this is better
> >> > abstracted as an enable-gpios property in the pinctrl node. Something
> >> > like:
> >> >
> >> >         pinctrl_uart5: uart5 {
> >> >                 fsl,pins = <
> >> >                         MX25_PAD_ECB__UART5_TXD                 0x00002080 /* TXD */
> >> >                         MX25_PAD_LBA__UART5_RXD                 0x00000000 /* RXD */
> >> >                         MX25_PAD_CS4__UART5_CTS                 0x00002001 /* RTS */
> >> >                         MX25_PAD_CS5__GPIO_3_21                 0x00002001 /* #RXD_EN */
> >> >                 >;
> >> >                 enable-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> >> >         };
> >> >
> >> > Would this make sense? Maybe with a more intuitive name?
> 
> I would nominally make it part of the UART node and picked up by the
> UART driver. Unless there is compelling reasons to believe that this is
> something we will see a lot and not a particular oddity.

Well, I didn't see it much before, but that's also a reason to not put
it into the UART driver. :-)

Conceptually the construct is there not because the pin has an UART
function but because the pin is an output by default but should be an
input later. This is more related to the pinctrl part of the SoC than of
its UART IMHO. Also the GPIO is free to be activated once the pinmuxing
is setup, so the timing depends on the pinctrl driver. (Well, ok, once
the UART driver starts to act the pinctrl stuff is already done and so
the timing is fine, too. That's more a conceptual argument.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
