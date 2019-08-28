From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Subject: Re: [PATCHv5] drivers/amba: add reset control to amba bus probe
Date: Wed, 28 Aug 2019 09:46:45 -0400
Message-ID: <292438.1567000005@turing-police>
References: <20190826154252.22952-1-dinguyen@kernel.org> <30608.1566933924@turing-police>
 <46bcf493-9dd6-bf5b-089a-be158739a13f@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1567000004_1612P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46bcf493-9dd6-bf5b-089a-be158739a13f@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, daniel.thompson@linaro.org, linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

--==_Exmh_1567000004_1612P
Content-Type: text/plain; charset=us-ascii

On Wed, 28 Aug 2019 08:34:20 -0500, Dinh Nguyen said:

> > Does this DTRT for both old and new U-Boots? My naive reading of
> > this patch
>
> What is a DTRT?

Do The Right Thing, sorry...

> > says on an old U-Boot, we end up attempting to bring it out of
> > reset even though they had already been brought out.
> >
>
> If the peripheral is already out of reset, de-asserting the reset has
> no affect.

OK, thanks.  There's been hardware where doing that sort of thing twice will
confuse the device and cause issues.

--==_Exmh_1567000004_1612P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXWaFxAdmEQWDXROgAQJZPhAAopKhP6wn5B9evWUpllhb6CIajYqxhob3
zLAF1vVdOpPXyTT3PaFMjwrqKiPt9QnMLHW5odZ5UswcH4dBRByhwb8Hr8a/Ibo9
Nb6BdK1KuilWx3bCvw63nNH9aB+tPvcaOUtux73gD+HaPa/XCvzZvObCnFCXa4oa
9gQJl8GG8pRLfH03QPSYGKAzyJ35qt2RBarVa0Z19NZPB5LDDePLKwxblatRFICW
mhdH1t6uC7CuxMqfHKbG5MyhdmgmmOyHg16tHxZ85B8f0CoCFAHx9sNzvS3dmXZd
bP2+r7cQ4kNkIWI/PNPzh+s8D9ZlWYdGn1p2VQU/4FKMh2d7IDS5MvLgA5rf0DiE
bOPBbqzfZ/DsfyW96M9e4/53OYYK5gqC+ZaePJKY4BkAHLNtKewczCw6E+kck7OW
4ya+eOEFQzl9wC5XNMrYkdV8DLhftU4qEzAHuNH2vHIK7BK+3ARGB4tSQyTMNi/x
yOPY69cLv4llawfjD/y0PSqmvKN1MlIjmxeAD9kh6AoTUNNNRgj0F+T/Ma91uBeV
50x+YgZZ104bD6d3s5U0kIgykQJARE0JivC9fkFuKZXE6vtIAssE3FFLw2NKncXw
Sq+YA6DuuSvCdhAWEmYJpbpwREHEGAjLsN+JBxPhV7vbbGhVV1UuYXPDVfp18Moy
fW9l0ZeoE+c=
=tC0P
-----END PGP SIGNATURE-----

--==_Exmh_1567000004_1612P--
