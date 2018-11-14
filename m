From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/15] dt-bindings: net: broadcom-bluetooth:
 Fix external clock names
Date: Wed, 14 Nov 2018 09:51:05 -0600
Message-ID: <CAL_JsqJrJHatiYB=Vaakbi1UUGOkqvAkZnZRG=zz5Ae_RzxGgg@mail.gmail.com>
References: <20181107101308.7626-1-wens@csie.org> <20181107101308.7626-2-wens@csie.org>
 <5bea0ebe.1c69fb81.e15d7.98e1@mx.google.com> <CAGb2v65PqwKrRdh2_Y48zYnmJa0=hv3Bd4UdvdWvBBMfT2BfSw@mail.gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERB54IWHPQKGQEHSNVAAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65PqwKrRdh2_Y48zYnmJa0=hv3Bd4UdvdWvBBMfT2BfSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 9:15 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Tue, Nov 13, 2018 at 7:37 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Wed, Nov 07, 2018 at 06:12:54PM +0800, Chen-Yu Tsai wrote:
> > > The Broadcom Bluetooth controllers can take up to two external clocks:
> > > an external frequency reference, substituting the main crystal, and a
> > > LPO clock at 32.768 kHz substituting the internal LPO clock.
> > >
> > > In particular, the external LPO clock must be used when the controller
> > > does not have NVRAM connected, and the main reference frequency is not
> > > the default 20 MHz. This is described in detail in the datasheet.
> > >
> > > The original "extclk" clock name is ambiguous as to which of these it
> > > refers to, and some designs might even require both.
> > >
> > > This patch deprecates the existing name, and adds "txco" and "lpo".
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > > index 4194ff7e6ee6..2535e54219af 100644
> > > --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > > +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > > @@ -18,7 +18,10 @@ Optional properties:
> > >   - shutdown-gpios: GPIO specifier, used to enable the BT module
> > >   - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
> > >   - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor
> > > - - clocks: clock specifier if external clock provided to the controller
> > > + - clocks and clock-names: clock specifier if external clocks are provided
> > > +   - "txco": external reference clock
> > > +   - "extclk": deprecated, replaced by "txco"
> > > +   - "lpo": external low power 32.768 kHz clock
> > >   - clock-names: should be "extclk"
> >
> > This line should change?
>
> Yes. Missed that.
>
> >
> > 'clocks' needs to describe how many clocks and the order of them.
> >
> > 'clock-names' needs to list the names. Keep them separate.
>
> I was under the impression that when clock-names was used, the
> order of clocks shouldn't matter.

Generally, no. The order should be defined still.

> Also, both clocks are optional. The controller can use a standalone
> crystal instead of an external TXCO, which would not get described in
> the device tree, and/or not use an LPO clock. How would one describe
> a device that has an LPO clock input but not a TXCO clock input?

A crystal would still be a fixed-clock. Does s/w need to know which one it is?

Your's is a case where index alone doesn't work and you need
clock-names. But still, you should define the order for when both
clocks are present so we don't end with both orders for no good
reason.

> Last, IMHO listing them with name + description, one item per line
> is more readable then having the items on one line, then having the
> next line list all their respective names. If ordering and number of
> items is important, I could add the requirements to the description
> of "clocks and clock-names"?

clocks can just say something like "1 or 2 clocks as defined in clock-names".

Rob
