From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 02/15] dt-bindings: rtc: sun6i-rtc: Add
 compatible strings for pre-H6 variants
Date: Wed, 28 Nov 2018 11:19:06 +0100
Message-ID: <20181128101906.xkqaoezxodz25c3x@flea>
References: <20181128093013.24442-1-wens@csie.org>
 <20181128093013.24442-3-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="564j2t6jjeonxwuc"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBW6X7HPQKGQEPHCVFQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181128093013.24442-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--564j2t6jjeonxwuc
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Nov 28, 2018 at 05:29:59PM +0800, Chen-Yu Tsai wrote:
> While doing Bluetooth enablement for various boards based on various
> Allwinner SoCs, minor differences in the RTC modules were found. These
> include a lack of an external clock output (A31), different internal
> oscillator frequencies (H3/H5/A64/V3/V3s), different regulator voltage
> settings (H5/H6), and the presence of miscellaneous registers unrelated
> to the RTC (A64/R40/H5/H6). The datasheet also describes different number
> of registers for non-volatile storage, though based on actual experiments
> the actual number is the same across the board.
> 
> This patch adds a list of all pre-H6 variants, grouped by the internal
> oscillator's clock rate, regulator settings, and the presence of the
> external clock output. Combinations are introduced for the variants that
> have miscellaneous registers.
> 
> The RTC block in the H6 also handles the 24 MHz DCXO. This will require
> more device tree binding changes and will be done later.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--564j2t6jjeonxwuc--
