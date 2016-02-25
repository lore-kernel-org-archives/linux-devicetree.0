From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO
 controller support
Date: Wed, 24 Feb 2016 16:56:44 -0800
Message-ID: <20160225005644.GC4736@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
 <20160211123648.GN31506@lukather>
 <CACRpkdaGZ4-S1A9zUUaBXXEazyJf_uZ4ESiBhw-CpozXMxfDHg@mail.gmail.com>
 <20160211151246.GO31506@lukather>
 <CACRpkdb7=x2bJP1nXpF2bP3U0t+NUHiuw_aeTAhbR8OXOrHn6A@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBFFGXG3AKGQE4IDF3OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb7=x2bJP1nXpF2bP3U0t+NUHiuw_aeTAhbR8OXOrHn6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Reinder
List-Id: devicetree@vger.kernel.org

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Linus,

On Tue, Feb 16, 2016 at 12:23:37AM +0100, Linus Walleij wrote:
> On Thu, Feb 11, 2016 at 4:12 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Thu, Feb 11, 2016 at 02:47:57PM +0100, Linus Walleij wrote:
> 
> >> Can you guys supply a MAINTAINERS entry for the sunxi
> >> stuff?
> >
> > We have one, and Chen-Yu is listed as co-maintainer:
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n911
> 
> Modified request:
> can you put in F: wildcards there to match the files pertaining to
> the sunxi platform, so that scripts/find-maintainer.pl finds them.

I don't really know what you mean, on my laptop, if I run it, I get
the following result:

$ ./scripts/get_maintainer.pl -f drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c
Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (maintainer:PIN CONTROL SUBSYSTEM,commit_signer:2/2=100%)
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (maintainer:ARM/Allwinner sunXi SoC support,commit_signer:1/2=50%)
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> (maintainer:ARM/Allwinner sunXi SoC support)
Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> (commit_signer:1/2=50%,authored:1/2=50%)
Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (commit_signer:1/2=50%,authored:1/2=50%)
Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> (commit_signer:1/2=50%)
linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:PIN CONTROL SUBSYSTEM)
linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/Allwinner sunXi SoC support)
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)

With both Chen-Yu and I listed as maintainers.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--dkEUBIird37B8yKS--
