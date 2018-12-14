From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part of the API
Date: Fri, 14 Dec 2018 14:30:18 +0200
Message-ID: <87va3wz3xh.fsf@linux.intel.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com> <1542535751-16079-9-git-send-email-pawell@cadence.com> <5BFE8883.7090802@ti.com> <CAL411-oKvu3EADStit=JtbcxVzM_fFGF2uPn67-wmXxPzUK6GQ@mail.gmail.com> <6b19b55c-66d7-439e-df8f-7b311b45af5e@ti.com> <BYAPR07MB470972A525D85B03C3037D3BDDA60@BYAPR07MB4709.namprd07.prod.outlook.com> <CAL411-oc-_0H88egpHsc06ptL12UsaE63rWwjN7novuFFx_qbA@mail.gmail.com> <5a41de27-cd1f-0cfd-ccdc-dccbf0854fcb@ti.com> <87bm5ol6zt.fsf@linux.intel.com> <d5623e70-7971-d729-f395-7259ab0efdb0@ti.com> <875zvwl585.fsf@linux.intel.com> <7e6ac47e-61e4-ecd3-73d3-9b1be2d81479@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7e6ac47e-61e4-ecd3-73d3-9b1be2d81479@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Peter Chen <hzpeterchen@gmail.com>, pawell@cadence.com
Cc: rogerq@ti.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Sekhar Nori <nsekhar@ti.com> writes:
>>>>> especially since you already know there is going to be another revisi=
on
>>>>> of hardware. It has the advantage that one can easily grep to see whi=
ch
>>>>> hardware is running current version of controller without having acce=
ss
>>>>> to the hardware itself. Becomes useful later on when its time to
>>>>> clean-up unused code when boards become obsolete or for requesting
>>>>> testing help.
>>>>
>>>> This doesn't sound like a very strong argument, actually. Specially wh=
en
>>>> you consider that, since driver will do revision checking based on
>>>> revision register, you already have strings to grep. Moreover, we don't
>>>> usually drop support just like that.
>>>
>>> AFAICS, it is impossible to know just by grep'ing if there is any
>>> hardware still supported in kernel and using DWC3_REVISION_194A, for
>>> example.
>>=20
>> but why do you even care?
>
> When, for example, its coming in the way of some clean-up I am
> attempting to do.

can you share one example when a revision check got in the way of a
cleanup? I fail to see a situation when we need to drop support to older
platforms just to clean some code up.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwToloACgkQzL64meEa
mQam5Q//WQEWQZi6uiQOByEzaPDKl0Cj9Z/kHQj6uN4gEPoGEX4v5LJqDYBgjRfu
RKzL9W1tTzzCZhxJ42jG8VdF12YkWMl4OHkNsdij+9k30wUxRHPciMNYjXoWq/Mi
7mXROG6BenWB/qqJjLIlKctHNjBrPypvTyfXNUNVvT8nWJPEZeZJB0EV4jDc9Ox4
5/PPJQTy6dOOG2R5IABDXtZGag9+US9a/ny7SSdpROcJgyjHYW+UvIZ5B2T/+KA0
TC/WyKWS1mb4BDcJKItaZPze+yESDu8O1N4RSo8ygF7NwExkXBl3aRiUrY3lpDnA
Qxk5ym454V7hd6NNyV4k1lfnRd9PZek/KbquO1Fv4ihAVd8n4Mzor6TtbsKguEzE
dI5P1WtT+1fopjC0FoNvHxiGB/E0onOzgv0+4tvyLcBlEUNvJe4SQWbWgpeH+2+N
XeyK+zV151AlPFNwKm8DNNCuJqVDcGNEsQ+gkB0y7MESasTsZkm+N9mijC5K8WKB
g/mcHwR6W3UjC2bnWO7IXA8XFzGE79cXXwFVwnYAjxzNBLn6mbKjS//vvlu41WxB
URMBMhKlKHIgUJHo7aOx/Py1C/arSDcFsf7Gs5V3WOWysxUnJr9Rv9/5crDFE1C7
WGNdwbXkzpT4Ex/yKtvg4S4BgvV66FW3BCRnuzjgoipjxZN51/8=
=eVG+
-----END PGP SIGNATURE-----
--=-=-=--
