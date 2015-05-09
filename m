From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/6] pinctrl: sunxi: Add H3 PIO controller support
Date: Sat, 9 May 2015 14:19:36 +0200
Message-ID: <20150509121936.GW11057@lukather>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-4-git-send-email-jenskuske@gmail.com>
 <1430986247.8171.37.camel@x220>
 <554DD0BF.9080108@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fCmRXBY78W5odcVA"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB47WW6VAKGQE7AR4XGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <554DD0BF.9080108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--fCmRXBY78W5odcVA
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, May 09, 2015 at 11:17:51AM +0200, Jens Kuske wrote:
> >> +MODULE_DEVICE_TABLE(of, sun8i_h3_pinctrl_match);
> > 
> >> +MODULE_AUTHOR("Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> >> +MODULE_DESCRIPTION("Allwinner H3 pinctrl driver");
> >> +MODULE_LICENSE("GPL");
> > 
> > This adds some module specific boilerplate. Was it perhaps your
> > intention to make PINCTRL_SUN8I_H3 a tristate symbol?
> > 
> 
> I don't know to be honest, I just followed the pattern of all the other
> pinctrl-sun?i-*.c files. But it sounds logical that this is needless
> in the current state.
> 
> Looks like it got introduced when splitting up the driver:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/251712.html
> 
> Maybe there were plans to use separate modules some day. If not, we
> should remove it from the other files as well I guess. Maxime, could
> you please comment on that?

I don't see anything wrong with building those as modules.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--fCmRXBY78W5odcVA--
