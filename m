From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/9] pinctrl: sunxi: v3s: introduce
 support for V3
Date: Tue, 25 Jun 2019 15:57:15 +0200
Message-ID: <CACRpkdaQSg4qWWF1XurWA8wnW+ezGtTympVT9DvkF87VKEQVzw@mail.gmail.com>
References: <20190623043801.14040-1-icenowy@aosc.io> <20190623043801.14040-2-icenowy@aosc.io>
 <20190624124019.o6acnnkjikekshl5@flea>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARBSGQZDUAKGQEOYVR3ZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190624124019.o6acnnkjikekshl5@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 2:40 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Sun, Jun 23, 2019 at 12:37:53PM +0800, Icenowy Zheng wrote:
> > Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> > V3s pinctrl driver.
> >
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> > Changes in v3:
> > - Fixed code alignment.
> > - Fixed LVDS function number.

> > -               SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
> > -               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PB_EINT0 */
> > +               SUNXI_FUNCTION(0x2, "uart2"),                 /* TX */
> > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),          /* PB_EINT0 */
>
> I'm not sure why all that churn is needed.
>
> Looks good otherwise.

Should I apply the patch or wait for a new version without the
whitespace fixes?

Yours,
Linus Walleij
