From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node for H3
Date: Tue, 29 Nov 2016 22:59:32 +0100
Message-ID: <20161129215932.kmk6qodthicadpyb@lukather>
References: <20161128095900.27615-1-icenowy@aosc.xyz>
 <20161128114218.14d2ed434802a20fa6b62023@free.fr>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gdrz6lrmamth7t2u"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBT7U67AQKGQEHDDMIAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161128114218.14d2ed434802a20fa6b62023-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gdrz6lrmamth7t2u
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Nov 28, 2016 at 11:42:18AM +0100, Jean-Francois Moine wrote:
> On Mon, 28 Nov 2016 17:59:00 +0800
> Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> 
> > As there's currently a fork of U-Boot which provides simplefb support
> > for H3, a simplefb node can be added to the device tree.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> > ---
> > 
> > I'm still not sure which pipeline should I use.
> > 
> > And, it seems that HDMI Slow Clock is not needed?
> > 
> > (seems that it's only for EDID, but simplefb won't use EDID)
> 
> So, I don't see how this may work.
> How can the u-boot know the resolutions of the HDMI display device?
> 
> In other words: I have a new H3 board with the last u-boot and kernel.
> I plug my (rather old or brand new) HDMI display device.
> After powering on the system, I hope to get something on the screen.
> How?

If it works like the driver for the first display engine in U-Boot, it
will use the preferred mode reported by the EDID, and will fallback to
1024x768 if it cannot access it.

Maybe it would be worth exchanging on the EDID code that has been done
for the u-boot driver too, so that it can be fixed in your driver.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--gdrz6lrmamth7t2u--
