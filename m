From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] initial support for "suniv"
 Allwinner new ARM9 SoC
Date: Mon, 22 Jan 2018 13:14:35 +0100
Message-ID: <20180122121435.bpayxk4uzfqbhqse@flea.lan>
References: <20180119231735.61504-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jeuhtqwctfssk4ie"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLNLS7JQKGQEMFOSUPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180119231735.61504-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jeuhtqwctfssk4ie
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Jan 20, 2018 at 07:17:26AM +0800, Icenowy Zheng wrote:
> This is the RFC initial patchset for the "new" Allwinner SUNIV ARM9 SoC.
> 
> The same die is packaged differently, come with different co-packaged
> DRAM or shipped with different SDK; and then made many model names: F23,
> F25, F1C100A, F1C100S, F1C200S, F1C500, F1C600, R6, etc. These SoCs all
> share a common feature set and are packaged similarly (eLQFP128 for SoCs
> without co-packaged DRAM, QFN88 for with DRAM). As their's no
> functionality hidden on the QFN88 models (except DRAM interface not
> exported), it's not clever to differentiate them. So I will use suniv as
> common name of all these SoCs.

Where is that suniv prefix coming from?

And you need to have a SoC in all your compatibles. This isn't about
being clever or not, this is just a matter of being able to accurately
read in a crystal ball. Or maybe it's just the same, in which case,
I'd really like to have a course :)

You should really answer two questions here:
  - Are you able to predict whether you'll find an SoC part of that
    family in the future that derives a bit and will need a compatible
    of its own?
  - Are you able to predict which quirks we'll need along the way to
    support all the SoCs you've listed there?

If you can't answer yes to both these questions, with a 100%
certainty, then you'll need a SoC name in the compatible.

Which doesn't prevent you from sharing as much as possible the DT like
we did between the A10s and the A13 for example.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--jeuhtqwctfssk4ie--
