From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: update the binding
 for Allwinner H3 TVE support
Date: Fri, 9 Jun 2017 18:49:15 +0200
Message-ID: <20170609164915.enap3epreg5vr2gy@flea.home>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-2-icenowy@aosc.io>
 <20170607084544.kgclybyxxttfk3ko@flea.lan>
 <092D4797-0034-4C39-A30A-92CFAB23AAF8@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxz37dpxhkcomzec"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLND5PEQKGQEZJ6SKBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <092D4797-0034-4C39-A30A-92CFAB23AAF8-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wxz37dpxhkcomzec
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jun 07, 2017 at 04:48:50PM +0800, Icenowy Zheng wrote:
> >> @@ -189,6 +211,8 @@ supported.
> >>  Required properties:
> >>    - compatible: value must be one of:
> >>      * allwinner,sun8i-v3s-de2-mixer
> >> +    * allwinner,sun8i-h3-de2-mixer0
> >> +    * allwinner,sun8i-h3-de2-mixer1
> >
> >Again, please explain why we need to have different compatibles
> >here. If it's only about the number of planes, this should be dealt
> >with a property, not a compatible.
> 
> Only mixer0 has "VEP" and write-back support, at least on H3.

What is that VEP? writeback support can also be expressed by a
property.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--wxz37dpxhkcomzec--
