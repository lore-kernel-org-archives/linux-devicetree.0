From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mfd: axp20x: add AXP221 PMIC support
Date: Wed, 18 Jun 2014 10:28:06 +0100
Message-ID: <20140618092806.GI23945@lee--X1>
References: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com>
 <1402990723-28138-2-git-send-email-boris.brezillon@free-electrons.com>
 <20140618083605.GQ21030@lee--X1>
 <53A15202.1070908@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBMFXQWOQKGQEUKYK5JY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <53A15202.1070908-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Jun 2014, Boris BREZILLON wrote:
> On 18/06/2014 10:36, Lee Jones wrote:
> > On Tue, 17 Jun 2014, Boris BREZILLON wrote:
> >
> >> Add support for the AXP221 PMIC device to the existing AXP20x driver.
> >>
> >> The AXP221 defines a new set of registers, power supplies and regulato=
rs,
> >> but most of the API is similar to the AXP20x ones.
> >> The AXP20x irq chip definition is reused, though some interrupts are n=
ot
> >> available in the AXP221.
> >>
> >> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  drivers/mfd/axp20x.c       | 64 +++++++++++++++++++++++++++++++++++++=
+++++----
> >>  include/linux/mfd/axp20x.h | 56 +++++++++++++++++++++++++++++++++++++=
+++
> >>  2 files changed, 115 insertions(+), 5 deletions(-)
> > Looks good to me now.
> >   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Can this go in independently to the other patches in the set?
>=20
> Yes, as long as no one define an axp221 node in his DT.
> In this case axp221 regulators would be considered as axp20x ones (which
> might be a bit problematic), because axp20x-regulator driver does not
> test the axp variant before probing its regulators (this test is
> introduced in patch 3).

Then I'd prefer to wait and have the dependencies go in at the same
time.

Mark,
  As normal, I'm happy to create a shared branch between us.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
