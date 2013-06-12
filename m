From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/22] pinctrl: generic: Add DT bindings
Date: Wed, 12 Jun 2013 11:24:38 +0200
Message-ID: <CACRpkdYev+hapkM075Sw7Yi0u+XpRvL74SwT39DV1aV1RtHC+Q@mail.gmail.com>
References: <1370989371-30846-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1370989371-30846-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370989371-30846-2-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
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
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2013 at 12:22 AM, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

> Document DT properties for the generic pinctrl parameters and add a
> parser function.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnhk3lzF8UVTdg@public.gmane.org=
m>

It appears we have a race here, as something like three people,
or four, happened to do generic pinconf bindings at the same time.

Yesterday I applied Heiko St=FCbners patch
"pinctrl: add function to parse generic pinconfig properties from a dt node"
doing basically the same thing. With subtle differences...
but it already supports schmittrigging and some more.

It appears to be close to your idea though!

Would it be possible for you to look at what I have on my "devel" branch
now (same as submitted for -next), rebase on that and patch any problems?

> +               if (param->flag) {
> +                       ret =3D of_property_read_bool(np, param->property)
> +                           ? 0 : -EINVAL;
> +                       val =3D 1;
> +               } else {
> +                       ret =3D of_property_read_u32(np, param->property,=
 &val);
> +               }

This construct is done differently in Heiko's code, please
review it so we know we have a nice, efficient parser.

Yours,
Linus Walleij
