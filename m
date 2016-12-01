From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 0/8] drm: sun8i: Add DE2 HDMI video support
Date: Thu, 1 Dec 2016 10:42:18 +0100
Message-ID: <20161201094218.6snkyrsxex3hpwwi@lukather>
References: <cover.1480414715.git.moinejf@free.fr>
 <2039137.LtCOH6bs2I@avalon>
 <20161201091313.th7nucjmvtuolqza@lukather>
 <2084988.kISO4Quil7@avalon>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2s6bts5rjukbrvzp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBPB77AQKGQEYRNBL2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2084988.kISO4Quil7@avalon>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2s6bts5rjukbrvzp
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Dec 01, 2016 at 11:19:56AM +0200, Laurent Pinchart wrote:
> Hi Maxime,
> 
> On Thursday 01 Dec 2016 10:13:13 Maxime Ripard wrote:
> > On Wed, Nov 30, 2016 at 12:12:55PM +0200, Laurent Pinchart wrote:
> > >> More, it is not sure that the bridge/DW code would work with Allwinner's
> > >> SoCs.
> > > 
> > > If it doesn't work and can't be made to work in a non-invasive way they it
> > > should certainly not be used :-)
> > 
> > Even if the register layout is completely scrambled, as long as the
> > bits themselves aren't (and by comparing the two drivers it looks like
> > they haven't changed), you can easily deal with that using the
> > regmap_fields, with the two implementations (the original one and the
> > scrambled one) providing their register map that way, and the driver
> > code using whatever has been provided.
> 
> Looking at https://linux-sunxi.org/DWC_HDMI_Controller#DWC_HDMI_Controller it 
> seems that an address remapping function could be used.

Even better.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--2s6bts5rjukbrvzp--
