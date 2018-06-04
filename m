From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: allwinner: a64-amarula-relic:
 Enable AP6330 WiFi support
Date: Mon, 4 Jun 2018 11:09:19 +0200
Message-ID: <20180604090919.s2mp7etd2eao3w6b@flea>
References: <20180601173527.18051-1-jagan@amarulasolutions.com>
 <20180601173527.18051-2-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="imuw6uj272abzmoe"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQED2TMAKGQE7J77LNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180601173527.18051-2-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--imuw6uj272abzmoe
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 01, 2018 at 11:05:27PM +0530, Jagan Teki wrote:
> Enable AP6330 WiFi/BT combo chip on Amarula A64-Relic board:
> - WiFi SDIO interface is connected to MMC1
> - WiFi WL-PMU-EN pin connected to gpio PL2: attach to mmc-pwrseq
> - WiFi WL-WAKE-AP pin connected to gpio PL3
> - 32kHz external oscillator gate clock from RTC
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Applied both, thanks

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--imuw6uj272abzmoe--
