From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
Date: Fri, 17 May 2019 11:08:45 +0200
Message-ID: <20190517090845.oujs33nplbaxcyun@flea>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de>
 <20190517072738.deohh5fly4jxms7k@flea>
 <20190517101353.3e86d696@blackhole.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0557666394=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190517101353.3e86d696@blackhole.lan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Torsten Duwe <duwe@lst.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0557666394==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rsrvm5wgc3yqgwap"
Content-Disposition: inline


--rsrvm5wgc3yqgwap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2019 at 10:14:18AM +0200, Torsten Duwe wrote:
> On Fri, 17 May 2019 09:27:38 +0200
> Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> > On Thu, May 16, 2019 at 06:48:59PM +0200, Torsten Duwe wrote:
> > > On Thu, May 16, 2019 at 09:06:41AM -0700, Vasily Khoruzhick wrote:
> > > >
> > > > Driver can talk to the panel over AUX channel only after t1+t3,
> > > > t1 is up to 10ms, t3 is up to 200ms.
> > >
> > > This is after power-on. The boot loader needs to deal with this.
> >
> > The bootloader can deal with it, but the kernel will also need to. The
> > bootloader might not be doing this because it's not been updated, the
> > regulator might have been disabled between the time the kernel was
> > started and the time the bridge driver probes, etc.
>
> No, you cannot practically switch off this voltage. It supports _all_
> the devices I mentioned. In fact, the PMIC needs to enable it initially,
> and then it takes some time before the SoC can access the MMC and read
> the SPL from it, just because of exactly these 3.3V. Then the boot
> loader starts, and later the eDP bridge gets initialised.

All these devices can be unused, disabled, or compiled as modules.

> In *theory*, albeit a very daring one, I could imagine a very deep
> sleep mode that can only be ended by pressing the power button, which
> should still work without DCDC1. Only then, a description of the panel
> would be required. But I probably missed something and even this does
> not work.
>
> So for all current practical purposes, we can assume the Teres-I panel
> to be powered properly and providing valid EDID; nothing to worry about
> in software.

You're creating a generic binding for all the users of that bridge,
while considering only the specific case of the Teres-I.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rsrvm5wgc3yqgwap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXN56HQAKCRDj7w1vZxhR
xZh0AP4+w3VFZULGFliCxVroYWWP58DFQSolgLvZtZpZrGVBeAEA6zaZsM+cYTlD
SY3UolrT94qs2Tr0bSG5TvhQwQ111wk=
=giob
-----END PGP SIGNATURE-----

--rsrvm5wgc3yqgwap--

--===============0557666394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0557666394==--
