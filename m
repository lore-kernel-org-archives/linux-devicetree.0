From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: sun8i: h3: add SY8113B regulator
 on Banana Pi M2 Zero board
Date: Thu, 12 Jul 2018 09:23:38 +0200
Message-ID: <20180712072338.zxhzm5rdhmlorjjj@flea>
References: <20180711134450.43148-1-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y4elnhomycs6zyzv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBMETTNAKGQEZPRAYSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180711134450.43148-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--y4elnhomycs6zyzv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Jul 11, 2018 at 09:44:50PM +0800, Icenowy Zheng wrote:
> Banana Pi M2 Zero board has a SY8113B regulator, which is controlled via
> GPIO and capable of outputing 1.1V when the PL1 GPIO is set to output 0
> or 1.1V when the PL6 GPIO is set to input or output 1, and the output is
> the power supply of the ARM cores in H3 SoC.
> 
> Add the device tree node of this regulator and set the cpu's cpu-supply
> property to it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--y4elnhomycs6zyzv--
