Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:50200 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbfAGLhQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 06:37:16 -0500
Date: Mon, 7 Jan 2019 13:37:09 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 03/12] media: mt9m001: convert to SPDX license identifer
Message-ID: <20190107113708.oex222eb6ndd3hou@kekkonen.localdomain>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-4-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545498774-11754-4-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

Hi Mita-san,

On Sun, Dec 23, 2018 at 02:12:45AM +0900, Akinobu Mita wrote:
> Replace GPL license statements with SPDX license identifiers (GPL-2.0).
> 
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/media/i2c/mt9m001.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index a1a85ff..65ff59d 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Driver for MT9M001 CMOS Image Sensor from Micron
>   *
>   * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>   */
>  
>  #include <linux/videodev2.h>

The MODULE_LICENSE macro at the end of the file lists "GPL" as the license,
i.e. including later versions. I'm not sure what was the intention
originally. I guess it's safer to stick to 2.0, at least unless the
original author is able to shed some light into this.

Guennadi?

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
