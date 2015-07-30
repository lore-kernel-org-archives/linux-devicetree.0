From: Mikhail Yakshin <greycat@whiteboxes.ch>
Subject: ARM: dts: sunxi: Regulators at common board layouts
Date: Thu, 30 Jul 2015 12:45:41 +0300
Message-ID: <55B9F245.2000300@whiteboxes.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5233856204809508069=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5233856204809508069==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Axcpkq2O7U4fGtsmmFBMUT5uP5lpWHvqi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Axcpkq2O7U4fGtsmmFBMUT5uP5lpWHvqi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've been analyzing various boards based on Allwinner A20 CPU and
X-Powers AXP209 PMU (to make a proper configuration for our board,
Whitebox Labs Watermelon).

There are some things very common and some things pretty different on
various boards.

Namely, there's agreement on that DCDC2 and DCDC3 and used for CPU
voltages (VDD-CPU and (VDD-SYS=3DVDD-INT)+VDD-DLL respectively) on all
boards I've analyzed (Olimex boards, Cubieboard / Cubietruck, BananaPi,
PCDuino, Watermelon, etc) and probably it should be kept this way.

However, what puzzles me the most so far is LDO1 regulator. According to
[AXP209 datasheet, p. 13, p. 23][1] and all the boards I've
investigated, it's used exclusively for powering VDD-RTC input of A20
CPU that supports internal CPU's RTC. LDO1 gets very special status in
AXP209 - basically, it's as close to "always on" (even on backup
battery) as possible the purpose of timekeeping.

According to the same spec, LDO1 allows 2 distinct voltage choices: 1.3V
and 3.3V. However, according to the [A20 datasheet][2], VDD-RTC (pin K8)
has absolute minimum and maximum voltage ratings of 3.0V. I'm not sure
how is it supposed to work together, given that X-Powers AXP209 and
Allwinner A20 is basically produced by different branches the same
company and are meant to be totally compatible.

What's even more weird, is that all configurations I've encountered so
far (i.e. FEX configurations for 3.4 sunxi kernel and DTS for modern
mainline kernels) use hard locked 1.3V setting for LDO1. For example,
kernel 3.4:

/sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/axp20-regulator.21/regulat=
or/regulator.1/
name    axp20_ldo1
microvolts      1300000
min_microvolts  1300000
max_microvolts  1300000

and similar construction in mainline DTSes:

    vdd_rtc: ldo1 {
            regulator-min-microvolt =3D <1300000>;
            regulator-max-microvolt =3D <1300000>;
            regulator-always-on;
    };

or in axp209.dtsi:

    reg_ldo1: ldo1 {
            /* LDO1 is a fixed output regulator */
            regulator-always-on;
            regulator-min-microvolt =3D <1300000>;
            regulator-max-microvolt =3D <1300000>;
            regulator-name =3D "ldo1";
    };

If we'll take a look at default power-on setup for AXP209 in the
datasheet (page 24), we'll see that it's determined by LDO1SET pin. If
it's connected to GND, then LDO1 will start with 1.3V, if it's connected
to VINT, then it would be 3.3V.

I've analyzed all the schematics I found in public:

* Older Olimex schematics (Lime rev C, Lime rev D, Lime2 rev B) state
that LDO1 line is "3V3/30mA". LDO1SET is grounded.
* Newer Olimex schematics (Lime2 rev C) call that "1V3/30mA". LDO1SET is
grounded.
* All Bananapi and Cubieboard schematics look very similar and seem to
be originating from the same source (reference Allwinner design?) and do
not hint any voltages. LDO1SET is grounded.

Can someone explain to me how does it work / supposed to work?

[1]: http://linux-sunxi.org/images/8/89/AXP209_Datasheet_v1.0en.pdf
[2]:
https://github.com/OLIMEX/OLINUXINO/raw/master/HARDWARE/A20-PDFs/A20%20Da=
tasheet%20v1.0%2020130227.pdf

--=20
WBR, Mikhail Yakshin


--Axcpkq2O7U4fGtsmmFBMUT5uP5lpWHvqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW58k4ACgkQvXjOht2i9jtK0wCfTMMhO0LwkvzHXAjgR24X8ore
wZsAn0pwGFotXIxZ/5+6wkpOG3LxKUNV
=r0YH
-----END PGP SIGNATURE-----

--Axcpkq2O7U4fGtsmmFBMUT5uP5lpWHvqi--


--===============5233856204809508069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5233856204809508069==--
