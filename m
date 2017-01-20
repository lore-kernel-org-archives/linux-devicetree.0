From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM == DWC_USB3_NUM_IN_EPS
Date: Fri, 20 Jan 2017 14:10:02 +0200
Message-ID: <871svy9bl1.fsf@linux.intel.com>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie> <87mvemx0so.fsf@linux.intel.com> <2B3535C5ECE8B5419E3ECBE300772909021B3FEC4C@US01WEMBX2.internal.synopsys.com> <71877fff-11b1-0a27-8170-ff42ace181cd@nexus-software.ie>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <71877fff-11b1-0a27-8170-ff42ace181cd-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "gregkh@linuxfoundation.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland@arm.com" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org> writes:
> On 19/01/17 22:49, John Youn wrote:
>
>> So it is valid to have say, DWC_USB3_NUM_EPS=3D8 and
>> DWC_USB3_NUM_IN_EPS=3D8. Even though it is not possible to use all 8 EPs
>> as IN since you need at least one of them to be a control OUT. So you
>> could have a configuration of EP0 IN and OUT plus 6 IN EPs (total 1
>> OUT, 7 IN). Or EP0 IN and OUT plus any other combination of IN/OUT for
>> the remaining 6 EPs.
>>=20
>> With the above in mind, you can probably just redo the endpoint number
>> logic in dwc3 to handle all cases without any quirks at all.
>
> I thought of that.
>
>> If it is disabled, it will fix the physical and logical EP number and
>> direction of the available EPs to meet timings for FPGA designs. This
>> shouldn't be used in final designs for ASICS but we don't know for
>> sure whether it has made it to any final designs or not.
>>=20
>> And unfortunately, whether this is set or not is not visible to the
>> software so it will require a quirk.
>
> but arrived at this conclusion because I couldn't think of a reasonable
> guess value for IN/OUT endpoint numbers that would work if
> DWC_USB3_NUM_EPS =3D=3D DWC_USB3_NUM_IN_EPS

Well, we can, for now at least, take the simple approach of half IN,
half OUT. If DWC3_USB3_NUM_EPS is odd, then OUT should take the extra
endpoint. If anybody complains, we can fix it later ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAliB/hoACgkQzL64meEa
mQbo8w/9GnmSLZhaQAzT4MN7FWHa4p83igvIHiqzQH34eUTpQoO1+n2UuwQBeRcl
028w3m8yTJPYsj8johBOB2um3GDe1/BX1iS+syFmUWVcEv7wEj52wwnhM4K0gR6I
OlDiFJRGPi9cftLzzgKtfksjAlFiloMyneFgivuRp1dYS91L9ObwQKBhHpgtWQ+6
YvxvG95gVcDKYO5t/uPDQbuE3H94lL2WFOGrWxTo14/9rR9tDDw0hJx7A+sVK1ta
x8IWZ7zHGRCJNRD4d7fx4eK1r13EK0Obh1QT6YBgX0io7xCscz3ZIo6P4L8uv64P
sMmo5DS3RskH9Yl1vPg6str+c61qY5utry4zsWtFkM/VbS5I9/SmpUN4wFMu6k2v
gYaI2fZrpMr3IV3u6tTJ6Xorc0myk32TPbs5V6rXdXd6sJqBGHU826eGdVFaK434
/MqviEE7BfW0gr+7ygog5v2B+uB6c1e/wE7F9031lPli1iYGj7ZoQB8+dg5n5pJX
irHkcd9fQaRksTtRVTdPDO85qON7meDzziHoTG2ocPWqSJUaBShRS4S60l+khPrI
fX4igUwfJeQ76CQ1nNUYApUMZV8EhoimnnwMsx+B1nl1DZaS1BxF2VZeTL5rH6Zn
Qjh0wkKy+tRUaFH/b6cYb81lh56sqyZ1HFm0Z+DQgCPIdBC8q2I=
=AE8m
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
