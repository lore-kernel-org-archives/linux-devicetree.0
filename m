From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Fix USB OTG regulator
Date: Thu, 10 Jan 2019 08:04:04 +0100
Message-ID: <20190110070404.gmthhqpehllvatp7@flea>
References: <20190109181604.16988-1-jernej.skrabec@siol.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nrx4fsnyeq3jeufe"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4G43PQQKGQEKQQFIMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190109181604.16988-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nrx4fsnyeq3jeufe
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jan 09, 2019 at 07:16:04PM +0100, Jernej Skrabec wrote:
> Currently, AXP803 driver assumes that reg_drivevbus is input which is
> wrong. Unfortunate consequence of that is that none of the USB ports
> work on the board, even USB HOST port, because USB PHY driver probing
> fails due to missing regulator.
> 
> Fix that by adding "x-powers,drive-vbus-en" property to AXP803 node.
> 
> Fixes: 14ff5d8f9151 ("arm64: dts: allwinner: a64: Orange Pi Win: Enable USB OTG socket")
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--nrx4fsnyeq3jeufe--
