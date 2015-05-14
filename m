From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 2/4] edac, altera: Refactor EDAC for Altera CycloneV SoC.
Date: Thu, 14 May 2015 15:13:28 -0500
Message-ID: <555501E8.105@opensource.altera.com>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
 <1431553787-27741-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431553787-27741-3-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On 05/13/2015 04:49 PM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> The Arria10 SOC uses a completely different SDRAM controller from the
> earlier CycloneV and ArriaV SoCs. This patch abstracts the SDRAM bits
> for the CycloneV/ArriaV SoCs in preparation for the Arria10 support.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  drivers/edac/altera_edac.c |  194 ++++++++++++++++++++------------------------
>  drivers/edac/altera_edac.h |  116 ++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/edac/altera_edac.h
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index e18a205..204ad2d 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1,5 +1,5 @@
>  /*
> - *  Copyright Altera Corporation (C) 2014. All rights reserved.
> + *  Copyright Altera Corporation (C) 2014-2015. All rights reserved.
>   *  Copyright 2011-2012 Calxeda, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify it
> @@ -28,111 +28,64 @@
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
>  
[...]
> -
> -/* Altera SDRAM Memory Controller data */
> -struct altr_sdram_mc_data {
> -	struct regmap *mc_vbase;
> +const struct altr_sdram_prv_data c5_data = {

This should be static.

Dinh
