From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] pinctrl: update the documentation for some pinconfig
 params
Date: Sun, 16 Jun 2013 12:26:38 +0200
Message-ID: <CACRpkdaV78wXxGPFWVffEfnqrmhq1rsdVYdSKNx5mWaOcYOWrQ@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
 <201306141742.21808.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306141742.21808.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 5:42 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:

> The BIAS_DISABLE and BIAS_HIGH_IMPEDANCE generic pinconfig options were
> missing information about their argument - which should be ignored.
>
> Also the BIAS_PULL_* options may have the pull strength as argument
> when they are activated, while simpler hardware can use any
> non-0 value for it.
>
> Update the kerneldoc to reflect this.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

I'm holding this patch off.

>   * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
> - *     impedance to VDD). If the argument is !=3D 0 pull-up is enabled,
> - *     if it is 0, pull-up is disabled.
> + *     impedance to VDD). If the argument is !=3D 0 pull-up is enabled. =
On
> + *     hardware supporting this, the argument should contain the strengt=
h of
> + *     the pull in Ohm. If it is 0, pull-up is disabled.

As noted by Laurent, a pull-up of 0 Ohm is a short-circuit (bascially the T=
OTAL
pull-up) and it is pretty counter-intuitive to have that mean "disable pull=
-up".
Can we avoid this?

>   * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with=
 high
> - *     impedance to GROUND). If the argument is !=3D 0 pull-down is enab=
led,
> - *     if it is 0, pull-down is disabled.
> + *     impedance to GROUND). If the argument is !=3D 0 pull-down is enab=
led. On
> + *     hardware supporting this, the argument should contain the strengt=
h of
> + *     the pull in Ohm. If it is 0, pull-down is disabled.

Dito.

>   * @PIN_CONFIG_BIAS_PULL_PIN_DEFAULT: the pin will be pulled up or down =
based
>   *     on embedded knowledge of the controller, like current mux functio=
n.
> - *     If the argument is !=3D 0 pull up/down is enabled, if it is 0,
> - *     the pull is disabled.
> + *     If the argument is !=3D 0 pull up/down is enabled. On hardware su=
pporting
> + *     this, the argument should contain the strength of the pull in Ohm.
> + *     If it is 0, pull is disabled.

Dito.

Can't we rely on PIN_CONFIG_BIAS_DISABLE for all this?

Yours,
Linus Walleij
