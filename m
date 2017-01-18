From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: sina31s: Enable USB OTG
 controller in peripheral mode
Date: Wed, 18 Jan 2017 08:11:06 +0100
Message-ID: <20170118071106.oynmjovrik54fjwy@lukather>
References: <20170118010105.20069-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lr2sbh37pclubbdk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFNK7TBQKGQEE2ZYHDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170118010105.20069-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lr2sbh37pclubbdk
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jan 18, 2017 at 09:01:05AM +0800, Chen-Yu Tsai wrote:
> While the SinA31s does have a proper 5-pin mini USB OTG port, the ID
> pin does not seem to work. The pin used in the schematics is always low,
> regardless of the attached OTG cable or SoC internal pin bias settings.
> 
> The v1.5 board is missing bias resistors shown in the schematics for
> earlier revisions, and the connections of the remaining one does not
> match the schematics either.
> 
> In addition, VBUS for this port is disconnected from the board's 5V
> power rail. The board features a pad to solder jumper pins to connect
> VBUS to 5V manually.
> 
> Given the above and the fact that the board has 5 more USB host ports,
> it makes more sense to have the OTG port work in peripheral mode.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--lr2sbh37pclubbdk--
