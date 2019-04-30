From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 3/6] dt-bindings: usb: mtu3: add properties about USB
 Role Switch
Date: Tue, 30 Apr 2019 14:57:37 +0800
Message-ID: <1556607457.10179.259.camel@mhfsdcap03>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
         <1556261237-13823-4-git-send-email-chunfeng.yun@mediatek.com>
         <20190426204906.GB15074@bogus> <1556453788.10179.224.camel@mhfsdcap03>
         <CAL_JsqKXKRetoy4u_yAMgS+RA0vaRhzjR0zpLjKMtgRvFHXn7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKXKRetoy4u_yAMgS+RA0vaRhzjR0zpLjKMtgRvFHXn7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Biju Das <biju.das@bp.renesas.>
List-Id: devicetree@vger.kernel.org

On Mon, 2019-04-29 at 11:25 -0500, Rob Herring wrote:
> On Sun, Apr 28, 2019 at 7:16 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Fri, 2019-04-26 at 15:49 -0500, Rob Herring wrote:
> > > On Fri, Apr 26, 2019 at 02:47:14PM +0800, Chunfeng Yun wrote:
> > > > Now the USB Role Switch is supported, so add properties about it
> > > >
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > ---
> > > > v4: no changes
> > > > v3: no changes
> > > >
> > > > v2 changes:
> > > >   1. fix typo
> > > >   2. refer new binding about connector property
> > > > ---
> > > >  .../devicetree/bindings/usb/mediatek,mtu3.txt          | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > > index 3382b5cb471d..6e004c4a89af 100644
> > > > --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > > > @@ -27,7 +27,9 @@ Optional properties:
> > > >   - ranges : allows valid 1:1 translation between child's address space and
> > > >     parent's address space
> > > >   - extcon : external connector for vbus and idpin changes detection, needed
> > > > -   when supports dual-role mode.
> > > > +   when supports dual-role mode; it's consiedered valid for compatibility
> > > > +   reasons, and not allowed for new bindings, use the property
> > > > +   usb-role-switch instead.
> > > >   - vbus-supply : reference to the VBUS regulator, needed when supports
> > > >     dual-role mode.
> > > >   - pinctrl-names : a pinctrl state named "default" is optional, and need be
> > > > @@ -36,7 +38,8 @@ Optional properties:
> > > >     is not set.
> > > >   - pinctrl-0 : pin control group
> > > >     See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > > -
> > > > + - usb-role-switch : use USB Role Switch to support dual-role switch, but
> > > > +   not extcon
> > >
> > > Coordinate with the Renesas and HiSilicon folks implementing the same
> > > thing and put this in a common spot.
> > I'll prepare a patch for it, and CC Biju and Yu
> >
> > > However, I think this should not
> > > even be needed as knowing the controller capabilities (based on the
> > > compatible) and knowing the type of connector should be enough
> > > information to tell you if dual role is supported or not.
> > Some Dual-Role controller drivers already used extcon framework to
> > handle role switch, if try to support the new USB Role Switch framework,
> > the driver may want to know which way will be used.
> 
> Wouldn't it know by presence of 'extcon' property or not?

non-presence of 'extcon' doesn't mean the driver need USB Role Switch,
e.g. support manual role switch decided by user, of course, we can check
some cases and then decide whether need USB Role Switch or not, maybe
provide a property will make it easier.

> 
> > Sometimes users also want to use dual-role even use the type-A, such as
> > use sys interface to handle role switch, so only knowing the connector
> > type can't tell driver which way to use
> 
> That use case doesn't sound like something that should be in DT
> though. That would be possible for any controller that supports
> dual-role. 
I give manual role switch by sysfs interface a higher priority than
other ways, if manual switch is enabled, e.g. 'extcon' will be ignored.
this may be different from other USB dual-role controller drivers.

> Though perhaps that requires some specific Vbus wiring? Or
> a cable with Vbus disconnected. 
Yes, some projects use PMIC or Charger to detect Vbus, but some don't
have Vbus detection circuit, and some even don't provide vbus pin

> Either way, doesn't sound USB compliant.
Yes, it's more related with customer usage, or cost down, anyway, it's
better to support cases as many as possible.

> 
> Rob
