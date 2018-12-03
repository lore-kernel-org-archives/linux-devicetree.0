From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: add Allwinner H6 Mali
 Midgard binding
Date: Mon, 3 Dec 2018 13:42:07 +0100
Message-ID: <20181203124207.qqasvbio67u7bhvz@flea>
References: <20181127074249.15204-1-icenowy@aosc.io>
 <20181127074249.15204-2-icenowy@aosc.io>
 <11894938.HOUtrQJeEF@phil>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ojmp36grwkvkfun"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKWJSTQAKGQE5G4RJWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <11894938.HOUtrQJeEF@phil>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4ojmp36grwkvkfun
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Dec 03, 2018 at 01:25:21PM +0100, Heiko Stuebner wrote:
> >  - reg : Physical base address of the device and length of the register area.
> >  
> > @@ -44,6 +45,18 @@ Optional properties:
> >    for details.
> >  
> >  
> > +Vendor-specific bindings
> > +------------------------
> > +
> > +The Mali GPU is integrated very differently from one SoC to
> > +another. In order to accomodate those differences, you have the option
> > +to specify one more vendor-specific compatible, among:
> > +
> > +  - allwinner,sun50i-h6-mali
> > +    Required properties:
> > +      * resets: phandle to the reset line for the GPU
> 
> While this paragraph is similar to how it is done in Utgard, I'm
> wondering why we cannot just describe the "resets" as regular
> optional property above that.

Because it's not really optional, it's mandatory on some platforms
(like this one) and has no significance on others.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--4ojmp36grwkvkfun--
