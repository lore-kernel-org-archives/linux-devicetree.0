From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH RFC v4] media: OF: add "sync-on-green-active" property
Date: Tue, 16 Jul 2013 22:38:13 +0200
Message-ID: <51E5AF35.2080301@gmail.com>
References: <1373995163-9412-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1373995163-9412-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LMML <linux-media@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On 07/16/2013 07:19 PM, Prabhakar Lad wrote:
> From: "Lad, Prabhakar"<prabhakar.csengg@gmail.com>
>
> This patch adds 'sync-on-green-active' property as part
> of endpoint property.
>
> Signed-off-by: Lad, Prabhakar<prabhakar.csengg@gmail.com>
> ---
>    Changes for v4:
>    1: Fixed review comments pointed by Sylwester.
>
>    Changes for v3:
>    1: Fixed review comments pointed by Laurent and Sylwester.
>
>    RFC v2 https://patchwork.kernel.org/patch/2578091/
>
>    RFC V1 https://patchwork.kernel.org/patch/2572341/
>
>   .../devicetree/bindings/media/video-interfaces.txt |    3 +++
>   drivers/media/v4l2-core/v4l2-of.c                  |    4 ++++
>   include/media/v4l2-mediabus.h                      |    2 ++
>   3 files changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index e022d2d..5186c7e 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -101,6 +101,9 @@ Optional endpoint properties
>     array contains only one entry.
>   - clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-continuous
>     clock mode.
> +- sync-on-green-active: polarity field when video synchronization is
> +  Sync-On-Green. When set the driver determines whether it's a normal operation
> +  or inverted operation.

Would you mind adding this entry after pclk-sample property description ?
And how about describing it a bit more precisely and similarly to 
VSYNC/HSYNC,
e.g.

- sync-on-green-active: active state of Sync-on-green (SoG) signal,
   0/1 for LOW/HIGH respectively.

Otherwise looks good.

>   Example
> diff --git a/drivers/media/v4l2-core/v4l2-of.c b/drivers/media/v4l2-core/v4l2-of.c
> index aa59639..5c4c9f0 100644
> --- a/drivers/media/v4l2-core/v4l2-of.c
> +++ b/drivers/media/v4l2-core/v4l2-of.c
> @@ -100,6 +100,10 @@ static void v4l2_of_parse_parallel_bus(const struct device_node *node,
>   	if (!of_property_read_u32(node, "data-shift",&v))
>   		bus->data_shift = v;
>
> +	if (!of_property_read_u32(node, "sync-on-green-active",&v))
> +		flags |= v ? V4L2_MBUS_VIDEO_SOG_ACTIVE_HIGH :
> +			V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW;
> +
>   	bus->flags = flags;
>
>   }
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 83ae07e..d47eb81 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -40,6 +40,8 @@
>   #define V4L2_MBUS_FIELD_EVEN_HIGH		(1<<  10)
>   /* FIELD = 1/0 - Field1 (odd)/Field2 (even) */
>   #define V4L2_MBUS_FIELD_EVEN_LOW		(1<<  11)
> +#define V4L2_MBUS_VIDEO_SOG_ACTIVE_HIGH	(1<<  12)
> +#define V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW		(1<<  13)
>
>   /* Serial flags */
>   /* How many lanes the client can use */

Thanks,
Sylwester
