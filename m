From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: add disable-wakeup property for
 gpio-charger
Date: Tue, 10 Feb 2015 12:33:57 +0000
Message-ID: <20150210123357.GF6659@leverpostej>
References: <1423555945-24289-1-git-send-email-zyw@rock-chips.com>
 <1423555945-24289-2-git-send-email-zyw@rock-chips.com>
 <20150210120030.GD6659@leverpostej>
 <6846904.0gWUOTnQ0A@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6846904.0gWUOTnQ0A@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Chris Zhong <zyw@rock-chips.com>, "dianders@chromium.org" <dianders@chromium.org>, "dtor@chromium.org" <dtor@chromium.org>, "djkurtz@chromium.org" <djkurtz@chromium.org>, "sonnyrao@chromium.org" <sonnyrao@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 10, 2015 at 12:14:48PM +0000, Heiko St=C3=BCbner wrote:
> Am Dienstag, 10. Februar 2015, 12:00:30 schrieb Mark Rutland:
> > On Tue, Feb 10, 2015 at 08:12:24AM +0000, Chris Zhong wrote:
> > > add disable-wakeup for gpio-charger, if you set this property, sy=
stem
> > > will not wakeup by gpio-charger.
> > >=20
> > > Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> > > ---
> > >=20
> > >  Documentation/devicetree/bindings/power_supply/gpio-charger.txt =
| 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> > > b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt=
 index
> > > adbb5dc..a46e9bc 100644
> > > --- a/Documentation/devicetree/bindings/power_supply/gpio-charger=
=2Etxt
> > > +++ b/Documentation/devicetree/bindings/power_supply/gpio-charger=
=2Etxt
> > >=20
> > > @@ -4,6 +4,7 @@ Required properties :
> > >   - compatible : "gpio-charger"
> > >   - gpios : GPIO indicating the charger presence.
> > >  =20
> > >     See GPIO binding in bindings/gpio/gpio.txt .
> > >=20
> > > + - gpio-charger,disable-wakeup : Boolean, charger does not wake-=
up the
> > > system.
> > When would the system wake up otherwise?
>=20
> a response for patch 2/2 suggested to move this to userspace (as deci=
ding if=20
> the charger should be a wakeup source is not a hardware property) and=
 Chris=20
> responded that he'll try to move it as suggested.

Great, that matches what I was thinking.

Thanks for taking the time to say this on the DT patch.=20

Getting part of a series makes review far more painful :(

Thanks,
Mark.
