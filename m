From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Thu, 3 Oct 2013 18:17:16 +0200
Message-ID: <20131003181716.6d03d576@armhf>
References: <20130828113521.35c53365@armhf>
	<521DCD80.9010105@gmail.com>
	<20130831125128.0e3a23c7@armhf>
	<140d8d8a23f.2784.107cef0f820c2f5d7b7f41463071c310@gmail.com>
	<20130926101147.217015e1@armhf>
	<5243F0CE.9000301@gmail.com>
	<20130926132859.04ad4407@armhf>
	<5246E747.6020103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5246E747.6020103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 28 Sep 2013 16:27:19 +0200
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Jean-Francois,
>=20
> I can confirm the following for CuBox:
>=20
> AU1_EXTCLK is connected to si5351 clkout 2. For the _current_
> (v3.12-rc1) dove-cubox.dts that means that you'll have to exchange
> the properties for &i2c0/si5351/clkout[12]. If you leave it the way
> it is, clkout2 is not allowed to change the pll inside si5351 and
> only try to get close to the requested clk rate by using output
> dividers. Would be great if you can provide a corresponding patch
> for v3.12 (no need to Cc stable).
>=20
> Also, as you seem to push kirkwood-i2s DT forward, please get back
> to clkout2 (<&si5351 2>) for the audio node as you did correctly in
> the first place.
>=20
> With above changes, SPDIF_EN, and forcing kirkwood-i2s to always use
> extclk, I can play SPDIF audio with 44k1 and 48k. Other rates could
> also work, but my audio equipment ignores anything else.

Sebastian,

Thanks for your change. I can now get audio at 44.1, 32 and 22.05 kHz
on HDMI with the external clock (via i2s, but s/pdif and other rates
should work too).

	[snip]
> What I am wondering here is, why you want to use i2s at all? On CuBox=
,
> HDMI transmitter is connected to both i2s and spdif. IIRC, for the
> transmitter it makes no difference if you provide i2s or spdif audio,
> _but_ what you are loosing for sure is pass-through, i.e. sending
> compressed AC3 directly.
	[snip]

It seems that my patch about adding s/pdif to the kirkwood audio driver
has not been accepted yet...

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
