From: Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH v3 2/4] edac: Add support for Amazon's Annapurna Labs L1
 EDAC
Date: Tue, 3 Sep 2019 07:24:37 +0000
Message-ID: <20190903072427.ptmde6hda5uyauhf@rric.localdomain>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
 <1563197049-12679-3-git-send-email-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563197049-12679-3-git-send-email-hhhawa@amazon.com>
Content-Language: en-US
Content-ID: <7B46B4A6D16D864F9B87EBC3ECDCB3DC@namprd18.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hanna Hawa <hhhawa@amazon.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@amazon.com" <benh@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "jonnyc@amazon.com" <jonnyc@amazon.com>, "hanochu@amazon.com" <hanochu@>
List-Id: devicetree@vger.kernel.org

On 15.07.19 16:24:07, Hanna Hawa wrote:
> Adds support for Amazon's Annapurna Labs L1 EDAC driver to detect and
> report L1 errors.
>=20
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> ---
>  MAINTAINERS               |   6 ++
>  drivers/edac/Kconfig      |   8 +++
>  drivers/edac/Makefile     |   1 +
>  drivers/edac/al_l1_edac.c | 156 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 171 insertions(+)
>  create mode 100644 drivers/edac/al_l1_edac.c

> diff --git a/drivers/edac/al_l1_edac.c b/drivers/edac/al_l1_edac.c
> new file mode 100644
> index 0000000..70510ea
> --- /dev/null
> +++ b/drivers/edac/al_l1_edac.c

[...]

> +static void al_l1_edac_cpumerrsr(void *arg)

Could this being named to something meaningful, such as
*_read_status() or so?

> +{
> +	struct edac_device_ctl_info *edac_dev =3D arg;
> +	int cpu, i;
> +	u32 ramid, repeat, other, fatal;
> +	u64 val =3D read_sysreg_s(ARM_CA57_CPUMERRSR_EL1);
> +	char msg[AL_L1_EDAC_MSG_MAX];
> +	int space, count;
> +	char *p;
> +
> +	if (!(FIELD_GET(ARM_CA57_CPUMERRSR_VALID, val)))
> +		return;

[...]

> +static void al_l1_edac_check(struct edac_device_ctl_info *edac_dev)
> +{
> +	on_each_cpu(al_l1_edac_cpumerrsr, edac_dev, 1);
> +}
> +
> +static int al_l1_edac_probe(struct platform_device *pdev)
> +{
> +	struct edac_device_ctl_info *edac_dev;
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	edac_dev =3D edac_device_alloc_ctl_info(0, (char *)dev_name(dev), 1, "L=
",

This type cast looks broken. dev_name() is a constant string already.

Other drivers do not use the dynamically generated dev_name() string
here, instead a fix string such as mod_name or ctl_name could be used.
edac_device_alloc_ctl_info() later generates a unique instance name
derived from name + index.

Regarding the type, this seems to be an API issue of edac_device_
alloc_ctl_info() that should actually use const char* in its
interface. So if needed (from what I wrote above it is not) the type
in the argument list needs to be changed instead.

> +					      1, 1, NULL, 0,
> +					      edac_device_alloc_index());
> +	if (IS_ERR(edac_dev))
> +		return -ENOMEM;

Use the original error code instead.

> +
> +	edac_dev->edac_check =3D al_l1_edac_check;
> +	edac_dev->dev =3D dev;
> +	edac_dev->mod_name =3D DRV_NAME;
> +	edac_dev->dev_name =3D dev_name(dev);
> +	edac_dev->ctl_name =3D "L1 cache";

Should not contain spaces and maybe a bit more specific.

> +	platform_set_drvdata(pdev, edac_dev);
> +
> +	ret =3D edac_device_add_device(edac_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to add L1 edac device\n");

Move this printk below to the error path and maybe print the error
code. You do not cover the -ENOMEM failure.

-Robert

> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	edac_device_free_ctl_info(edac_dev);
> +
> +	return ret;
> +}
