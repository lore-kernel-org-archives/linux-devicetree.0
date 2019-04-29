From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] dt-bindings: usb: mtu3: add properties about USB
 Role Switch
Date: Mon, 29 Apr 2019 11:25:54 -0500
Message-ID: <CAL_JsqKXKRetoy4u_yAMgS+RA0vaRhzjR0zpLjKMtgRvFHXn7A@mail.gmail.com>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
 <1556261237-13823-4-git-send-email-chunfeng.yun@mediatek.com>
 <20190426204906.GB15074@bogus> <1556453788.10179.224.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556453788.10179.224.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 28, 2019 at 7:16 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Fri, 2019-04-26 at 15:49 -0500, Rob Herring wrote:
> > On Fri, Apr 26, 2019 at 02:47:14PM +0800, Chunfeng Yun wrote:
> > > Now the USB Role Switch is supported, so add properties about it
> > >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > v4: no changes
> > > v3: no changes
> > >
> > > v2 changes:
> > >   1. fix typo
> > >   2. refer new binding about connector property
> > > ---
> > >  .../devicetree/bindings/usb/mediatek,mtu3.txt          | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > index 3382b5cb471d..6e004c4a89af 100644
> > > --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > @@ -27,7 +27,9 @@ Optional properties:
> > >   - ranges : allows valid 1:1 translation between child's address space and
> > >     parent's address space
> > >   - extcon : external connector for vbus and idpin changes detection, needed
> > > -   when supports dual-role mode.
> > > +   when supports dual-role mode; it's consiedered valid for compatibility
> > > +   reasons, and not allowed for new bindings, use the property
> > > +   usb-role-switch instead.
> > >   - vbus-supply : reference to the VBUS regulator, needed when supports
> > >     dual-role mode.
> > >   - pinctrl-names : a pinctrl state named "default" is optional, and need be
> > > @@ -36,7 +38,8 @@ Optional properties:
> > >     is not set.
> > >   - pinctrl-0 : pin control group
> > >     See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > -
> > > + - usb-role-switch : use USB Role Switch to support dual-role switch, but
> > > +   not extcon
> >
> > Coordinate with the Renesas and HiSilicon folks implementing the same
> > thing and put this in a common spot.
> I'll prepare a patch for it, and CC Biju and Yu
>
> > However, I think this should not
> > even be needed as knowing the controller capabilities (based on the
> > compatible) and knowing the type of connector should be enough
> > information to tell you if dual role is supported or not.
> Some Dual-Role controller drivers already used extcon framework to
> handle role switch, if try to support the new USB Role Switch framework,
> the driver may want to know which way will be used.

Wouldn't it know by presence of 'extcon' property or not?

> Sometimes users also want to use dual-role even use the type-A, such as
> use sys interface to handle role switch, so only knowing the connector
> type can't tell driver which way to use

That use case doesn't sound like something that should be in DT
though. That would be possible for any controller that supports
dual-role. Though perhaps that requires some specific Vbus wiring? Or
a cable with Vbus disconnected. Either way, doesn't sound USB
compliant.

Rob
