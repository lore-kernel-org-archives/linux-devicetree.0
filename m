From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v8] media: i2c: add support for omnivision's ov2659 sensor
Date: Fri, 20 Mar 2015 17:35:48 +0530
Message-ID: <550C0D1C.1070200@gmail.com>
References: <1426852133-14539-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426852133-14539-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lad Prabhakar <prabhakar.csengg@gmail.com>, LMML <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/20/2015 05:18 PM, Lad Prabhakar wrote:

> From: Benoit Parrot <bparrot@ti.com>
>
> this patch adds support for omnivision's ov2659
> sensor, the driver supports following features:
> 1: Asynchronous probing
> 2: DT support
> 3: Media controller support
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Changes for v8:
>   --------------
>   a. Now setting the link_frequency control in set_fmt
>      callback instead of implementing g_volatile_ctrl()
>      for it and setting it there.
>
>   v7: https://patchwork.kernel.org/patch/6034651/
>   v6: https://patchwork.kernel.org/patch/6012751/
>   v5: https://patchwork.kernel.org/patch/6000161/
>   v4: https://patchwork.kernel.org/patch/5961661/
>   v3: https://patchwork.kernel.org/patch/5959401/
>   v2: https://patchwork.kernel.org/patch/5859801/
>   v1: https://patchwork.linuxtv.org/patch/27919/
>
>   .../devicetree/bindings/media/i2c/ov2659.txt       |   38 +
>   MAINTAINERS                                        |   10 +
>   drivers/media/i2c/Kconfig                          |   11 +
>   drivers/media/i2c/Makefile                         |    1 +
>   drivers/media/i2c/ov2659.c                         | 1528 ++++++++++++++++++++
>   include/media/ov2659.h                             |   33 +
>   6 files changed, 1621 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2659.txt
>   create mode 100644 drivers/media/i2c/ov2659.c
>   create mode 100644 include/media/ov2659.h
>
(...)

> +static struct ov2659_platform_data *
> +ov2659_get_pdata(struct i2c_client *client)
> +{
> +	struct ov2659_platform_data *pdata;
> +	struct device_node *endpoint;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node) {
> +		dev_err(&client->dev, "ov2659_get_pdata: DT Node found\n");

ov2659_get_pdata: DT Node *not* found...?

-- 
Varka Bhadram
