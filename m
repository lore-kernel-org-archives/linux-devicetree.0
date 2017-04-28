From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 4/5] arm64: dts: Add ipq8074 SoC and MTP board support
Date: Fri, 28 Apr 2017 20:58:25 +0200
Message-ID: <20170428185825.75usyll55p3aclnm@latitude>
References: <1493373403-23462-1-git-send-email-varada@codeaurora.org>
 <1493373403-23462-5-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5417218298070034646=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493373403-23462-5-git-send-email-varada@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Manoharan Vijaya Raghavan <mraghava@codeaurora.org>, linux-gpio@vger.kernel.org, catalin.marinas@arm.com, mturquette@baylibre.com, sjaganat@codeaurora.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, will.deacon@arm.com, linux-clk@vger.kernel.org, david.brown@linaro.org, absahu@codeaurora.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org, linux-soc@vger.kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5417218298070034646==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pqg273g3yd2geaxh"
Content-Disposition: inline


--pqg273g3yd2geaxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 28, 2017 at 03:26:42PM +0530, Varadarajan Narayanan wrote:
> Subject: [PATCH 4/5] arm64: dts: Add ipq8074 SoC and MTP board support

s/MTP/HK01/ ?

> Add initial device tree support for the Qualcomm IPQ8074 SoC and
> HK01 evaluation board.
>=20
> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile         |   1 +
>  arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  48 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 153 ++++++++++++++++++++++++=
++++++
>  3 files changed, 202 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq8074.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index cc0f02d..7c6963e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8992-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8994-angler-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8996-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D ipq8074-hk01.dtb

Maybe this list should be alphabetically sorted ('i' before 'm').
(I have no strong preference)


Thanks,
Jonathan Neusch=C3=A4fer

--pqg273g3yd2geaxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJZA5DEAAoJEAgwRJqO81/bK1MP/R3QQEDLkPrxHMI2uG/Gzzw+
3WGIBb6/E9hLxpLIc+glHUK+eEVHLJo5G8VoSIotVWMaz8WdyGNRl5jMsREI1V8x
YbRKs4qO3POsnsSWEzAmOQXAuVF62moXhOm4y13g2Lr0LUtMOG+yIjT6mya7NKFW
7RiT+Gcfkws8xszw8TAmIDUgGbPyri3emM0POMiSFoAB4W6K0kjLdZzypTS9w701
j49QLt+/207wDVq2pggmKOT81Bfp6MmQ5O7QxIgPRzR4QCC12kwMbIQeicxmWJPz
0Aqb3N4tPO5DVNh4wblffY9ReqYSo96XTWuRZP6Ss8j+lEIuEUKN7x70CHVEO58x
Sc5DeoU06mykZQ23A1xyDdwejOIhMGgu2umK/hk/7bcjZFUnkMKJt2faU8FDE+2F
Kah4nHK7qLc+jC7Oi9WOgMOSHeJrTKkhUr8IEIJvgkGqUG8tMV1qQS6VusKC8Luz
RZeIEdhrc56cQz0M6OfXx0enubqgjzHvhVLT4UfPEizRbJRbZftiQUHqXWpAGEte
nbXo3XjrvE4+FiX2fOmg/Nw98SVvMIfoIAKollcbWJg0mdoAbG5hJgv+T3nc6F0T
KqxosLe8sIVwWbVg1pNKdDpHpMnuUCjEZzwGBKe4wV4dQLQvtZntXBlReltCwYta
Ut7D1+Iq3SZ6qIdLX+JX
=OHQk
-----END PGP SIGNATURE-----

--pqg273g3yd2geaxh--


--===============5417218298070034646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5417218298070034646==--
