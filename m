From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 5/5] pinctrl: rockchip: correctly handle arguments of
 pinconf options
Date: Sun, 16 Jun 2013 13:02:31 +0200
Message-ID: <201306161302.32156.heiko@sntech.de>
References: <201306141741.46077.heiko@sntech.de>
 <201306141744.21117.heiko@sntech.de>
 <CACRpkdY6pmS=5rphvYdt_8yKYJq8ADu0omy48ncZ3LFtEUf7yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdY6pmS=5rphvYdt_8yKYJq8ADu0omy48ncZ3LFtEUf7yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 16. Juni 2013, 12:35:43 schrieb Linus Walleij:
> On Fri, Jun 14, 2013 at 5:44 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> > Change the rockchip pinctrl driver to handle the arguments of 0 or 1 to
> > the pull pinconfig options correctly, so that the pull gets disabled wh=
en
> > either the bias_disable options is set or the pull option has the
> > argument 0.
> > =

> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> =

> Patch applied so we can move ahead but:
> >         case PIN_CONFIG_BIAS_PULL_UP:
> >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > =

> >         case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> > +               if (!rockchip_pinconf_pull_valid(info->ctrl, param))
> > +                       return -ENOTSUPP;
> > +
> > +               if (!arg)
> > +                       param =3D PIN_CONFIG_BIAS_DISABLE;
> =

> This is what I think is counter-intuitive.
> =

> Can't you rely on the bias-disable here instead?
> =

> > -               *config =3D 0;
> > +               pull =3D rockchip_get_pull(bank, pin - bank->pin_base);
> > +               *config =3D (pull =3D=3D param) ? 1 : 0;
> =

> And then I guess you should emit PIN_CONFIG_BIAS_DISABLE
> here as well.

rockchip_get_pull does emit PIN_CONFIG_BIAS_DISABLE when the pull is disabl=
ed, =

only wrongly does add the argument here.


But I'm actually not quite sure what the expected behaviour is here at all =
:-)

Say the pin is in the "pin-default" pull state and the query in config_get =
is =

for "bias-disable", what would be the expected bahviour/return value in thi=
s =

case?


Thanks
Heiko
