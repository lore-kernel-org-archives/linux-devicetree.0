From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier@javigon.com>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sun, 19 Apr 2015 13:17:20 +0200
Message-ID: <3960750D-EAE4-4FA0-9E15-89F9CE39257E@javigon.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org> <FCFF5E10-0DDC-4ED1-A8B8-D649ADD5E506@javigon.com> <20150418184903.GB30508@kroah.com> <4984990.7rV4p0zMYU@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: multipart/signed; boundary="Apple-Mail=_D63DB89D-AE43-412C-8C96-80F186F5C80D"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4984990.7rV4p0zMYU@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Wiklander <jens.wiklander@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, tpmdd-devel@lists.sourceforge.net, Valentin Manea <valentin.manea@huawei.com>, jean-michel.delorme@st.com, emmanuel.michel@st.com
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_D63DB89D-AE43-412C-8C96-80F186F5C80D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

> On 18 Apr 2015, at 21:01, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> On Saturday 18 April 2015 20:49:03 Greg Kroah-Hartman wrote:
>> On Sat, Apr 18, 2015 at 11:36:53AM +0200, Javier Gonz=E1lez wrote:
>>> Hi,
>>=20
>> A: No.
>> Q: Should I include quotations after my reply?
>>=20
>> http://daringfireball.net/2007/07/on_top
>>=20
>>> We have discussed and implemented an in-kernel interface for the =
driver.
>>> However, we need to agree on that interface with the kernel =
submodules that
>>> can be interested in using it (e.g., IMA, keyring). We though it was =
easier
>>> to have a framework in place before taking this space. This makes =
sense
>>> since a TEE driver will be, as for today, mostly used by user space.
>>> applications.
>>=20
>> No, please provide a "real" solution, just providing a framework that =
no
>> one uses means that I get to delete it from the kernel tree the next
>> release, and I doubt you want that
>>=20
>> Please do all of the work here, as odds are, what you need in the end
>> will be different from what you have proposed here.
>=20
> I guess an alternative would be to remove all the unused =
infrastructure
> code and only provide a user space interface for the features that
> op_tee requires, but no optional user interfaces or in-kernel =
interfaces.
>=20
> 	Arnd

Only providing user space support would defeat one of the main purposes
of the driver. We could better organize the patches and divide them into =
user
space support and in-kernel support if that is what you mean. In the end
the interfaces are orthogonal, even though the functionality should be =
very
similar.


Javier.

--Apple-Mail=_D63DB89D-AE43-412C-8C96-80F186F5C80D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVM47AAAoJEDxGAX0tJXjgFXAP/1bqSk95c4nKGzkLSSCq44/z
R7koKHcFilcb+GhZ+oa6/n71pzDaO4u92AkypbfDMK3IIS+lRvLebE4F+c+qADjL
nc1pNKP4PhlrUfyjuxqGtFUG83stWgd7u47MLevVtG7AKOTs5NVBLm1NSwBztVak
PHYJyIVlJrUzsXNvQn2pVbG4lf6tKge7nCZLQj3zPOKYiLI9JC91gwcUrgTT6F+u
CF9D4P8pDj6y6Fh3eN0zAMA7xdplR5GSPQ8mRnVvdtD6K6CD2jUGDiJGV3TRciV8
UwNJR2x21OUPzPRzpflLFu7MOOyzoTQLV7WoIBO6xSFDn0huvxnT04IcwvgShBSp
TNc4udWg/w/A2+iuBGCCA3x7XQWQvzJgtj+xsAjqheJRI6xKgAcP8BPgB9K/wXN2
/ehTdPfAZVOeLYc0TR4P9Ta1HN8APkoYLVHwyzCpTJajVsgrgN86NhX91ezjWluQ
PzhAjLLvbZ03+kSJXs/UCEe+o5XRGEIPg32bpdi3v0koZTC7UR/etI5YmS29sTvx
IJrhhsiPRbVXdbvCuzRiNlgP+sYToTVLMWlUt/efTgMK0g8R4hcS2lGNVOyL5GOQ
8BH9DHZ3kdjpfoEmaIlg7cFw9YF5n5RPs0zR3elUZz/FneyIkid+hWtdGPZUXvfj
y040vr63s7L+OTx+Uafu
=iWGu
-----END PGP SIGNATURE-----

--Apple-Mail=_D63DB89D-AE43-412C-8C96-80F186F5C80D--
