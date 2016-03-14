From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 01/13] pinctrl: sunxi: Add A83T R_PIO
 controller support
Date: Mon, 14 Mar 2016 11:52:08 +0100
Message-ID: <20160314105208.GM8418@lukather>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
 <1457192586-25596-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdZ5o=SKtHxshaedkYNETERt6DfiOPtC5JV2LNWKL_mqDg@mail.gmail.com>
 <CAEzqOZta65UBJPBrp_4xr=SzHU98dWDucwzVb80eKE9ChJ8jpQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BDCv8JNaL8ltm7rS"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWVPTK3QKGQEY7JSC6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAEzqOZta65UBJPBrp_4xr=SzHU98dWDucwzVb80eKE9ChJ8jpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Reinder
List-Id: devicetree@vger.kernel.org

--BDCv8JNaL8ltm7rS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Mar 12, 2016 at 12:48:02PM +0800, Vishnu Patekar wrote:
> Hello Linus,
> 
> 
> On Wed, Mar 9, 2016 at 10:55 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Sat, Mar 5, 2016 at 10:42 PM, Vishnu Patekar
> > <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> >> interrupt bit is 6th and A83T has one extra pin PL12.
> >>
> >> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > As partly noted by others:
> >
> >> +config PINCTRL_SUN8I_A83T_R
> >> +       def_bool MACH_SUN8I
> >
> > bool
> >
> >> +       depends on RESET_CONTROLLER
> >
> > Should it rather select RESET_CONTROLLER?
> I used depends on and def_bool as it is used for other sunxi pinctrl drivers.
> Using bool and select will not harm anything.

It will, at least in the case of def_bool, since that symbol will not
be enabled by default, and you'll have no way to enable it.

And RESET_CONTROLLER is a bit messy, since you can't just select it
because it also has a dependency on an ARCH_HAS_RESET_CONTROLLER
symbol.

> Should I change it to bool and select ?  or keep it to be uniform with
> earlier options?

Please keep it that way.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--BDCv8JNaL8ltm7rS--
