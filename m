From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: sun50i-h6: Add support
 for RTC and fix the clock tree
Date: Fri, 23 Aug 2019 10:19:20 +0200
Message-ID: <20190823081920.xxqg6w7tlnvvkzlx@flea>
References: <20190820151934.3860-1-megous@megous.com>
 <20190820151934.3860-4-megous@megous.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bvvuqig3adpl6wgr"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCWD73VAKGQERYYGCII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190820151934.3860-4-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bvvuqig3adpl6wgr
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Aug 20, 2019 at 05:19:34PM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> This patch adds RTC node and fixes the clock properties and nodes
> to reflect the real clock tree.
>
> The device nodes for the internal oscillator and osc32k are removed,
> as these clocks are now provided by the RTC device. Clock references
> are fixed accordingly, too.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

The prefix should be "arm64: dts: allwinner: h6:"

I've fixed it up and applied it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--bvvuqig3adpl6wgr--
