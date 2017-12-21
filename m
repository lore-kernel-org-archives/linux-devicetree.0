From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Thu, 21 Dec 2017 16:26:30 +0100
Message-ID: <20171221152630.2vf57x5o2yi5sv3n@flea.lan>
References: <20171219210523.10428-1-kevans91@ksu.edu>
 <20171221145512.llxvzkcrjpquhczi@flea.lan>
 <CACNAnaE9GiVTXD-TV1xXyBJKtTGKpdA6n0REk6a=qm218EgHbg@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5fxvazjmbj5axlhg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMNF57IQKGQEGRRQW7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CACNAnaE9GiVTXD-TV1xXyBJKtTGKpdA6n0REk6a=qm218EgHbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5fxvazjmbj5axlhg
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Dec 21, 2017 at 09:19:24AM -0600, Kyle Evans wrote:
> On Thu, Dec 21, 2017 at 8:55 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Kyle,
> >
> > On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org wrote:
> >> Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
> >> thermal calibration data, add node to describe it.
> >>
> >> a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
> >> supported in an external driver for FreeBSD.
> >>
> >> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>
> >
> > The patch looks fine in itself, but we've had a number of issues with
> > the register layout (and access patterns) in the past, so I'd rather
> > have something that works in Linux too if possible.
> 
> I have a patch that I think should make it work fine on Linux [1], but
> I'm afraid I have little to no capability to test it myself and so I
> did not add it as well.
> 
> I do know that the rootkey is offset 0x200 into the given space [2],
> as is the case with the H3, and that the readout quirk is not needed.
> I wasn't 100% sure that the a83t has 2Kbit worth of efuse space as the
> H3, but I do know that thermal data can be found at 0x34 and 0x38 in
> this space.

Then maybe we should leave it aside until someone takes some time on
the A83t. The good news is that the binding itself looks fine, so as
far as FreeBSD goes, there shouldn't be anything preventing you from
using it I guess.

Chen-Yu, what do you think?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--5fxvazjmbj5axlhg--
