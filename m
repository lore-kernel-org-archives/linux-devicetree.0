Return-Path: <SRS0=obxb=F6=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH usb-next v2 0/3] DWC3 support for Amlogic Meson AXG and GXL SoCs
In-Reply-To: <CAFBinCB=8xQcJHcw5bX4z5Y2JOEqU7O-FH02JS4myJ-d487_zQ@mail.gmail.com>
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com> <CAFBinCBhOy2J7dgyLg-Oii1iMn0RJyud7ykW=EMBGg+F8X7DpA@mail.gmail.com> <CAFBinCB=8xQcJHcw5bX4z5Y2JOEqU7O-FH02JS4myJ-d487_zQ@mail.gmail.com>
Date: Thu, 08 Mar 2018 10:49:35 +0200
Message-ID: <87o9jzuf34.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, yixun.lan@amlogic.com
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>> Martin Blumenstingl (3):
>>>   dt-bindings: usb: add support for dwc3 controller on Amlogic Meson GX
>>>   usb: dwc3: of-simple: add support for shared and pulsed reset lines
>>>   usb: dwc3: of-simple: add support for the Amlogic Meson GXL and AXG
>>>     SoCs
>> could you please let me know if you spotted any problems, code-style
>> issues in v2 or whether you are waiting for feedback from another
>> maintainer?
>> in case everything is fine: will you take this series through your tree?
> could you please let me know how this series is supposed to land in
> the next kernel release:
> - Felipe, will you take it through your usb tree (which contains many
> other dwc2/dwc3 driver changes)?

it'll go through my tree. I'm about to merge it into my testing/next.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlqg+R8ACgkQzL64meEa
mQZFqw//QEwtrXmLQ5Nx99oV+2D/W/TsD9//XOlvRoPMia3WSCJwAUdN6iQ03GTy
CmHacJoJCZiy6tp3ZonscbSbxo/shiGx1YRISUYthAaJJ5QM5AfGHdPp22RwBHs1
VSgppOz5WRViyqY5EbOvBXFUrsY3OjTsb9DHS/6f09IqT/Tgi7UqYhyTziP8XpIn
jPjS4YFp4X3iXcKoUlTeDNoe0gN6kELveP3QRk0L9F8g3MEMPcczW2pwkz6RPh4I
wX3HeNEY8WqfXTV7eHwj9dRicHWa8GDjDzCWg57zXBrqlUmtuN2mPaaYb502pkOb
I8poG4rjyeqQepUnwcohwk9OhMWU+IpXvYrBPpIFN9hSKat1ZNXimHvCdiQX+sps
b5DUqOppvabXdne7cThwCzZ3Znum5eeZELa/Ijp0k07k8smmBGwZDyKhz02zsyqK
ci7XaQiyG+cQLICUSZomjT8C69RAMXbGdGV75zAHZXU2PLriDHCnnvYKfOVyXKK8
tqOaBYse5JDTL6WCUeNCuzcob4MFrsrkLdGpYDJ++8790TDOYYwkv7SIzW9UMi9/
5WUh0a83tu5poNzkc47zilJguX2p4eiW+W2IAm239xGyS8KmIAVO0RsUy8SgbuCm
6hW8ILMbWnnmNGrQKVH6OaoJaHYiZg6jR4GxpaD3zB0ghcWopGw=
=QYpr
-----END PGP SIGNATURE-----
--=-=-=--
