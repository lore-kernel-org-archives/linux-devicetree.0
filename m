Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr140059.outbound.protection.outlook.com ([40.107.14.59]:27776
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726015AbfBKHPS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Feb 2019 02:15:18 -0500
From: Matthias Fend <Matthias.Fend@wolfvision.net>
Subject: AW: [PATCH 2/2] Input: st1232 - handle common DT bindings
Date: Mon, 11 Feb 2019 07:15:12 +0000
Message-ID: <VI1PR08MB37589A1C275E8D0A1224037B85640@VI1PR08MB3758.eurprd08.prod.outlook.com>
References: <1548757144-2222-1-git-send-email-matthias.fend@wolfvision.net>
 <1548757144-2222-2-git-send-email-matthias.fend@wolfvision.net>
In-Reply-To: <1548757144-2222-2-git-send-email-matthias.fend@wolfvision.net>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "'dmitry.torokhov@gmail.com'" <dmitry.torokhov@gmail.com>
Cc: Martin Kepplinger <martin.kepplinger@ginzinger.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

> -----Urspr=FCngliche Nachricht-----
> Von: Matthias Fend <matthias.fend@wolfvision.net>
> Gesendet: Dienstag, 29. J=E4nner 2019 11:19
> An: mfend@vol.at
> Cc: Matthias Fend <Matthias.Fend@wolfvision.net>
> Betreff: [PATCH 2/2] Input: st1232 - handle common DT bindings
>=20
> This is required to specify generic touchscreen properties via DT.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>
> ---
>  drivers/input/touchscreen/st1232.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/st1232.c
> b/drivers/input/touchscreen/st1232.c
> index 11ff32c..efed2e9 100644
> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -21,6 +21,7 @@
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/input/touchscreen.h>
>=20
>  #define ST1232_TS_NAME	"st1232-ts"
>=20
> @@ -41,6 +42,7 @@ struct st1232_ts_finger {
>  struct st1232_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input_dev;
> +	struct touchscreen_properties prop;
>  	struct st1232_ts_finger finger[MAX_FINGERS];
>  	struct dev_pm_qos_request low_latency_req;
>  	int reset_gpio;
> @@ -109,8 +111,7 @@ static irqreturn_t st1232_ts_irq_handler(int irq, voi=
d
> *dev_id)
>  			continue;
>=20
>  		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR,
> finger[i].t);
> -		input_report_abs(input_dev, ABS_MT_POSITION_X,
> finger[i].x);
> -		input_report_abs(input_dev, ABS_MT_POSITION_Y,
> finger[i].y);
> +		touchscreen_report_pos(input_dev, &ts->prop, finger[i].x,
> finger[i].y, true);
>  		input_mt_sync(input_dev);
>  		count++;
>  	}
> @@ -195,6 +196,7 @@ static int st1232_ts_probe(struct i2c_client *client,
>  	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
> MAX_AREA, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_X, MIN_X,
> MAX_X, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, MIN_Y,
> MAX_Y, 0, 0);
> +	touchscreen_parse_properties(input_dev, true, &ts->prop);
>=20
>  	error =3D devm_request_threaded_irq(&client->dev, client->irq,
>  					  NULL, st1232_ts_irq_handler,
> --

You asked me if I could also include the conversion to touchscreen_report_p=
os() - which I did in this patch version.
Is there anything else missing?

Thanks,
  ~Matthias

> 2.7.4
