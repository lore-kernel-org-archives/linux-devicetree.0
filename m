From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: sun8i: a33: Audio codec improvements
Date: Wed, 5 Dec 2018 12:09:39 +0100
Message-ID: <20181205110939.w4sbagsah5heo4ye@flea>
References: <20181205101152.22983-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="djerp4ndjffky3di"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBHET3QAKGQEM7MOUPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181205101152.22983-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--djerp4ndjffky3di
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Dec 05, 2018 at 06:11:49PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This series improves audio support on the A33. Like other Allwinner
> SoCs, the A33 requires the use of a sigma-delta modulation fractional-N
> PLL to generate the correct clock used for audio playback. Otherwise the
> pitch would be slightly off.
> 
> Patch 1 enables sigma-delta modulation for the audio PLL on the A33.
> 
> Patch 2 is only slightly related. It sets the CLK_SET_RATE_PARENT flag
> for all audio-related module clocks
> 
> Patch 3 lowers the audio codec's oversampling rate, so that it can
> play back audio sampled at beyond 48 KHz.
> 
> This is the same as what has recently been done for the A64, which
> shares the same audio codec hardware design.
> 
> However, on the A33 it seems the PLL doesn't always immediately lock on
> to the new clock frequency when there is a rate change. Also since the
> codec is only put in standby instead of turned off, runtime PM never
> kicks in, and the audio related clocks never get turned off. I'm still
> looking into this.
> 
> On an unrelated note, if you get pops when playing back audio on sunxi,
> it might be related to cpufreq. Try setting the governor to performance
> and see if that removes the pops.

Applied all 3 patches, thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--djerp4ndjffky3di--
