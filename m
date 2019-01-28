Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41996 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfA1TIt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Jan 2019 14:08:49 -0500
Date: Mon, 28 Jan 2019 11:08:44 -0800
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] Input: st1232 - handle common DT bindings
Message-ID: <20190128190844.GC34692@dtor-ws>
References: <1548666345-24667-1-git-send-email-matthias.fend@wolfvision.net>
 <419160a7-edf5-48cf-85ea-d6d5e9cd6e59.95bf7d06-047e-438c-8c7b-895af195351a.6448af99-cd65-4518-8f79-5ccc17d038ab@emailsignatures365.codetwo.com>
 <1548666345-24667-2-git-send-email-matthias.fend@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548666345-24667-2-git-send-email-matthias.fend@wolfvision.net>
Sender: devicetree-owner@vger.kernel.org
To: Matthias Fend <Matthias.Fend@wolfvision.net>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Matthias,

On Mon, Jan 28, 2019 at 09:06:08AM +0000, Matthias Fend wrote:
> This is required to specify generic touchscreen properties via DT.
> 
> Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>
> ---
>  drivers/input/touchscreen/st1232.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
> index 11ff32c..ad617ac 100644
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
> @@ -195,6 +196,7 @@ static int st1232_ts_probe(struct i2c_client *client,
>  	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, MAX_AREA, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_X, MIN_X, MAX_X, 0, 0);
>  	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, MIN_Y, MAX_Y, 0, 0);
> +	touchscreen_parse_properties(input_dev, true, NULL);

Do you think you could complete the conversion and also use
touchscreen_report_pos() to support common transformations (swap,
invert)?

Thanks!

-- 
Dmitry
