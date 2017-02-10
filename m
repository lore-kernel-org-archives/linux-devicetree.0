From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i-gr8: Rename pwm0_pins_a to pwm0_pins
Date: Fri, 10 Feb 2017 19:03:09 +0100
Message-ID: <20170210180309.nio3xgy2uxa22jhv@lukather>
References: <20170210034234.3612-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s3ek4gwj53bx7hri"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXUA7DCAKGQE5KMYX3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170210034234.3612-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s3ek4gwj53bx7hri
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Feb 10, 2017 at 11:42:34AM +0800, Chen-Yu Tsai wrote:
> The GR8, like other sun5i SoCs, has only 1 pin option for PWM0 output.
> Other SoCs had named the pingroup "pwm0_pins" in their dtsi files, while
> GR8 named it "pwm0_pins_a". When we switched to the new common sun5i
> dtsi file, we forgot to rename the pingroup references in the GR8 board
> dts files.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> 
> Fixes: a2138ce584d5 ("ARM: sun5i: gr8: Use common sun5i DTSI")

Squashed it in the previous patch.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--s3ek4gwj53bx7hri--
