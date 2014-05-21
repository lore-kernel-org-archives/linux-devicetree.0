From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v1 3/4] ARM: qcom: Add APQ8084-MTP board to mach-qcom
Date: Wed, 21 May 2014 10:18:53 -0500
Message-ID: <A6B00F86-FFD3-4FEF-B39E-EAA511565B80@codeaurora.org>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com> <1400684225-21381-4-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1400684225-21381-4-git-send-email-gdjakov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 21, 2014, at 9:57 AM, Georgi Djakov <gdjakov@mm-sol.com> wrote:

> Add board compatibility string to the board machine descriptors.
>=20
> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
> ---
> arch/arm/mach-qcom/board.c |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-qcom/board.c b/arch/arm/mach-qcom/board.c
> index bae617e..ae0a405 100644
> --- a/arch/arm/mach-qcom/board.c
> +++ b/arch/arm/mach-qcom/board.c
> @@ -18,6 +18,7 @@ static const char * const qcom_dt_match[] __initcon=
st =3D {
> 	"qcom,msm8660-surf",
> 	"qcom,msm8960-cdp",
> 	"qcom,apq8074-dragonboard",
> +	"qcom,apq8084-mtp",
> 	NULL
> };
>=20
> --=20
> 1.7.9.5
>=20

Let=92s just make this =93qcom,apq8084=94 to cover other future apq8084=
 based boards.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
