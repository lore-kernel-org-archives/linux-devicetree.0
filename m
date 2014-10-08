From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 6/7] mfd: qcom-smd-rpm: Driver for the Qualcomm RPM over SMD
Date: Wed, 8 Oct 2014 09:40:17 +0100
Message-ID: <20141008084017.GD20647@lee--X1>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-7-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1412037291-16880-7-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Sep 2014, Bjorn Andersson wrote:

> Driver for the Resource Power Manager (RPM) found in Qualcomm 8974 ba=
sed
> devices.
> The driver exposes resources that child drivers can operate on; to
> implementing regulator, clock and bus frequency drivers.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>=20
> Note that the qcom_rpm_smd_write is equivalent of qcom_rpm_write and =
there is a
> possibility of re-using at least the clock implementation on top of t=
his. This
> would however require some logic for calling the right implementation=
 so I have
> not done it at this time to keep things as clean as possible.
>=20
> An idea for improvement is that in qcom_rpm_smd_write we put the ack_=
status and
> completion on the stack and register this with idr using the message =
id, upon
> receiving the interrupt we would find the right client and complete t=
his.
> Allowing for multiple requests to be in flight at any given time.
>=20
> I did not implement this because I haven't done any measurements on w=
hat kind
> of improvements this could give and it would be a clean iteration ont=
op of
> this.
>=20
>  drivers/mfd/Kconfig              |   14 ++
>  drivers/mfd/Makefile             |    1 +
>  drivers/mfd/qcom-smd-rpm.c       |  299 ++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/qcom-smd-rpm.h |    9 ++
>  4 files changed, 323 insertions(+)
>  create mode 100644 drivers/mfd/qcom-smd-rpm.c
>  create mode 100644 include/linux/mfd/qcom-smd-rpm.h


> +#define RPM_ERR_INVALID_RESOURCE "resource does not exist"
> +
> +static bool qcom_rpm_msg_is_invalid_resource(struct qcom_rpm_message=
 *msg)
> +{
> +	size_t msg_len =3D sizeof(RPM_ERR_INVALID_RESOURCE) - 1;
> +
> +	if (msg->length !=3D msg_len)
> +		return false;
> +
> +	if (memcmp(msg->message, RPM_ERR_INVALID_RESOURCE, msg_len))
> +		return false;
> +
> +	return true;
> +}

You can save yourself a hell of a lot of code by just doing:

if (memcmp(msg->message, RPM_ERR_INVALID_RESOURCE,
           min(msg_len, sizeof(RPM_ERR_INVALID_RESOURCE))))

=2E.. in qcom_smd_rpm_callback().

[...]

> +static int qcom_smd_rpm_probe(struct qcom_smd_device *sdev)
> +{
> +	const struct of_device_id *match;
> +	struct qcom_smd_rpm *rpm;
> +
> +	rpm =3D devm_kzalloc(&sdev->dev, sizeof(*rpm), GFP_KERNEL);
> +	if (!rpm)
> +		return -ENOMEM;
> +
> +	rpm->dev =3D &sdev->dev;
> +	mutex_init(&rpm->lock);
> +	init_completion(&rpm->ack);
> +
> +	match =3D of_match_device(qcom_smd_rpm_of_match, &sdev->dev);

You need to check the return value here.

> +	rpm->data =3D match->data;
> +	rpm->rpm_channel =3D sdev->channel;
> +
> +	dev_set_drvdata(&sdev->dev, rpm);
> +
> +	dev_info(&sdev->dev, "Qualcomm SMD RPM driver probed\n");

Please remove this line.

> +	return of_platform_populate(sdev->dev.of_node, NULL, NULL, &sdev->d=
ev);
> +}
> +
> +static void qcom_smd_rpm_remove(struct qcom_smd_device *sdev)
> +{
> +	dev_set_drvdata(&sdev->dev, NULL);

If you use the proper platform device interface you don't have to do
this.

> +	of_platform_depopulate(&sdev->dev);
> +}
> +
> +static struct qcom_smd_driver qcom_smd_rpm_driver =3D {
> +	.probe =3D qcom_smd_rpm_probe,
> +	.remove =3D qcom_smd_rpm_remove,
> +	.callback =3D qcom_smd_rpm_callback,
> +	.driver  =3D {
> +		.name  =3D "qcom_smd_rpm",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D qcom_smd_rpm_of_match,
> +	},
> +};
> +
> +module_qcom_smd_driver(qcom_smd_rpm_driver);

I don't like this.  What's wrong with the existing platform driver
code?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
