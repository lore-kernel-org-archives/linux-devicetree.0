From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for Wexler TAB7200
Date: Wed, 4 Mar 2015 21:39:36 +0100
Message-ID: <20150304203936.GS4911@lukather>
References: <1425456947-4152-1-git-send-email-mamlinav@gmail.com>
 <20150304201819.GQ4911@lukather>
 <20150304232615.3a91de393b12c0e38ee93b67@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjXtncIm5b3tWrFJ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIW33WTQKGQEYGZPT5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150304232615.3a91de393b12c0e38ee93b67-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--qjXtncIm5b3tWrFJ
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Mar 04, 2015 at 11:26:15PM +0300, Aleksei Mamlin wrote:
> On Wed, 4 Mar 2015 21:18:19 +0100
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > On Wed, Mar 04, 2015 at 11:15:47AM +0300, Aleksei Mamlin wrote:
> > > This patch add support for Wexler TAB7200 tablet.
> > > 
> > > The Wexler TAB7200 is a A20 based tablet with 7 inch display(800x480),
> > > capacitive touchscreen(5 fingers), 1G RAM, 4G NAND, micro SD card slot,
> > > mini HDMI port, 3.5mm audio plug, 1 USB OTG port and 1 USB 2.0 port.
> > > 
> > > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
> > >  arch/arm/boot/dts/Makefile                         |   3 +-
> > >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts     | 185 +++++++++++++++++++++
> > >  3 files changed, 188 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > 
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > index 389ca13..eb67da4 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > @@ -189,6 +189,7 @@ variscite	Variscite Ltd.
> > >  via	VIA Technologies, Inc.
> > >  virtio	Virtual I/O Device Specification, developed by the OASIS consortium
> > >  voipac	Voipac Technologies s.r.o.
> > > +wexler	AVIRSA Electronics
> > 
> > Why a different name?
> 
> WEXLER trademark owned by AVIRSA Electronics, a member of the diversified holding AVIRSA.

It's not really an issue. There's a lot of different vendor owned by
the same companies in that file. And the fact that you named it wexler
in the first place proves that wexler is more known than avirsa.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--qjXtncIm5b3tWrFJ--
