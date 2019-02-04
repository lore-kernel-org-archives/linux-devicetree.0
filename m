Return-Path: <SRS0=1YNY=QL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:55048 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbfBDJGg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Feb 2019 04:06:36 -0500
Date: Mon, 4 Feb 2019 11:05:21 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 00/13] media: mt9m001: switch soc_mt9m001 to a
 standard subdev sensor driver
Message-ID: <20190204090521.5ngcycuvccvfrpqb@valkosipuli.retiisi.org.uk>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Mita-san,

On Tue, Jan 08, 2019 at 11:51:37PM +0900, Akinobu Mita wrote:
> This patchset converts soc_camera mt9m001 driver to a standard subdev
> sensor driver.
> 
> * v2
> - Update binding doc suggested by Rob Herring.
> - Fix MODULE_LICENSE() masmatch.
> - Sort headers alphabetically.
> - Add new label for error handling in s_stream() callback.
> - Replace pm_runtime_get_noresume() + pm_runtime_put_sync() with a
>   single pm_runtime_idle() call in probe() function.
> - Change the argument of mt9m001_power_o{n,ff} to struct device, and
>   use them for runtime PM callbacks directly.
> - Remove redundant Kconfig dependency
> - Preserve subdev flags set by v4l2_i2c_subdev_init().
> - Set initial try format with default configuration instead of
>   current one.

While this set improved the original mt9m001 driver a lot, it did not add a
MAINTAINERS entry for it. The same applies to the mt9m111 driver.

Could you provide the MAINTAINERS entries for the two drivers, please?

Thanks.

-- 
Kind regards,

Sakari Ailus
