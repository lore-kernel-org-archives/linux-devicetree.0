From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/5] gnss: sirf: power on logic for devices without wakeup signal
Date: Mon, 19 Nov 2018 09:37:06 +0100
Message-ID: <55CBD60B-B1CC-46DE-99D8-980D1239E5FF@goldelico.com>
References: <20181118215801.12280-1-andreas@kemnade.info> <20181118215801.12280-3-andreas@kemnade.info>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org


> Am 18.11.2018 um 22:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> Some Wi2Wi devices do not have a wakeup output, so device state can
> only be indirectly detected by looking whether there is communitcation
> over the serial lines.
> Additionally it checks for the initial state of the device during
> probing to ensure it is off.
> Timeout values need to be increased, because the reaction on serial =
line
> is slower and are in line  with previous patches by
> Neil Brown <neilb@suse.de> and  H. Nikolaus Schaller =
<hns@goldelico.com>.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> drivers/gnss/sirf.c | 97 =
+++++++++++++++++++++++++++++++++++------------------
> 1 file changed, 65 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index b5efbb062316..6a0e5c0a2d62 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -22,8 +22,8 @@
>=20
> #define SIRF_BOOT_DELAY			500
> #define SIRF_ON_OFF_PULSE_TIME		100
> -#define SIRF_ACTIVATE_TIMEOUT		200
> -#define SIRF_HIBERNATE_TIMEOUT		200
> +#define SIRF_ACTIVATE_TIMEOUT		1000
> +#define SIRF_HIBERNATE_TIMEOUT		1000
>=20
> struct sirf_data {
> 	struct gnss_device *gdev;
> @@ -45,26 +45,14 @@ static int sirf_open(struct gnss_device *gdev)
> 	int ret;
>=20
> 	data->opened =3D true;
> -	ret =3D serdev_device_open(serdev);
> -	if (ret)
> -		return ret;
> -
> -	serdev_device_set_baudrate(serdev, data->speed);
> -	serdev_device_set_flow_control(serdev, false);
>=20
> 	ret =3D pm_runtime_get_sync(&serdev->dev);
> 	if (ret < 0) {
> 		dev_err(&gdev->dev, "failed to runtime resume: %d\n", =
ret);
> 		pm_runtime_put_noidle(&serdev->dev);
> 		data->opened =3D false;
> -		goto err_close;
> 	}
>=20
> -	return 0;
> -
> -err_close:
> -	serdev_device_close(serdev);
> -
> 	return ret;
> }
>=20
> @@ -73,8 +61,6 @@ static void sirf_close(struct gnss_device *gdev)
> 	struct sirf_data *data =3D gnss_get_drvdata(gdev);
> 	struct serdev_device *serdev =3D data->serdev;
>=20
> -	serdev_device_close(serdev);
> -
> 	pm_runtime_put(&serdev->dev);
> 	data->opened =3D false;
> }
> @@ -109,6 +95,11 @@ static int sirf_receive_buf(struct serdev_device =
*serdev,
> 	struct sirf_data *data =3D serdev_device_get_drvdata(serdev);
> 	struct gnss_device *gdev =3D data->gdev;
>=20
> +	if ((!data->wakeup) && (!data->active)) {
> +		data->active =3D 1;
> +		wake_up_interruptible(&data->power_wait);
> +	}
> +
> 	/*
> 	 * we might come here everytime when runtime is resumed
> 	 * and data is received. Two cases are possible
> @@ -149,6 +140,25 @@ static int sirf_wait_for_power_state(struct =
sirf_data *data, bool active,
> {
> 	int ret;
>=20
> +	/* no wakeup pin, success condition is that
> +	 * no byte comes in in the period
> +	 */
> +	if ((!data->wakeup) && (!active) && (data->active)) {
> +		/* some bytes might come, so sleep a bit first */
> +		msleep(timeout);
> +		data->active =3D false;
> +		ret =3D =
wait_event_interruptible_timeout(data->power_wait,
> +			data->active =3D=3D true, =
msecs_to_jiffies(timeout));
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		/* we are still getting woken up -> timeout */
> +		if (ret > 0)
> +			return -ETIMEDOUT;
> +		return 0;
> +	}
> +
> 	ret =3D wait_event_interruptible_timeout(data->power_wait,
> 			data->active =3D=3D active, =
msecs_to_jiffies(timeout));
> 	if (ret < 0)
> @@ -203,21 +213,48 @@ static int sirf_set_active(struct sirf_data =
*data, bool active)
> static int sirf_runtime_suspend(struct device *dev)
> {
> 	struct sirf_data *data =3D dev_get_drvdata(dev);
> +	int ret;
>=20
> 	if (!data->on_off)
> 		return regulator_disable(data->vcc);
> +	ret =3D sirf_set_active(data, false);
>=20
> -	return sirf_set_active(data, false);
> +	if (ret)
> +		dev_err(dev, "failed to deactivate");
> +
> +	/* we should close it anyways, so the following receptions
> +	 * will not run into the empty
> +	 */
> +	serdev_device_close(data->serdev);
> +	return 0;
> }
>=20
> static int sirf_runtime_resume(struct device *dev)
> {
> +	int ret;
> 	struct sirf_data *data =3D dev_get_drvdata(dev);
> +	ret =3D serdev_device_open(data->serdev);
> +	if (ret)
> +		return ret;
>=20
> -	if (!data->on_off)
> -		return regulator_enable(data->vcc);
> +	serdev_device_set_baudrate(data->serdev, data->speed);
> +	serdev_device_set_flow_control(data->serdev, false);
> +
> +	if (!data->on_off) {
> +		ret =3D regulator_enable(data->vcc);
> +		if (ret)
> +			goto err_close_serdev;
> +	}
> +	ret =3D sirf_set_active(data, true);
> +
> +	if (!ret)
> +		return 0;
>=20
> -	return sirf_set_active(data, true);
> +	if (!data->on_off)
> +		regulator_disable(data->vcc);
> +err_close_serdev:
> +	serdev_device_close(data->serdev);
> +	return ret;
> }
>=20
> static int __maybe_unused sirf_suspend(struct device *dev)
> @@ -311,18 +348,6 @@ static int sirf_probe(struct serdev_device =
*serdev)
> 	if (data->on_off) {
> 		data->wakeup =3D devm_gpiod_get_optional(dev, =
"sirf,wakeup",
> 				GPIOD_IN);
> -		if (IS_ERR(data->wakeup))
> -			goto err_put_device;
> -
> -		/*
> -		 * Configurations where WAKEUP has been left not =
connected,
> -		 * are currently not supported.
> -		 */
> -		if (!data->wakeup) {
> -			dev_err(dev, "no wakeup gpio specified\n");
> -			ret =3D -ENODEV;
> -			goto err_put_device;
> -		}
> 	}
>=20
> 	if (data->wakeup) {
> @@ -352,6 +377,13 @@ static int sirf_probe(struct serdev_device =
*serdev)
> 	if (IS_ENABLED(CONFIG_PM)) {
> 		pm_runtime_set_suspended(dev);	/* clear runtime_error =
flag */
> 		pm_runtime_enable(dev);
> +		/* device might be enabled at boot, so lets first enable =
it,
> +		 * then disable it to bring it into a clear state
> +		 */

That is an interesting trick to solve the "device is powered on but =
kernel does
not know" problem.

The assumption to make your trick work is that there is nobody besides =
the
running kernel who can turn on/off the device so that after this =
operation,
the kernel can simply track the power state in a boolean flag.

Since the power control gpio is grabbed by this driver, it can't be =
exported
to user-space and hence I think we can take this assumption for granted.

> +		ret =3D pm_runtime_get_sync(dev);
> +		if (ret)
> +			goto err_disable_rpm;
> +		pm_runtime_put(dev);
> 	} else {
> 		ret =3D sirf_runtime_resume(dev);
> 		if (ret < 0)
> @@ -401,6 +433,7 @@ static const struct of_device_id sirf_of_match[] =3D=
 {
> 	{ .compatible =3D "linx,r4" },
> 	{ .compatible =3D "wi2wi,w2sg0008i" },
> 	{ .compatible =3D "wi2wi,w2sg0084i" },
> +	{ .compatible =3D "wi2wi,w2sg0004" },
> 	{},
> };
> MODULE_DEVICE_TABLE(of, sirf_of_match);
> --=20
> 2.11.0
>=20
> _______________________________________________
> http://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

BR,
Nikolaus
