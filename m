From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 3/4] clk: bcm2835: Add support for programming the audio domain clocks.
Date: Fri, 02 Oct 2015 12:53:03 -0700
Message-ID: <87lhblt5cw.fsf@eliezer.anholt.net>
References: <1443475325-22270-1-git-send-email-eric@anholt.net> <1443475325-22270-3-git-send-email-eric@anholt.net> <20151002000741.GA1213@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20151002000741.GA1213@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 09/28, Eric Anholt wrote:
>> +
>> +static const char *bcm2835_clock_per_parents[] = {
>> +static const char *bcm2835_clock_vpu_parents[] = {
>> +static const char *bcm2835_clock_osc_parents[] = {
>
> Can these parent arrays be const char * const ?

They couldn't because I was editing them in place to do the
s/"xosc"/of_clk_get_parent_name()/ edit.  I've moved the edit to being
in a stack allocation at probe time.

I think I've done all of your suggested changes in the new version (and
explained the extra ana2 read/write).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWDuCfAAoJELXWKTbR/J7oi/oP/23CxW5II/otWnJ4DMmiLRq5
sgYnPc5XmXW3mhWnIYnwMcEGWLB6bPMBrp8qw+O1Czs7Cl0sVpW3Y3uQmYKH/u0f
LiDzSV1J5x5S0dqrDqeM0iKKjX7osHbuTUjLbwFG3FYTa0dNVm6pPF7XDKaM9SAy
/jXNavYuOgfzhJj6IkVwpm2sIm9qLXxzjYVu9fp5tGHPYAnbHlTzHFff5nuJiecn
+AsXuR8U1ZE/5D8qqHBsSMaNO+AMK85eyb6moKl8BWyW6LhnK21uSh/XYXoD2aTw
uRzxHQhTc36ADve8e5RlWfFOKKiUo8fGwFsngMIlC5ocdaVxusIcOGTSPQQyp7Zl
DxHPGReeeMK3vjN+RB1IZPvOAHnu4szUVBnB5F2hCjEA9c+Mtgk2NHU3t7zj0ZIs
Fw0C9LsPORm0iZLyMXbKbk6q6iTKGrWU54ewXe/ZCh5VXm2qc3vjMZP2IPcDXCWW
jpUaAurZI0vwMx7irTXMLYlPyYhJKdeXla9s+ZMF1qQnmlVI9l7RC+ud0k2mGdEQ
/rNe9I/YGDdrR7Ry6I0RMfFP6lmfnCvpziukfgL5Fsy7AnlyPEsL0rf/65aVDz0K
KMrxOnNmAiHzVzfMA5T4Z8DzjUj1ng6AU8UKsZwSsNZcSO9Ndz7Pe76osW6cpWv0
t6eyMbXEW/hNaL8Ild2Q
=FsyV
-----END PGP SIGNATURE-----
--=-=-=--
