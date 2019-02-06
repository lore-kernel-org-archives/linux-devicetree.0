From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a64: Enable PMIC
 power supplies on various boards
Date: Wed, 6 Feb 2019 13:19:28 +0100
Message-ID: <20190206121928.6t2sawpqsmf6buv3@flea>
References: <20190205150040.12343-1-wens@csie.org>
 <20190205150040.12343-2-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jf7jxt6isqtwx3zl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUVB5PRAKGQEYBMIIXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190205150040.12343-2-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jf7jxt6isqtwx3zl
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Feb 05, 2019 at 11:00:40PM +0800, Chen-Yu Tsai wrote:
> On these A64 devices, the DC input jacks are wired to the ACIN pins of
> the PMIC, which is represented by the AC power supply. With the
> exception of the Nanopi A64, all devices include LiPo batteries or have
> connectors for them, which are represented by the battery power supply.
> 
> Enable these power supplies in the device tree.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied both, thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--jf7jxt6isqtwx3zl--
