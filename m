From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v1] ARM: dts: sun7i: provide ramoops region on BananaPi
Date: Thu, 22 Jun 2017 08:40:44 +0200
Message-ID: <48c81184-3713-31a8-03e8-f55ffaef639c@rempel-privat.de>
References: <1498065017-30556-1-git-send-email-linux@rempel-privat.de>
 <20170622061617.5guhcyxdthvmiq7j@flea.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0138813283463114002=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170622061617.5guhcyxdthvmiq7j@flea.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Colin Cross <ccross@android.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0138813283463114002==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Vk9fo16Qcoxfjrp9mLSuJre2Aem7GfaXl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vk9fo16Qcoxfjrp9mLSuJre2Aem7GfaXl
Content-Type: multipart/mixed; boundary="RUM1U6ePKkIcEvxuOjrHGuuk3CKINcLFk";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-ID: <48c81184-3713-31a8-03e8-f55ffaef639c@rempel-privat.de>
Subject: Re: [PATCH v1] ARM: dts: sun7i: provide ramoops region on BananaPi
References: <1498065017-30556-1-git-send-email-linux@rempel-privat.de>
 <20170622061617.5guhcyxdthvmiq7j@flea.lan>
In-Reply-To: <20170622061617.5guhcyxdthvmiq7j@flea.lan>

--RUM1U6ePKkIcEvxuOjrHGuuk3CKINcLFk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 22.06.2017 um 08:16 schrieb Maxime Ripard:
> Hi Oleksij,
>=20
> On Wed, Jun 21, 2017 at 07:10:17PM +0200, Oleksij Rempel wrote:
>> This should help provide useful debug information on remote
>> targets without UART.
>>
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>> ---
>>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/=
dts/sun7i-a20-bananapi.dts
>> index ed2f35a..38923bf 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>> @@ -63,6 +63,22 @@
>>  		stdout-path =3D "serial0:115200n8";
>>  	};
>> =20
>> +	reserved-memory {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges;
>> +
>> +		ramoops@7fb6a000 {
>> +			compatible =3D "ramoops";
>> +			reg =3D <0x7fb6a000 0x100000>;
>> +			ecc-size	=3D <16>;
>> +			record-size	=3D <0x00020000>;
>> +			console-size	=3D <0x00020000>;
>> +			ftrace-size	=3D <0x00020000>;
>> +			pmsg-size	=3D <0x00020000>;
>> +		};
>> +	};
>> +
>=20
> I'm a bit skeptical about this one.

I can understand your concern.

> First, there's nothing specific to the bananapi,

It is specific to memory size, bootloader used for the board and in some
cases security co processor. Any thing else I forgot?

> but every one will> want to have different sizes here, or different par=
ameters.

I don't thing every one need different configurations. I assume current
parameters are good enough for most users. But if users need some thing
different they should be overwritten by kernel boot args.

May be, DTS should provide some generic/ramoops area and let
distributions decide how to use it? For example compile kernel with some
defaults for ramoops.

> Since using the kernel parameters is also an option, I'd rather
> document how to do that with the parameters.

Here are my arguments to do this in DTS:
- some issues are hardly reproducible and it is good to catch it as soon
as possible. So it should be enabled before first problem will happen.
- my previous experience with pstore was a bit disappointing, it didn't
worked on SMP system correctly. So the test coverage seems to be
minimal. Probably because it is not enabled by default.
- at least barebox can extract some postmortem information from not
booting system. Bootloader and Kernel need to use same parameters,
devicetree seems to be perfect here.
- distributions should be able to use this per default as soon as this
option is available.

--=20
Regards,
Oleksij


--RUM1U6ePKkIcEvxuOjrHGuuk3CKINcLFk--

--Vk9fo16Qcoxfjrp9mLSuJre2Aem7GfaXl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAllLZnIACgkQHwImuRkmbWmTVQEAmfnVRopApw8bN8iklxtbhuWI
xxH6xYaqWMPix0WeHbMA/0r9eV+imU+bxDxo5bQV8EJvCBA9iKpdf711wgOqMU5J
=EQHj
-----END PGP SIGNATURE-----

--Vk9fo16Qcoxfjrp9mLSuJre2Aem7GfaXl--


--===============0138813283463114002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0138813283463114002==--
