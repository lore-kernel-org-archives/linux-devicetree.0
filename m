From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 3/6] dt-bindings: soc: Add a binding for the Broadcom VCHIQ services. (v3)
Date: Fri, 09 Mar 2018 12:44:01 -0800
Message-ID: <87a7vhvv1q.fsf@anholt.net>
References: <20180309184417.23368-1-eric@anholt.net> <20180309184417.23368-3-eric@anholt.net> <1683748924.258615.1520627491004@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1683748924.258615.1520627491004@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Eric,
>
>> Eric Anholt <eric@anholt.net> hat am 9. M=C3=A4rz 2018 um 19:44 geschrie=
ben:
>>=20
>>=20
>> The VCHIQ communication channel can be provided by BCM283x and Capri
>> SoCs, to communicate with the VPU-side OS services.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>=20
>> v2: VCHI->VCHIQ, dropped firmware property, added cache-line-size
>> v3: Dropped cache-line-size, s/vchi@/mailbox@/
>>=20
>>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt   | 16 +++++++++=
+++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm28=
35-vchiq.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchi=
q.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
>> new file mode 100644
>> index 000000000000..8dd7b3a7de65
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
>> @@ -0,0 +1,16 @@
>> +Broadcom VCHIQ firmware services
>> +
>> +Required properties:
>> +
>> +- compatible:	Should be "brcm,bcm2835-vchiq"
>> +- reg:		Physical base address and length of the doorbell register pair
>> +- interrupts:	The interrupt number
>> +		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>> +
>> +Example:
>> +
>> +mailbox@7e00b840 {
>
> just a question: do you think this is future-proof to claim the doorbell =
for VCHIQ?

There are 4 and this is the only one used so far, so it seems terribly
unlikely to get reused.  If the firmware did for some reason decide to
reuse it for something else, they'd surely go override the DT like they
have in the past.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqi8hEACgkQtdYpNtH8
nui47A//QYr0eRQLvFxI+JNviySeY0ZwRl+TRDCWNO0s5JF8/WEvnSoKb9GPT+4I
sgL6O19L5l6B4muRq9e3X6MPGmWvaImvN6i+8B7DdqWEmFSLeQSNMsahqbI/w8E/
dXy6RmLh7lQyG5AZa11eG8rNvtS7yLu5qIDMMVEWPWcqGytRPAPlLlUrDXZMYALf
grFkkcapXU/Bshz6m8HR84JAlHWbsvidF/zxEUdP+Qf1n8MvqzEbvl9u5U81waGm
CG298oLjipS5DGUt/J0tlLUTXbCHsLFlUNCK6wFyR3VrgwPxmyKkkb5Y7u2zGuTB
ZRDjpVP8lu9jValYky5szeQMNHTNLHUeLZH2gHQ+PQT3P4JGSEV6c2mnqt9FZOp0
j8G6Qvi8luq1CRVt87lmUaEPePEvg1wFXpxfLb8GwbnpG9SxIXuE3muOjU5+eBAO
8M9WdbvMvK4nFqiu701rriqCgeFezPE7L1JfXbHwdLRwXH42Qg26mLUXJJQoxbmp
ZZlIwGTA7UC1bmqIAq+BMXvKnHeRtjMSYieUHwv2K1xHDU4/LWSDMopycvHUaTw8
teU9EA7wPLw8N2GgmZ2zg3KybVEoM3jTcgjCiwOJPnH4KfJuNDXTVhZi2SZoeqGj
LK6dj8fpGBP0GsOS6P/ISndX6y2Omyx0t0aWuzUtTLmBPBFR9jQ=
=Wwg9
-----END PGP SIGNATURE-----
--=-=-=--
