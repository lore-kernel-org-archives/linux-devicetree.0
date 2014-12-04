From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: sun6i: Add sun6i-a31s.dtsi
Date: Thu, 4 Dec 2014 15:13:46 +0100
Message-ID: <20141204141346.GP30256@lukather>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com>
 <1416747283-13489-5-git-send-email-hdegoede@redhat.com>
 <20141125181829.GC25249@lukather>
 <CAGb2v64=M37i0WVBbjOOWCrfP5tcHMr6yE+C6rPiy-sV7__qFQ@mail.gmail.com>
 <547597C7.5070005@redhat.com>
 <CAGb2v66kHvChJw=5jBXGSfGbqnr=hmC1YOyzR-N7EN=AVookLA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpcCHpaCAbC4X43d"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBZWYQGSAKGQECV2M6RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66kHvChJw=5jBXGSfGbqnr=hmC1YOyzR-N7EN=AVookLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--LpcCHpaCAbC4X43d
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Nov 26, 2014 at 05:39:31PM +0800, Chen-Yu Tsai wrote:
> >>> Are the gates really identical?
> >>>
> >>> As in not even stripped down?
> >>
> >>
> >> According to the user manuals, the AHB1 gates on the A31s don't have
> >> GMAC (or EMAC in the manual) and MIPI DSI listed. Though it seems
> >> a lot of A31s hardware out there actually use GMAC.
> >
> >
> > Hmm, interesting I was focussing on the ohci2 gate when comparing them as
> > the ohci2 is not listed in the pinmux.
> >
> > The GMAC clock gate definitely actually is there, as I've an A31s based
> > board
> > with a working GMAC.
> >
> > Also Allwinner has confirmed to me that the A31 and A31s are the same die,
> > so
> > there is no reason to differentiate between the 2 at this level. Either we
> > do
> > no differentiation at all, or only at the pinmux level to reflect that
> > certain
> > pins are simply just not there.
> >
> > My vote goes to differentiating at the pinmux level.
> 
> I agree. Since it is confirmed the dies are the same, the hardware
> description should be the same as well, except for the external
> differences (pinmux). Only downside is a slightly bloated DTB
> containing nodes we will never use on the a31s.

Or we can have a sun6i.dtsi that lists all the hardware, and have the
sun6i-a31.dtsi and sun6i-a31s.dtsi that only define the various
pinmuxes.

That way we would avoid duplication, especially if they are identical,
while reducing the useless bloat too.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--LpcCHpaCAbC4X43d--
