From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 3/3] regulator: qcom-rpm: Add missing state flag in
 call to RPM
Date: Tue, 20 Jan 2015 14:19:54 +0000
Message-ID: <20150120141954.GS13701@x1>
References: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1417038661-30209-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417038661-30209-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark,

Do you want a pull-request for this, or can I absorb it right into my
tree?

> This adds the missing state parameter to the call down to the RPM. Th=
is
> is currently hard coded to the active state, as that's all we're
> supporting at this moment.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  drivers/regulator/qcom_rpm-regulator.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulat=
or/qcom_rpm-regulator.c
> index b55cd5b..8f66040 100644
> --- a/drivers/regulator/qcom_rpm-regulator.c
> +++ b/drivers/regulator/qcom_rpm-regulator.c
> @@ -198,6 +198,7 @@ static int rpm_reg_write(struct qcom_rpm_reg *vre=
g,
>  	vreg->val[req->word] |=3D value << req->shift;
> =20
>  	return qcom_rpm_write(vreg->rpm,
> +			      QCOM_RPM_ACTIVE_STATE,
>  			      vreg->resource,
>  			      vreg->val,
>  			      vreg->parts->request_len);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
