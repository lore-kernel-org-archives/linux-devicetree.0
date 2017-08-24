From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 0/5] ARM: sunxi: Convert sun4i/sun7i
 series SoCs to sunxi-ng CCU
Date: Thu, 24 Aug 2017 10:40:51 +0200
Message-ID: <20170824084051.gbb4z2jk4nwd6gja@flea.lan>
References: <cover.2a284ee63f45063ec7c0720b1098860e0b516c6d.1503507503.git-series.plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ksoprlipopogv4a"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHVC7LGAKGQEZR4EEYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <cover.2a284ee63f45063ec7c0720b1098860e0b516c6d.1503507503.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3ksoprlipopogv4a
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Priit,

On Wed, Aug 23, 2017 at 08:23:28PM +0300, Priit Laes wrote:
> Hi,
> 
> This serie brings A10 (sun4i) and A20 (sun7i) SoCs into the
> sunxi-ng world. With this patchset we now support all the clocks
> in sun4i/sun7i SoCs.
> 
> In order to make cross-tree merges bisectable, changes to device
> trees are currently using clock index as numbers instead of defines.

Thanks a lot for your persistence. I just merged all of these, and
sent a PR for the clock changes to be merged.

Thanks again,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--3ksoprlipopogv4a--
