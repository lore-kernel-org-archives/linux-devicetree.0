Return-Path: <devicetree-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:60082 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753722Ab3HSCur (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Sun, 18 Aug 2013 22:50:47 -0400
Message-ID: <1376880644.2027.35.camel@joe-AO722>
Subject: Re: [PATCH 2/2] drivers: block :swim3: fixed the errors on coding
 style
From: Joe Perches <joe@perches.com>
Date: Sun, 18 Aug 2013 19:50:44 -0700
In-Reply-To: <1376854740-17580-1-git-send-email-write2thiagu@gmail.com>
References: <1376854740-17580-1-git-send-email-write2thiagu@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Thiagarajan Thangavel <write2thiagu@gmail.com>
Cc: grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 2013-08-19 at 01:09 +0530, Thiagarajan Thangavel wrote:
> Fixed the coding style errors
[]
> diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
[]
> @@ -783,7 +783,7 @@ static irqreturn_t swim3_interrupt(int irq, void *dev_id)
>  				act(fs);
>  			} else {
>  				swim3_err("Error %sing block %ld (err=%x)\n",
> -				       rq_data_dir(req) == WRITE ? "writ" : "read",
> +				rq_data_dir(req) == WRITE ? "writ" : "read",

This looks worse to me.

My preference would be to align the arguments to the open
parenthesis and to use full words instead:

				swim3_err("Error %s block %ld (err=%x)\n",
					  rq_data_dir(req) == WRITE ? "writing" : "reading",
					  (long)blk_rq_pos(req), err);

> @@ -894,7 +894,18 @@ static int fd_eject(struct floppy_state *fs)
[]
> -static struct floppy_struct floppy_type = { 2880, 18, 2, 80, 0, 0x1B, 0x00, 0xCF, 0x6C, NULL };	/*  7 1.44MB 3.5"   */
> +static struct floppy_struct floppy_type = {
> +	2880,
> +	18,
> +	2,
> +	80,
> +	0,
> +	0x1B,
> +	0x00,
> +	0xCF,
> +	0x6C,
> +	NULL
> +};	/*  7 1.44MB 3.5"   */

These changes are unattractive to me.
I don't find much wrong with the original though
I would probably have written it as:

static struct floppy_struct floppy_type = {	/* 7 1.44MB 3.5" */
	2880, 18, 2, 80, 0, 0x1B, 0x00, 0xCF, 0x6C, NULL
};


