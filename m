From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Added a property to set GFLADJ register
Date: Tue, 13 Sep 2016 08:46:49 +0300
Message-ID: <878tuwl5bq.fsf@linux.intel.com>
References: <ae2c9b5683820c6456f91a2ef631efa2de0bec28.1472764828.git.johnyoun@synopsys.com> <649b249e86e901b5bd2cf4cbe9db96d04a45f30d.1472764828.git.johnyoun@synopsys.com> <20160912153018.GA14561@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912153018.GA14561@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, John Youn <johnyoun@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Thinh Nguyen <thinhn@synopsys.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh@kernel.org> writes:
>> Synopsys HW setup (HAPS DX and phy board) requires a preset to this
>> register to improve interoperablitity. For example, the value for
>> GFLADJ_REFCLK_LPM_SEL should be set to 0 with ref_clk period of 50.
>
> This sounds like it should be handled in the driver. Is it a simple,=20
> constant correlation of ref_clk period to this value?

you mean that this could be calculated based off of clk_get_rate() ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJX15LJAAoJEMy+uJnhGpkGWZYQAIUR8vppHFXujFJGHNsH0FhX
9W9EPIJOXf/7qfklzeX6perUqD4/5JRwKWeQde78X6ZxYNh5pTsLNOPYi92FXGhd
pitlSxfWj0tPmRDxPjsEQhPrueHIXnapa5nawVhnRYdCnkm8AspeOsL05q06frzR
Z5kvLV8u72/i6a9AbS4LfxvEBwQBNcsOMRqBZvh6kV+9T0nV7ntAuPhdsC6kPoRr
1OI1y9IbhLZhznuaJRODtUdHVXl132QbvVnNFtonB8pnKiZZblWRbPGQ3hcjFAa9
oyJbd87vLr8IlYimLqsZlrTIR87hmQESDLok13jcEqrIIPVdV6mJD4EqsrM3yORv
23GhYxPIJOY0W/7ooTAy2y37bVQNW1h+vqItwFP3kRs9HF3TZMfOGRULaTfXy9kp
vbvqEVRdUgerARM6fQ21vBOscH+Kj3J2NS9JLS4A4/KZObnZYj1YET5RpwC3mo4j
tHptFYVgeqMat/RYwIsX/0j0/JPZ5cl8p0/Alee7ny6waRK36A708sBpVJasU3jt
zjUi/+Ia0Dm7fOtDac5anss8xAaCcIg2s4qAsQzhBKl2BGEEox0ef8ZnRldxhQ4x
oKxN0ZKabht8Uegl6OcxHuQRU6b2DcvA5OhmzXjel+a/qKmhKM5f5m0+iwYjnuGe
cHZ6nmM5bKFpFYf//hcy
=uo/o
-----END PGP SIGNATURE-----
--=-=-=--
