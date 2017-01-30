From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 00/10] clk: sunxi-ng: Add support for A80 CCUs
Date: Mon, 30 Jan 2017 08:42:10 +0100
Message-ID: <20170130074210.6pxvenwdtynyyzyt@lukather>
References: <20170128122239.4480-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zf4y3f3u3v63kcnj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBU64XPCAKGQEBPRM5JQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170128122239.4480-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zf4y3f3u3v63kcnj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Jan 28, 2017 at 08:22:29PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v2 of my A80 CCU clk patches. Changes since v1:
> 
>   - Use pre-divider adjusted parent rate for rounding.
> 
>   - Use else statement for the case where the PLL lock status bit is
>     in same register.
> 
>   - Add a more detailed description of the main CCU and DE CCU to the
>     commit messages.
> 
>   - Fix DE CCU compatible string in DT binding example.
> 
>   - Fix incorrectly squashed patch hunk.
> 
>   - Drop leading zeros from device tree node name in DT examples.
> 
>   - Expanded commit message for "ARM: dts: sun8i-a23-q8-tablet: Drop
>     pinmux setting for codec PA gpio".
> 
> This series adds new "sunxi-ng" style drivers for the CCUs found in the
> Allwinner A80 SoC. The A80 contains 1 main clock control unit, and some
> subsystem specific clock control units at separate addresses. These
> include the USB, display engine, and MMC.
> 
>   - The MMC clocks can be supported by the old clock drivers,
>     hence here we do not add a new driver for it.
> 
>   - The old USB clock driver is intertwined with other SoCs,
>     requires old style bindings with clock-output-names and
>     CLK_OF_DECLARE for its parents. It is easier to switch
>     to a new binding and driver.
> 
>   - The display engine (DE) CCU was not supported in the past.
> 
> The A80 CCU also has some quirks about its design. It has
> 
>   - Separate registers for PLL lock status
> 
>   - P1, P2 dividers, which are power-of-2 and only 1 bit wide
> 
> The first 3 patches fix and extend the behavior of sunxi-ng's
> mux clock type, based on the behavior of the clk subsystem's
> basic mux clock.
> 
> The fourth patch adds support for checking PLL lock status
> bits in separate registers, as opposed to within the PLL's
> config register.
> 
> Patches 5 through 7 add drivers for the CCU blocks.
>
> Patch 8 and 9 do some cleanup of the sunxi/allwinner dts files
> prior to switching sun9i dts to the new sunxi-ng clock bindings.
> These are independent of the clk stuff, but touch the same lines
> for sun9i. Including them should make it easier to apply and test
> patches.
> 
> Patch 10 has sun9i switch over to the new clock bindings.
> 
> Please take a look and let me know what you think.


This is a bit late, but I took it in anyway.

Note that I only applied the patches about the CCU. The pinctrl header
stuff is quite conflict heavy, and not really a big deal anyway.

(and I really would have liked to have it as a separate series. This
has nothing to do with the A80 CCU).

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zf4y3f3u3v63kcnj--
