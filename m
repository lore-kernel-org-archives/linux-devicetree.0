From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] nvmem: sunxi-sid: add support for H3
 and A64's SID controller
Date: Fri, 27 Jan 2017 10:41:33 +0100
Message-ID: <20170127094133.ewuf5uo6lb3vhf6k@lukather>
References: <20170127122705.R0b4EAKp@smtp3o.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjuvtndbi3h5hhz2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTNLVTCAKGQEE7AM43A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170127122705.R0b4EAKp-/icbEWb855g0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kjuvtndbi3h5hhz2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Jan 27, 2017 at 05:26:59PM +0800, Icenowy Zheng wrote:
> > > +Example for sun8i-h3: 
> > > + sid@01c14000 { 
> > > + compatible = "allwinner,sun8i-h3-sid"; 
> > > + /* 
> > > + * The length of SID on H3 is 0x100 bytes, add the value offset 
> > > + * 0x200, so the total length should be 0x300. 
> > > + */ 
> > > + reg = <0x01c14000 0x300>; 
> >
> > No, it should be the size of the memory region used and documented for 
> > that device, ie 1kB (0x400) in the H3 case, just like any other reg 
> > property. 
> 
> So bind the SID size with compatible?

If needed, yes.

> > > - randomness = kzalloc(sizeof(u8) * (size), GFP_KERNEL); 
> > > + randomness_size = max(size, SUNXI_SID_MAX_RANDOMNESS_SIZE); 
> > > + randomness = kzalloc(sizeof(u8) * (randomness_size), GFP_KERNEL); 
> >
> > Why is that change needed? 
> 
> On my H3/H2+ only 2 words after the first 4 words is not zero.
> 
> I don't feel like add so many 0s to randomness.

As far as I know, filling the entropy pool with zeros does no harm, it
just doesn't do anything either.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--kjuvtndbi3h5hhz2--
