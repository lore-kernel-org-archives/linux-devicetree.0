From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 3/6] mfd: axp20x: Add support for RSB
 based AXP223 PMIC
Date: Mon, 19 Oct 2015 08:02:26 +0200
Message-ID: <20151019060226.GQ2711@lukather>
References: <1444840342-9233-1-git-send-email-wens@csie.org>
 <1444840342-9233-4-git-send-email-wens@csie.org>
 <20151016064159.GG2711@lukather>
 <CAGb2v66B8EbTZkVrt3QT85fKCwOjL8OBWfQvcLHrLAe6NfavNA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eBTWNsZZiigckDWV"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5EOSKYQKGQEG5JLD3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66B8EbTZkVrt3QT85fKCwOjL8OBWfQvcLHrLAe6NfavNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--eBTWNsZZiigckDWV
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Oct 16, 2015 at 02:46:23PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 16, 2015 at 2:41 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Thu, Oct 15, 2015 at 12:32:19AM +0800, Chen-Yu Tsai wrote:
> >> The AXP223 is a new PMIC commonly paired with Allwinner A23/A33 SoCs.
> >> It is functionally identical to AXP221; only the regulator default
> >> voltage/status and the external host interface are different.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >>  drivers/mfd/Kconfig        | 12 ++++++
> >>  drivers/mfd/Makefile       |  1 +
> >>  drivers/mfd/axp20x-core.c  |  2 +
> >>  drivers/mfd/axp20x-rsb.c   | 93 ++++++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/mfd/axp20x.h |  1 +
> >>  5 files changed, 109 insertions(+)
> >>  create mode 100644 drivers/mfd/axp20x-rsb.c
> >>
> >> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >> index 9ba3feb3f2fc..6e5edb61d42e 100644
> >> --- a/drivers/mfd/Kconfig
> >> +++ b/drivers/mfd/Kconfig
> >> @@ -84,6 +84,7 @@ config MFD_BCM590XX
> >>  config MFD_AXP20X
> >>       bool "X-Powers AXP series PMICs"
> >>       select MFD_AXP20X_I2C
> >> +     select MFD_AXP20X_RSB
> >>
> >>  config MFD_AXP20X_CORE
> >>       bool
> >> @@ -102,6 +103,17 @@ config MFD_AXP20X_I2C
> >>         components like regulators or the PEK (Power Enable Key) under the
> >>         corresponding menus.
> >>
> >> +config MFD_AXP20X_RSB
> >> +     bool "X-Powers AXP series RSB PMICs"
> >> +     select MFD_AXP20X_CORE
> >> +     depends on SUNXI_RSB=y
> >
> > Do we need that? Even if the bus is compiled as a module, the driver
> > will not be probed before that, will it?
> 
> There's a compile/link dependency on the __devm_regmap_init_sunxi_rsb().

If it's exported, everything should be fine, no?

> And both drivers are bool, i.e. can't be compiled as a module. What we
> don't want is enabling MFD_AXP20X_RSB without SUNXI_RSB.

What would really be the issue here? The driver wouldn't be probed,
and that's it. Or am I missing something?

Maxime

> AFAIK the same goes for the I2C version.

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--eBTWNsZZiigckDWV--
