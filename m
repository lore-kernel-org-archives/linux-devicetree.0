From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/8] clk: bcm2835: add missing PLL clock divider
Date: Thu, 17 Mar 2016 10:58:20 -0700
Message-ID: <8737rpm1fn.fsf@eliezer.anholt.net>
References: <1456760642-2412-1-git-send-email-kernel@martin.sperl.org> <1456760642-2412-3-git-send-email-kernel@martin.sperl.org> <87y49hjb4l.fsf@eliezer.anholt.net> <C5EA56E8-F1A1-453D-A421-3E29853F3127@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <C5EA56E8-F1A1-453D-A421-3E29853F3127@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Martin Sperl <kernel@martin.sperl.org> writes:

>> On 17.03.2016, at 17:57, Eric Anholt <eric@anholt.net> wrote:
>>=20
>>=20
>> These don't exist on the hardware as far as I've been able to find.  "I
>> found it in a header file somewhere" is not sufficient justification to
>> expose it.
>>=20
>> I'm working on getting a series of all of these reviewed and ready, so
>> I'm just dropping these PLLB hunks.
>
> Fine with that - my test shows that these are not configured by the firmw=
are.
>
> As for headers: my experience is that these are the better resource
> compared to all the public available documentation=E2=80=A6
>
> If you remember the =E2=80=9Cfrac=E2=80=9D bit discussion where you said:
>
>   Once again, trusting the docs turns out to be a bad idea.  You're right,
>   the non-MASH clocks *do* have a bit 9 to enable fractional mode.  Sigh.
>
> Also my understanding is that those headers are still used by the firmware
> developers, so I guess that these are pretty stable and well maintained
> (even if the ones available are by now a bit dated).
>
> They even contain ifdefs for some earlier versions of the chip -=20
> see the dma-channels and their interrupts=E2=80=A6
> I.e: BCM2708A0 which does not have the DMA channels 9 to 15
>
> So I would not discount all those pieces of information as totally
> irrelevant.

I'm looking at the hardware source, and at the place where all the other
PLL dividers are, PLLB only has ARM.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6vA9AAoJELXWKTbR/J7oNgMP/An7iDKJOSbTVifT05r7W2Yq
7iHmg4PA68uNCWUQAUP/UPxUIloPSUFIYZpCEW1Wsuh7LxrR1+Nlw8lcbhFf7AfT
PxxBG8iL6gaPBgNdu+kkHy75AxG91TnYQ8BTlU37AqFqg1fJT116moAPCD8Q87iz
aQVurJupbB/h7k2r9fvpH+DI+rTfY8KZTENXEIePkM67U2KzvbIa2dU9sTkkLv+Q
kNJdBnCoqPMDVvFBdsyYmGrPaly/izaVdHmfXIjv9bNHyaPZ8fIjmMBMdGRKEK/6
IiT6XK/hm1jlejH87SqGGhhU4eKaIMuy96YGBiI8aJN7ev1Mix2HPXMqrqw+jvM5
ZyPuVNVvvXaGqz3EGPRZA+tkL8zl7/PZ1KZkNXczIE18rU1U49M/CyHb3bsS3+nN
kO6PLcIh00Y3PFR8vlOEA03FicxPlOnEXvO3FvQCbZVfkYCSfAQCPY42upi2fG93
w4XeajExqsyypkiCgXdT2+sVXPyrYXcl8dgyQm7dXrv7foboaECpqkbzVrvBDvJL
yCeHlz2+vCLOvsisEjNONxDk1xhznoQFdrDHdiXFI7rXaWYn0vyMEuV2QLqd234M
8nGr4ZjmT0oZVpGt0Xkzy3k7agheMjvIBbfN7WNtl5mc14tOsc5JaXqB4TQwWMc9
HT7R5bwd3d/Ert5T5voc
=nRHH
-----END PGP SIGNATURE-----
--=-=-=--
