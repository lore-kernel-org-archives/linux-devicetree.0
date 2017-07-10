From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 5/6] ARM: sun7i: Convert to CCU
Date: Mon, 10 Jul 2017 13:55:19 +0200
Message-ID: <20170710115519.sddpeyvbxq5llunf@flea>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <2ff8930c51b90a0bb875ecc6c4737f44b3314e7f.1499197129.git-series.plaes@plaes.org>
 <4091e67f-6207-26ef-85f1-e9ff509dd3b7@schinagl.nl>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xldyawbxg7nb3imv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZOYRXFQKGQETZEFJYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <4091e67f-6207-26ef-85f1-e9ff509dd3b7-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xldyawbxg7nb3imv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jul 10, 2017 at 01:23:51PM +0200, Olliver Schinagl wrote:
> Hi Pleas,
> 
> On 04-07-17 22:05, Priit Laes wrote:
> > Convert sun7i-a20.dtsi to new CCU driver.
> > 
> > Tested on Cubietruck.
> > 
> > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++-----------------------------
> >  1 file changed, 84 insertions(+), 635 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> > index 96bee77..a5ca5a8 100644
> > --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> > +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> > @@ -46,8 +46,6 @@
> > 
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/thermal/thermal.h>
> > -
> > -#include <dt-bindings/clock/sun4i-a10-pll2.h>
> >  #include <dt-bindings/dma/sun4i-a10.h>
> I had to add these includes here to make this all work:

That's unlikely, none of the defines are used in this patch.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--xldyawbxg7nb3imv--
