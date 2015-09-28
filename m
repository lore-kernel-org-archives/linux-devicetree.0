From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/3] ARM: bcm2835: Add the auxiliary clocks to the device tree.
Date: Mon, 28 Sep 2015 12:26:37 -0700
Message-ID: <87si5ymjki.fsf@eliezer.anholt.net>
References: <1441923750-19404-1-git-send-email-eric@anholt.net> <1441923750-19404-4-git-send-email-eric@anholt.net> <5600BAC3.70506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5600BAC3.70506@wwwdotorg.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 09/10/2015 03:22 PM, Eric Anholt wrote:
>> These will be used for enabling UART1, SPI1, and SPI2.
>
>> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
>
>> +		aux_clocks: aux-clocks@0x7e215004 {
>> +			compatible = "brcm,bcm2835-aux-clock";
>> +			#clock-cells = <1>;
>> +			reg = <0x7e215004 0x4>;
>
> Actually, I take back the ack on this patch. This HW module has two
> registers. The reg property should include both of those registers so
> that if SW needs to start using the other register at some time in the
> future, the entire set of registers is already represented in DT.

If I changed it to "reg = <0x7e215000 0x8>" and use a #define for the
clock register offset in patch 2/3, would I then have your ack?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWCZRtAAoJELXWKTbR/J7oJ1IQAIAG3pLxo/9VK8052WBjn0Y7
0rhNcJkq20SPG+/BUt3524eDSLORnjIoS23jEAcalgI31srlE7MlE6CE3pilnqG2
y/lk9YN3Eo4za2w/+rkOn2xMtDNoH/GuvL+Uxzcqex7z+u6djfTMZaRg8CMLEe4S
Nn41YZsCfp1rfHSmKQZK1J7YkPeqgs3DonSCdmjvzVO5PZEPKHsULmXD1PbL8rGB
ag7MMN68YUDd0axHqAmmNgkJ935QxTl0d6qWWsM1TCM00Lc8/NNpLH28gWvfQ9OT
k6u6JFq+Ez+HFWLT8AOgWZukCBVLeyuMZYlDURPIQZnas9E6nErGOSnC7ClfyKwQ
MRJ6DJr8czwGLufftlg9UkS5LTuOleJ6JO1IXNQwMFtFNDmRYGBY0VXjtjAG4MCb
089o2QGiQvLFTKLbn1vu/+vZ1TzrWyIRlyrEUdDMV8ks7h6gR2w7o2TdK/KSBMeu
br9/YbQOKt4HxEixTg4hkDyUMXsx73/aM581qDcpenSpC84BUtXYWhVigdtXM60S
3ef4/UZUzYKQJwH2RM1VWyKvqP2alSw8Rqf7LZcdJe84Ipa2mb2aWzZobFNsnbcD
3J1V1wBYb+OifQaNqNunmGDphDTt9vddilr7VDyjZWfjNYvWWHYztvdPPxCjTv/G
v8D2JeT3tUlVRUKVTjpD
=ERNW
-----END PGP SIGNATURE-----
--=-=-=--
