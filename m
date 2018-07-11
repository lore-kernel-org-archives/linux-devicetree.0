From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 13/22] ARM: sun8i-a23-a33: Add SRAM
 controller node and C1 SRAM region
Date: Wed, 11 Jul 2018 11:14:06 +0200
Message-ID: <20180711091405.mkhzamcmimhofryo@flea>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com>
 <20180710080114.31469-14-paul.kocialkowski@bootlin.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7gn7zc3tutiqnnqt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYEUS7NAKGQEJPS5HUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180710080114.31469-14-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Keiichi Watanabe <keiichiw-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Saeger <tom.saeger-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jaco
List-Id: devicetree@vger.kernel.org


--7gn7zc3tutiqnnqt
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Jul 10, 2018 at 10:01:05AM +0200, Paul Kocialkowski wrote:
> From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> 
> This adds a SRAM controller node for the A23 and A33, with support for
> the C1 SRAM region that is shared between the Video Engine and the CPU.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Fixed the compatible and the commit prefix and applied.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--7gn7zc3tutiqnnqt--
