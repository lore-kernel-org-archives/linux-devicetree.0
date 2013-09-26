From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Thu, 26 Sep 2013 10:11:47 +0200
Message-ID: <20130926101147.217015e1@armhf>
References: <20130828113521.35c53365@armhf>
	<521DCD80.9010105@gmail.com>
	<20130831125128.0e3a23c7@armhf>
	<140d8d8a23f.2784.107cef0f820c2f5d7b7f41463071c310@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <140d8d8a23f.2784.107cef0f820c2f5d7b7f41463071c310-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 01 Sep 2013 11:26:54 +0200
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Jean-Francois,
> Sorry for the messy reply, posting from mobile.
>=20
> Can you please try <&si5351 1>, iirc audio ist connected to it. I wil=
l also=20
> look it up later.

Sebastian,

In the Cubox, I changed the audio DT to:

&i2s1 {
	status =3D "okay";
	clocks =3D <&gate_clk 13>, <&si5351 1>;
	clock-names =3D "internal", "extclk";
	pinctrl-0 =3D <&pmx_audio1_i2s1_spdifo &pmx_gpio_13_audio1>;
};

and the sound does not get out correctly.

There is no sound at all, except when restarting playing which gives
some shrill sound for half a second at start time.

I lowered the rate in kirkwood-i2s, setting the clock by (* 128)
instead of (* 256), and, most of the time, this gives continuous shrill
and chopped sound at various sample rates (22.05, 32 and 44.1 kHz).
Lowering the clock to (* 64) gives no sound at all.

=46or more information, I use i2s input in the tda998x with audio rate
96kHz on HDMI output. The sound is fine with the internal dco (tested
with 44.1kHz only).

Some idea?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
