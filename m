From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 02/10] clk: sunxi-ng: Mark AR100 clocks
 as critical
Date: Tue, 20 Aug 2019 09:11:42 +0200
Message-ID: <20190820071142.2bgfsnt75xfeyusp@flea>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-3-samuel@sholland.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7cnfwqz3x4wuuzw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMF253VAKGQEBIVUN5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190820032311.6506-3-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--i7cnfwqz3x4wuuzw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Mon, Aug 19, 2019 at 10:23:03PM -0500, Samuel Holland wrote:
> On sun8i, sun9i, and sun50i SoCs, system suspend/resume support requires
> firmware running on the AR100 coprocessor (the "SCP"). Such firmware can
> provide additional features, such as thermal monitoring and poweron/off
> support for boards without a PMIC.
>
> Since the AR100 may be running critical firmware, even if Linux does not
> know about it or directly interact with it (all requests may go through
> an intermediary interface such as PSCI), Linux must not turn off its
> clock.
>
> At this time, such power management firmware only exists for the A64 and
> H5 SoCs.  However, it makes sense to take care of all CCU drivers now
> for consistency, and to ease the transition in the future once firmware
> is ported to the other SoCs.
>
> Leaving the clock running is safe even if no firmware is present, since
> the AR100 stays in reset by default. In most cases, the AR100 clock is
> kept enabled by Linux anyway, since it is the parent of all APB0 bus
> peripherals. This change only prevents Linux from turning off the AR100
> clock in the rare case that no peripherals are in use.
>
> Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>

So I'm not really sure where you want to go with this.

That clock is only useful where you're having a firmware running on
the AR100, and that firmware would have a device tree node of its own,
where we could list the clocks needed for the firmware to keep
running, if it ever runs. If the driver has not been compiled in /
loaded, then we don't care either.

But more fundamentally, if we're going to use SCPI, then those clocks
will not be handled by that driver anyway, but by the firmware, right?

So I'm not really sure that we should do it statically this way, and
that we should do it at all.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--i7cnfwqz3x4wuuzw--
