Return-Path: <SRS0=Fy5c=QS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39467 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfBKIm3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Feb 2019 03:42:29 -0500
Date: Mon, 11 Feb 2019 00:42:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 2/2] Input: st1232 - handle common DT bindings
Message-ID: <20190211084225.GB95126@dtor-ws>
References: <1548758654-27153-1-git-send-email-matthias.fend@wolfvision.net>
 <1548758654-27153-2-git-send-email-matthias.fend@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548758654-27153-2-git-send-email-matthias.fend@wolfvision.net>
Sender: devicetree-owner@vger.kernel.org
To: Matthias Fend <matthias.fend@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, martin.kepplinger@ginzinger.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 29, 2019 at 11:44:14AM +0100, Matthias Fend wrote:
> This is required to specify generic touchscreen properties via DT.
> 
> Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>

Applied, thank you.

> ---
>  drivers/input/touchscreen/st1232.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
> index 11ff32c..6485936 100644
> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -21,6 +21,7 @@
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/input/touchscreen.h>
>  
>  #define ST1232_TS_NAME	"st1232-ts"
>  
> @@ -41,6 +42,7 @@ struct st1232_ts_finger {
>  struct st1232_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input_dev;
> +	struct touchscreen_properties prop;
>  	struct st1232_ts_finger finger[MAX_FINGERS];
>  	struct dev_pm_qos_request low_latency_req;
>  	int reset_gpio;
> @@ -109,8 +111,8 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
>  			continue;
>  
>  		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, finger[i].t);
> -		input_report_abs(input_dev, ABS_MT_POSITION_X, finger[i].x);
> -		input_report_abs(input_dev, ABS_MT_POSITION_Y, finger[i].y);
> +		touchscreen_report_pos(input_dev, &ts->prop,
> +					finger[i].x, finger[i].y, true);
>  		input_mt_sync(input_dev);
>  		count++;
>  	}
> @@ -195,6 +197,7 @@ static int st1232_ts_probe(struct i2c_client *client,
>  	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, MAX_AREA, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_X, MIN_X, MAX_X, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, MIN_Y, MAX_Y, 0, 0);
> +	touchscreen_parse_properties(input_dev, true, &ts->prop);
>  
>  	error = devm_request_threaded_irq(&client->dev, client->irq,
>  					  NULL, st1232_ts_irq_handler,
> -- 
> 2.7.4
> 

-- 
Dmitry
