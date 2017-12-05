From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 09/10] ARM: dtsi: axp81x: add GPIO DT node
Date: Tue, 5 Dec 2017 10:39:45 +0100
Message-ID: <20171205093945.5sudt23fag7q3ric@flea.lan>
References: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
 <af90c57ebf97c8f5504a4b5b1dad3638bedadfef.1512135804.git-series.quentin.schulz@free-electrons.com>
 <CAGb2v65mOwNBdit=gKOq0=iv94FNuH__4yvCw4v0NHYiCKccBw@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bjgfhlvxfqyubaaf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3GSTHIQKGQE2PE76JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v65mOwNBdit=gKOq0=iv94FNuH__4yvCw4v0NHYiCKccBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bjgfhlvxfqyubaaf
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Tue, Dec 05, 2017 at 05:24:47PM +0800, Chen-Yu Tsai wrote:
> On Fri, Dec 1, 2017 at 9:44 PM, Quentin Schulz
> <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > This adds DT node for the GPIO/pinctrl part present in AXP813/AXP818.
> >
> > Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/axp81x.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
> > index 73b761f..0ef959d 100644
> > --- a/arch/arm/boot/dts/axp81x.dtsi
> > +++ b/arch/arm/boot/dts/axp81x.dtsi
> > @@ -48,6 +48,12 @@
> >         interrupt-controller;
> >         #interrupt-cells = <1>;
> >
> > +       axp_gpio: axp-gpio {
> > +               compatible = "x-powers,axp813-gpio";
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> 
> What about interrupt-controller for directly referenced interrupts from
> the GPIO pins?

There's a bit more to it to enable interrupts. You would probably need
to set up a chained interrupt controller in the GPIO driver, and in
the DTS with a interrupt-parent and interrupts properties pointing to
the AXP device itself.

> Otherwise,
> 
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied 9 and 10, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--bjgfhlvxfqyubaaf--
