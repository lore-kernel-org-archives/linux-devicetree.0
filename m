From: Kiran Padwal <kiran.padwal@smartplayin.com>
Subject: Re: [RFC 4/7] soc: qcom: Add Shared Memory Manager driver
Date: Tue, 30 Sep 2014 11:47:19 +0530
Message-ID: <542A4AEF.2030402@smartplayin.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com> <1412037291-16880-5-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1412037291-16880-5-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Tuesday 30 September 2014 06:04 AM, Bjorn Andersson wrote:
> The Shared Memory Manager driver implements an interface for allocati=
ng
> and accessing items in the memory area shared among all of the
> processors in a Qualcomm platform.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---

<snip>

> +
> +static int qcom_smem_probe(struct platform_device *pdev)
> +{
> +	struct qcom_smem *smem;
> +	struct resource *res;
> +	size_t array_size;
> +	int num_regions =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < pdev->num_resources; i++) {
> +		res =3D &pdev->resource[i];
> +
> +		if (resource_type(res) =3D=3D IORESOURCE_MEM)
> +			num_regions++;
> +	}
> +
> +	if (num_regions =3D=3D 0) {
> +		dev_err(&pdev->dev, "no smem regions specified\n");
> +		return -EINVAL;
> +	}
> +
> +	array_size =3D num_regions * sizeof(struct smem_region);
> +	smem =3D devm_kzalloc(&pdev->dev, sizeof(*smem) + array_size, GFP_K=
ERNEL);
> +	if (!smem)
> +		return -ENOMEM;
> +
> +	smem->dev =3D &pdev->dev;
> +	smem->hwlock =3D of_hwspin_lock_request(pdev->dev.of_node, NULL);

Compilation breaks while I try to compile with this patch.
Do I missing anything? Below is the error I am getting,

drivers/soc/qcom/qcom_smem.c: In function =91qcom_smem_probe=92:
drivers/soc/qcom/qcom_smem.c:274:2: error: implicit declaration of func=
tion =91of_hwspin_lock_request=92 [-Werror=3Dimplicit-function-declarat=
ion]
  smem->hwlock =3D of_hwspin_lock_request(pdev->dev.of_node, NULL)

Thanks,
--Kiran
