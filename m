From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [15/17] qcom: ipq4019: add cpu operating points for cpufreq
 support
Date: Wed, 22 Mar 2017 15:10:49 +0100
Message-ID: <40277521.UIyJVnYny8@bentobox>
References: <1458770712-10880-16-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7600287083465387108=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458770712-10880-16-git-send-email-mmcclint@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, john@phrozen.org, qca-upstream.external@qca.qualcomm.com, David Brown <david.brown@linaro.org>, Gopinath Sekar <gsekar@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, andy.gross@linaro.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============7600287083465387108==
Content-Type: multipart/signed; boundary="nextPart2867819.Bl46GRiBX1"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2867819.Bl46GRiBX1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mittwoch, 23. M=E4rz 2016 17:05:10 CET Matthew McClintock wrote:
> This adds some operating points for cpu frequeny scaling
>=20
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
[...]

I saw that you've created a new version of the patch and it was added to
different staging/testing [1] trees.

But I find it rather odd that Codeaurora uses different settings [3]. Here =
for=20
easier comparison:

setting     | QSDK 1.1.3     | proposed patch
=2D--------------------------------------------
clk-latency |         100000 |    256000
opp0        |     48000(000) |  48000000
opp1        |    200000(000) | 200000000
opp2        |    500000(000) | 500000000
opp3        |    710000(000) | 666000000

It looks to me like clk-latency and the opp3 (maximum frequency) are=20
different. Is the reason for this difference known?

I've just noticed it because I got an DTB from an ODM which had even
716000(000) set for opp3.

Kind regards,
	Sven

[1] https://git.lede-project.org/?p=3Dlede/blogic/staging.git;a=3Dblob;f=3D=
target/linux/ipq806x/patches-4.9/0017-qcom-ipq4019-add-cpu-operating-points=
=2Dfor-cpufreq-su.patch;h=3D7cbd6a4551bfd968d013164f76897c603f4ae2ff;hb=3D6=
27e9c2c36839634d987535658a287843a8a9fd6
[2] https://github.com/chunkeey/LEDE-IPQ40XX/blob/a04cf208fe317074502f7ea81=
dafa828c89b74bb/target/linux/ipq40xx/patches-4.9/120-qcom-ipq4019-add-cpu-o=
perating-points-for-cpufreq-su.patch
[3] https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/tree/arch/=
arm/boot/dts/qcom-ipq40xx.dtsi?h=3Drelease/date_r1&id=3D461894f071b168c9637=
95ebfa15d3458b102730a#n768
--nextPart2867819.Bl46GRiBX1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljShekACgkQXYcKB8Em
e0aZ7A/9GL3UYdfRNhpXlzXdovFxWj6301f6Gu+31b9CaSWJHt+LDXPhF1mV/O4y
79/lcn530xgKPhgc5u8TU5w/dX+e84n0yCXCEpKKMXIoH8+MCSMIsFF2gJVmIwp+
MrH+iuesdcfX4SboBwgPQv01Rg5P2jVNF6iasKKN9Aev5INrb0dNqsc16Md5h0ks
UKlTkq/OK2m2xc2MgmM2NkXqhJvzeS3lbH73WitvzDQ7bCB9YltfL2KsVUXiRFL6
WG9zpYckR0+PvnbgdIQwaKnqyyGYb6yZq6UWmfCL9AqCjGtETV/JWivOOV1r410S
0PfyAWt/6jWwegQvddOMW58iM1E2TWquxIAfzMFSsfo8ain9GBb/IFEuohJbnSi7
OzZ+jBz37RuTfzoqb2k7VcadtRGRxcStfo1zZCvBoPvS1oWzOPV5u/vazZ6UUl1Z
DPU5xdww1BoES59mfIzX+1BrAQRXvoP9Lfk0WfChmRvJRFyXsr500KA9LLAKDsiQ
/f09fcuPa7QSQE+RTvg/k+cAaz1xrQ3Rjo3B8x2v/OSQ+PdjdaKuMkuIGWIj8igE
uN5+JL5inob0mpuE2FuTsbs9r9gT5fH0XUlES3x/VnYlbbtyqg134aOyzArzHHhz
PFTa+5oUdp4vkiD/sp6oLSD/dCdy6NDOfrXjdeVuhMg/4H+IPzs=
=eudq
-----END PGP SIGNATURE-----

--nextPart2867819.Bl46GRiBX1--



--===============7600287083465387108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7600287083465387108==--
