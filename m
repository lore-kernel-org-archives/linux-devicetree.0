From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 0/8] Add dual-role OTG support for
 Allwinner H3
Date: Mon, 27 Mar 2017 13:47:18 +0200
Message-ID: <20170327114718.sm37yzjpawgatcfc@lukather>
References: <20170325145015.22076-1-icenowy@aosc.xyz>
 <73c148dd-fe21-da12-45d1-0c70d9a5b998@ti.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lwl4c6i7icyvla5q"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR7X4PDAKGQEZ6C7V6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <73c148dd-fe21-da12-45d1-0c70d9a5b998-l0cyMroinI0@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lwl4c6i7icyvla5q
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Mar 27, 2017 at 03:35:25PM +0530, Kishon Vijay Abraham I wrote:
> 
> 
> On Saturday 25 March 2017 08:20 PM, Icenowy Zheng wrote:
> > Allwinner H3 have a its USB PHY0 routed to two USB controllers: one is
> > a MUSB controller, which can work in peripheral mode, but works badly in
> > host mode (several hardware will fail on the MUSB controller, even connect
> > one MUSB controller in peripheral mode to another one in host mode cannot
> > work); the other is a pair of EHCI/OHCI controller, which can work only
> > in host mode, but have better compatibillity. The route is controlled in
> > a register, which we have set it to HCI only when we do not know about
> > it well.
> > 
> > Add support to route to the best controller according to current USB mode
> > (host/peripheral).
> > 
> > Note: Currently even if hardware only support hostmode, we should still
> > enable the MUSB controller, as it controls the USB mode. (Some this kind
> > of hardware can also work in peripheral mode by settings in the sysfs
> > node of MUSB, then connect it to another host via a USB Type-A to Type-A
> > cable.)
> > 
> > Patch 1 changes the device tree binding to include the "pmu0" for HCI pair.
> > 
> > Patch 2 and 3 are fixes for H3 PHY, in order to make MUSB really working
> > on H3.
> > 
> > Patch 4 adds support for auto routing of PHY0. It's currently only enabled
> > on H3, but it's easy to extend it to other SoCs which feature this
> > route control.
> 
> merged the 1st four patch of this series.

And applied the last four.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--lwl4c6i7icyvla5q--
