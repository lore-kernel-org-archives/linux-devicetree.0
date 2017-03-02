From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM CCUs
Date: Thu, 2 Mar 2017 15:09:31 +0100
Message-ID: <20170302140931.tq3vpncln6giyjpr@lukather>
References: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6hgimcr3dfhiog6h"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLGP4DCQKGQELINWEFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170301152236.MUXmRgOe-3YhIAYTWRJA0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6hgimcr3dfhiog6h
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Mar 01, 2017 at 08:22:13PM +0800, Icenowy Zheng wrote:
> > I'm a bit worried by that to be honest. You claim to support the A31, 
> > yet jugdging by the current state of that code you never actually 
> > tested it on that SoC. 
> >
> > What makes you say that the PRCM clocks are the same for the H3 and 
> > A64? We have to be sure, otherwise we might not be able to get the DT 
> > binding right from the very beginning, and we might not be able to fix 
> > it later. 
> 
> In fact, if we worry about this, we shouldn't make r-ccu, as
> dedicated clocks are more easy to fix.
> 
> For newer SoCs' PRCM, we never have enough documents, and Allwinner
> have said that they cannot provide it. (I asked them for this.)
> 
> The best solution is to implement mature enough dedicated clocks
> before we convert to ccu.

What do you mean by dedicated clocks?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--6hgimcr3dfhiog6h--
