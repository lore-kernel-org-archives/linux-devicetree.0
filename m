From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: sunxi: Add alternative pins for spi0
Date: Fri, 15 Dec 2017 16:08:23 +0100
Message-ID: <20171215150823.jplgknururmkvp2t@flea.lan>
References: <1513151074-6888-1-git-send-email-stefan@olimex.com>
 <20171213154035.qc655iahjoeflftq@flea.lan>
 <5f518e4b-e624-17c2-7e72-24ba930a1c15@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3wgdg4avcqzhyqgn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB46KZ7IQKGQEF553YVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5f518e4b-e624-17c2-7e72-24ba930a1c15-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3wgdg4avcqzhyqgn
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Dec 14, 2017 at 08:24:54AM +0200, Stefan Mavrodiev wrote:
> On 12/13/2017 05:40 PM, Maxime Ripard wrote:
> > Hi,
> > 
> > On Wed, Dec 13, 2017 at 09:44:34AM +0200, Stefan Mavrodiev wrote:
> > > Allwinner A10/A13/A20 SoCs have pinmux for spi0
> > > on port C. The patch adds these pins in the respective
> > > dts includes.
> > > 
> > > Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> > Do you have any boards that are using these?
> > 
> > We won't merge that patch if there's no users for it.
>
> A20-OLinuXino-Lime/Lime2 and A10-OLinuXino-Lime with spi flash.
> For A13 we still doesn't have that option.

If this bus is exposed on the headers, you can add those to the DT but
leave them disabled if you want. Buf if there's no users of those
nodes, our policy is not to merge them.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--3wgdg4avcqzhyqgn--
