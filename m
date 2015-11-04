From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/6] clk: sunxi: Add H3 clocks support
Date: Wed, 4 Nov 2015 08:23:04 -0800
Message-ID: <20151104162304.GZ6114@lukather>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-3-git-send-email-jenskuske@gmail.com>
 <CAGRGNgW9nVJvAcaduF0y1ptbpLA-3MkR4LCYvh-n1=mtxTyqfg@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s8wpp40TDz0KNMmP"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIPC5CYQKGQEEHEUZAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGRGNgW9nVJvAcaduF0y1ptbpLA-3MkR4LCYvh-n1=mtxTyqfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--s8wpp40TDz0KNMmP
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Julian,

On Wed, Oct 28, 2015 at 10:12:09AM +1100, Julian Calaby wrote:
> > +       of_property_for_each_u32(node, "clock-indices", prop, p, index) {
> > +               of_property_read_string_index(node, "clock-output-names",
> > +                                             i, &clk_name);
> > +
> > +               if (index == 17 || (index >= 29 && index <= 31))
> > +                       clk_parent = AHB2;
> > +               else if (index <= 63 || index >= 128)
> > +                       clk_parent = AHB1;
> > +               else if (index >= 64 && index <= 95)
> > +                       clk_parent = APB1;
> > +               else if (index >= 96 && index <= 127)
> > +                       clk_parent = APB2;
> 
> A way to make this reusable in the future might be to encode it in a
> structure like:
> 
> static const struct bus_clock_paths sun8i_h3_bus_clock_paths __initdata = {
>         {.parent = 2, .min = 17, .max = 17}, /* index 17 is from AHB2 */
>         {.parent = 2, .min = 29, .max = 31}, /* AHB2 bank */
>         {.parent = 1, .min = 63, .max = 128}, /* AHB1 bank */
> ...
>         {}
> };
> 
> Then the code here can be reused for other clocks like this in the
> future without too much bloat. (And this would potentially could be
> generic enough for other platforms.)

We don't really need that at the moment. There's not point in writing
more complicated code to support a use case we don't have yet.

(However, something along these lines will definitely be needed if we
ever have another SoC having the same bus gates madness)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--s8wpp40TDz0KNMmP--
