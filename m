From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH RFC 3/6] hwmon: Add support for RPi voltage sensor
Date: Thu, 17 May 2018 18:25:31 +0100
Message-ID: <87sh6qdwj8.fsf@anholt.net>
References: <1526477827-10859-1-git-send-email-stefan.wahren@i2se.com>
 <1526477827-10859-4-git-send-email-stefan.wahren@i2se.com>
 <20180516182144.GB22705@roeck-us.net>
 <1560428919.21731.1526500741266@email.1und1.de>
 <20180517164320.GA30364@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0234163554495125437=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180517164320.GA30364@roeck-us.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0234163554495125437==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> writes:

> On Wed, May 16, 2018 at 09:59:01PM +0200, Stefan Wahren wrote:
>> Hi Guenter,
>>=20
>> > Guenter Roeck <linux@roeck-us.net> hat am 16. Mai 2018 um 20:21 geschr=
ieben:
>> >=20
>> >=20
>> > On Wed, May 16, 2018 at 03:37:04PM +0200, Stefan Wahren wrote:
>> > > Currently there is no easy way to detect under-voltage conditions on=
 a remote
>> > > Raspberry Pi. This hwmon driver retrieves the state of the under-vol=
tage sensor
>> > > via mailbox interface. The handling based on Noralf's modifications =
to the
>> > > downstream firmware driver. In case of an under-voltage condition on=
ly an entry
>> > > is written to the kernel log.
>> > >=20
>> >=20
>> > My major concern is how this is displayed with the 'sensors' command.
>> > Can you test and report ?
>>=20
>> I get the following output:
>> rpi_volt-isa-0000
>> Adapter: ISA adapter
>> in0:              N/A=20=20
>>=20
> Ok, that works.

Thanks for the quick review on this, Guenter!  This driver is going to
help save a lot of people debugging time on rpis in the upstream kernel.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlr9uwsACgkQtdYpNtH8
nugEqhAAuro9lBVq4y5W1t72ofHEEk1bJG6UPQC+gPFBGJ8zOJ5nP0tDt+C49T1j
fhiyxeGuaxXQj2Lj5ygvxpVts6KVXJZDq+huIjbFbz7eLdPo3wN3ddLvnfTQ9v3J
UR34ssyl7OWvfgfv6ar5AeLv7G3OocTbzf+TCc7yWyg01+792YUz3IiDJJBObTT9
Wls/QAkNgWI4DLf1g5dMKieAw9JmD4Ibe0+N4W+sUOoyM9pkCIlh9GUgQEnrJj3I
r8aQQiwjWoMpaQEFZo6PewfFcisgB3SY5sE9iet/TB3uiJt0zU4W0iSgkG0SxY7q
dj7qprNV+M+J4v4tQWE2pyU0UpH3+KGDVN9SuPto7epBdgeae5Gt2rcSE3tIZtBL
0y0QGIbKxPNGbU2TUEbkhYmQwwZmQ45QfySX/wvwb0Z4J8QmKSONEDju/EA4JDEA
tck1qha72Rl+4q6lsjupcPSt8g8hqe6srLkY/oqrZbvtrMAkqL6vBxqVhPdOOjTN
0G4S6utrkYExXUSpJXTci+eTm6ml7iBKGlqv37Kpbg3a8kXoj7y5bDMb4/1CmZoH
yHyDJACmFBab2hkKz4FDN7atV4wCQFUHXYnmMl1Ki8c1HvpiCbsdnSZ08aUXNUcr
bgM5Wt3+PUcVImJVa7w3y9Sf/UHiNEBpCZckRZwHZThOofer8Bk=
=qrim
-----END PGP SIGNATURE-----
--=-=-=--


--===============0234163554495125437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0234163554495125437==--
