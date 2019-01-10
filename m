From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 4/4] dt-bindings: phy-rockchip-inno-usb2: add new rockchip,force-bvalid property.
Date: Thu, 10 Jan 2019 13:31:41 +0100
Message-ID: <4750582.8aBUlXA8d6@phil>
References: <20180815095934.11205-1-enric.balletbo@collabora.com> <20180815222604.GB8193@rob-hp-laptop> <CAFqH_538JF7gmpQzgyShw-8nhUEtkVrGQ6vjkdc5neJd8JCAOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqH_538JF7gmpQzgyShw-8nhUEtkVrGQ6vjkdc5neJd8JCAOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandru Stan <amstan@chromium.org>, Guenter Roeck <groeck@google.com>, Kishon Vijay Abraham I <kishon@ti.com>, Frank Wang <frank.wang@rock-chips.com>, kieran.bingham@ideasonboard.com, linux-kernel <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, kernel@collabora.com, Benson Leung <bleung@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,
Am Donnerstag, 10. Januar 2019, 10:06:38 CET schrieb Enric Balletbo Serra:
> Missatge de Rob Herring <robh@kernel.org> del dia dj., 16 d’ag. 2018 a les 0:26:
> >
> > On Wed, Aug 15, 2018 at 11:59:34AM +0200, Enric Balletbo i Serra wrote:
> > > This property is used when the otg-id pin is not connected. When this
> > > property is set it forces to set the B-Device Session Valid bit when the
> > > port works as device and clears that bit when the port works as host.
> > >
> > > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > ---
> > >
> > >  .../devicetree/bindings/phy/phy-rockchip-inno-usb2.txt       | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> > > index 2d4808d3920b..55761f466c41 100644
> > > --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> > > +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> > > @@ -48,6 +48,11 @@ Optional properties:
> > >               See ./phy-bindings.txt for details.
> > >   - rockchip,utmi-avalid : boolean, use the avalid register to get vbus status.
> > >                         Otherwise, use the bvalid register.
> > > + - rockchip,force-bvalid : boolean, set this to force the B-Device Session
> > > +                       Valid bit when the usb port is in device mode. This
> > > +                       is used when the otg-id pin is not connected.
> > > +                       Only supported in case of compatible being:
> > > +                       * "rockchip,rk3399-usb2phy"
> >
> > Shouldn't you describe the property of the h/w that ID pin is not
> > connected, rather than what you do with that information.
> >
> 
> What about "rockchip, otg-id-not-connected"?

just pointing back to our discussion in patch3 about simply assuming
id-not-connected in the case of the extcon missing

I still think that might be the cleaner variant? But I guess you're
probably already looking into doing that as so far you only resend the
cleanup patches :-) .


Heiko
