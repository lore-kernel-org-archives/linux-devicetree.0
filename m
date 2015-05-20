From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 2/2] tee: add OP-TEE driver
Date: Wed, 20 May 2015 16:11:05 +0200
Message-ID: <887DE856-552A-4A21-8CC7-CFB9B80033E4@javigon.com>
References: <1431671667-11219-1-git-send-email-jens.wiklander@linaro.org> <1431671667-11219-3-git-send-email-jens.wiklander@linaro.org> <20150518131850.GA7064@leverpostej> <20150520121648.GA9819@ermac>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/signed; boundary="Apple-Mail=_ACB1821F-3962-46B1-8CF7-D3C063AFD75B"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150520121648.GA9819@ermac>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "jean-michel.delorme-qxv4g6HH51o@public.gmane.org" <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>, "emmanuel.michel-qxv4g6HH51o@public.gmane.org" <emmanuel.michel-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_ACB1821F-3962-46B1-8CF7-D3C063AFD75B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,
Just for completeness,

> On 20 May 2015, at 14:16, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>=20
> Hi,
>=20
> On Mon, May 18, 2015 at 02:18:50PM +0100, Mark Rutland wrote:
>> Hi,
>>=20
>> On Fri, May 15, 2015 at 07:34:27AM +0100, Jens Wiklander wrote:
>=20
[=E2=80=A6]

>>=20
>> I'm also very concerned that the interface exposed to userspace is
>> hideously low-level. Surely we'd expect kernel-side drivers to be =
doing
>> the bulk of direct communication to the OP-TEE instance? In the lack =
of
>> a provided rationale I don't see why the current messaging interface
>> would make sense.
> The kernel-side does all the direct communication since there's where
> the SMC is done, but one level above most of the communication is
> terminated in user space. Loading of Trusted Applications and other =
file
> system access is done in by a helper process in user space,
> tee-supplicant. A large part of the OP-TEE message protocol is
> transparent to the kernel.
>=20
> We're trying to not exclude any TEE implementation by having this low
> level TEE_IOC_CMD instead of a high level interface. The problem with
> the different TEEs is that they are designed differently and we =
haven't
> been able to find a high level interface that suits all. Applications
> aren't expected to use TEE_IOC_CMD directly, instead there's supposed =
to
> be a client lib wich wraps the kernel interface and provides a higher
> level interface, for instance a Global Platform Client API in the case
> of a GP TEE.
>=20
> For OP-TEE we're using the same protocol all the way down to user =
space,
> the advantage is that it's only one protocol to keep track of and we
> don't need to translate the entire message (we do need to copy it,
> excluding the payload) each time the message is passed to the next
> memory space. In the presence of a hypervisor we have
> user space -> kernel -> hypervisor -> secure world
> Unfortunately some fields has a different meaning in user space and
> kernel space. I'll address this in the documentation.
>=20
> The OP-TEE helper process, tee-supplicant, is specific to only OP-TEE.
> Other TEEs uses helper processes too, but what they do depend on the
> design of the TEE. As a consequence more or less all TEEs needs
> something specific for that particular TEE in user space to be fully
> functional.
>=20
> To summarize, the current assumption is that all TEEs can't use the =
same
> high level interface. Instead we need to provide a way for each TEE to
> have their own low level interface which should be wrapped in a user
> space library to provide a more reasonable interface to the client
> application.
>=20
>=20

This design aims to be TEE agnostic.

As Jens mentioned, user space applications are supposed to use =
client-side
API=E2=80=99s (e.g., Global Platform). It is convenient that these APIs =
reside in user
space together with the wrapper using the kernel TEE interface. Note =
that
GP=E2=80=99s APIs have changed much since they were first released. It =
would be
a lot of work to keep them updated in the kernel and we would eventually
run into the issue that they are not backwards compatible, thus making  =
user
space applications break.

Also, we want to eventually support kernel submodules to use the TEE =
subsystem.
In this case, having a simple in-kernel interface makes things easier. =
Again,
having a rich API such as GP in the kernel would not add any value.

[=E2=80=A6]

Javier.


--Apple-Mail=_ACB1821F-3962-46B1-8CF7-D3C063AFD75B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVXJX5AAoJEDxGAX0tJXjgsYAP/Ao3OM9GNfWNQS7OAsyjUL9m
I/NQSW9KUcb1rFzCYgbcnf+768ZkLRMV6dpiB0qKPWp9R086ntfvXFQUI5gGuZPY
TRDFdrMA+u0BoUMqXIhtDE+ql+uAnZItYzYtblgrM5fofO/aMNIHWfGdV94oZWR+
X4SXOMlPHs9uLQ2cJJGcnTKc8O1+6mao3WtmVINwTdEWCVH293OLkNMElUlFY4wP
WiIe8sv6UauW9XJVNSdxJr9oqx18wUMWsoCfKflSB+4GvTI2q1RbwDbBgp6pU0pj
m77sRck4//vG8FZanUv5rYq8kI7o/aGZNwzOVV+4oD2XRfu7SxDPnuJHdsXzo6zf
xBQB+YzaE2wasoln1+sG3a5Rx4oBTBbouc8rnBX5ZSDSro2vW0+Tg3sr29FG4eMN
hfwf+tFp6UP1oa7ak8u+t2Fi36VpRoGq54hoq2oRXCE/FRyWXvOWnp3Gbri8fjjc
s69CoxkD5yGPPm/sP3CEEM2wuOPzw1AqIaWDXD7uSQgDEFghGicYLUz+ggM8XanY
vk93nA/qF73GyrqN3Z58REhVyD/7l2ks6o7YuCH4VjA/56QChmwF9eMXHRQYIAQV
MuZSSQKO9VdNUcNqzbPRW82non1gEOgACkDdXcEh6MekuID/R5VAU3IC2ghEHUKk
gHdX4oOa4374C5e8Hbxe
=Y1iZ
-----END PGP SIGNATURE-----

--Apple-Mail=_ACB1821F-3962-46B1-8CF7-D3C063AFD75B--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
