From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: add devicetree bindings for st-pwm
 regulator
Date: Wed, 17 Sep 2014 14:22:20 -0700
Message-ID: <20140917212220.GQ30918@lee--X1>
References: <1410959280-29662-1-git-send-email-zyw@rock-chips.com>
 <1410959280-29662-3-git-send-email-zyw@rock-chips.com>
 <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WCQ4oU1O9JcZ9SuwWJ7g+GLsUiE=wmQQoWvL41o24eWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Chris Zhong <zyw@rock-chips.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, zhangqing <zhangqing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 17 Sep 2014, Doug Anderson wrote:
> On Wed, Sep 17, 2014 at 6:08 AM, Chris Zhong <zyw@rock-chips.com> wro=
te:
> > Document the st-pwm regulator
> >
> > Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> >
> > ---
> >
> >  .../devicetree/bindings/regulator/st-pwm.txt       |   35 ++++++++=
++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/st-=
pwm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/st-pwm.txt=
 b/Documentation/devicetree/bindings/regulator/st-pwm.txt
> > new file mode 100644
> > index 0000000..38fec1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/st-pwm.txt
> > @@ -0,0 +1,35 @@
> > +st pwm regulator bindings
> > +
> > +Required properties:
> > +  - compatible: "pwm-regulator"
>=20
> This compatible string doesn't include "st,b2105-pwm-regulator".
>=20
> Should be something like:
>=20
>   - compatible: Should be "pwm-regulator" to get voltage table / regu=
lator
>     period from the device tree.  Deprecated: if "st,b2105-pwm-regula=
tor" then
>     voltage table and regulator will be handled by the driver.
>=20
> Assuming that everyone is OK calling "st,b2105-pwm-regulator" the
> deprecated way of doing things.

It's okay not to deprecate "st,b2105-pwm-regulator" as there have
never been any users.  The only DTS file with a reference to it is in
my local repo.  Just rename it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
