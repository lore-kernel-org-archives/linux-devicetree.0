From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: sun9i: a80: Enable GMAC
Date: Wed, 6 Feb 2019 13:16:54 +0100
Message-ID: <20190206121654.im6j45g5ihbap44p@flea>
References: <20190206033239.3619-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ipgdex6jfl7dhk4a"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOFA5PRAKGQETDVTOPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190206033239.3619-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ipgdex6jfl7dhk4a
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Feb 06, 2019 at 11:32:30AM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> On the Allwinner A80, the PIO pin controller includes configuration
> registers to set the I/O voltage. These must match the actual voltage
> provided externally. A mismatch results in signals not being passed
> through.
> 
> With the new PIO pin-bank regulator supply support in place, we can
> tack on support for setting up these registers.
> 
> This in turn allows us to enable the GMAC, which runs at a reduced
> 2.5V for RGMII, instead of the standard 3.0V or 3.3V.
> 
> Please have a look.

Applied the patches 2-9, thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ipgdex6jfl7dhk4a--
