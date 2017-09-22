From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: enable gpio for pin groups
Date: Fri, 22 Sep 2017 20:02:19 +0200
Message-ID: <20170922180219.chvjuxmrharnw332@pengutronix.de>
References: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
 <CACRpkdacz+oC_8J5VHSsKXHGqxn96ETziu+ifUp4XHHrwcqbtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdacz+oC_8J5VHSsKXHGqxn96ETziu+ifUp4XHHrwcqbtA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 03:23:05PM +0200, Linus Walleij wrote:
> On Thu, Sep 21, 2017 at 8:28 AM, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> 
> > on an i.MX25 machine on my desk a UART RX line is guarded by a transistor
> > like this:
> >
> >         ,------------------------.
> >         | ,---------.            |
> >         | |  imx25  o--RX----◁---o---
> >         | |         o--GPIO--'   |
> >         | `---------'            |
> >         `------------------------'
> 
> This is inside the SoC, right, not outside it?
> 
> In the rest of my answer I assume this.

No, that's on the board. So your reply unfortunately doesn't match the
problem :-|

> If this is on the board, using enable-gpios is proper.

enable-gpios as I suggested below that is? If so I assume you will be
open for a generic approach to implement this?

> > My first idea was to make this a property of the UART and added a
> > enable-gpios property for it[1]. But now I wonder if this is better
> > abstracted as an enable-gpios property in the pinctrl node. Something
> > like:
> >
> >         pinctrl_uart5: uart5 {
> >                 fsl,pins = <
> >                         MX25_PAD_ECB__UART5_TXD                 0x00002080 /* TXD */
> >                         MX25_PAD_LBA__UART5_RXD                 0x00000000 /* RXD */
> >                         MX25_PAD_CS4__UART5_CTS                 0x00002001 /* RTS */
> >                         MX25_PAD_CS5__GPIO_3_21                 0x00002001 /* #RXD_EN */
> >                 >;
> >                 enable-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> >         };
> >
> > Would this make sense? Maybe with a more intuitive name?

(kept for reference)

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
