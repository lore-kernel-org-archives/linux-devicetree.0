From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v3] media: OF: add video sync endpoint property
Date: Sun, 30 Jun 2013 17:53:49 +0200
Message-ID: <51D0548D.7020004@gmail.com>
References: <1371913383-25088-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371913383-25088-1-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 06/22/2013 05:03 PM, Prabhakar Lad wrote:
> From: "Lad, Prabhakar"<prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This patch adds video sync properties as part of endpoint
> properties and also support to parse them in the parser.
>
> Signed-off-by: Lad, Prabhakar<prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Hans Verkuil<hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> Cc: Laurent Pinchart<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Mauro Carvalho Chehab<mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Guennadi Liakhovetski<g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
> Cc: Sylwester Nawrocki<s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Sakari Ailus<sakari.ailus-X3B1VOXEql0@public.gmane.org>
> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Rob Landley<rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
> Cc: Kyungmin Park<kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Do you really need such a long Cc list here ? I think it would be better
to just add relevant e-mail addresses when sending the patch, otherwise
when this patch is applied in this form all those addresses are going to
be spammed with the patch management notifications, which might not be
what some ones are really interested in.

> ---
>   This patch has 10 warnings for line over 80 characters
>   for which I think can be ignored.
>
>   RFC v2 https://patchwork.kernel.org/patch/2578091/
>   RFC V1 https://patchwork.kernel.org/patch/2572341/
>   Changes for v3:
>   1: Fixed review comments pointed by Laurent and Sylwester.
>
>   .../devicetree/bindings/media/video-interfaces.txt |    1 +
>   drivers/media/v4l2-core/v4l2-of.c                  |   20 ++++++++++++++++++
>   include/dt-bindings/media/video-interfaces.h       |   17 +++++++++++++++
>   include/media/v4l2-mediabus.h                      |   22 +++++++++++---------
>   4 files changed, 50 insertions(+), 10 deletions(-)
>   create mode 100644 include/dt-bindings/media/video-interfaces.h
>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index e022d2d..2081278 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -101,6 +101,7 @@ Optional endpoint properties
>     array contains only one entry.
>   - clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-continuous
>     clock mode.
> +- video-sync: property indicating to sync the video on a signal in RGB.
>
>
>   Example
> diff --git a/drivers/media/v4l2-core/v4l2-of.c b/drivers/media/v4l2-core/v4l2-of.c
> index aa59639..1a54530 100644
> --- a/drivers/media/v4l2-core/v4l2-of.c
> +++ b/drivers/media/v4l2-core/v4l2-of.c
> @@ -100,6 +100,26 @@ static void v4l2_of_parse_parallel_bus(const struct device_node *node,
>   	if (!of_property_read_u32(node, "data-shift",&v))
>   		bus->data_shift = v;
>
> +	if (!of_property_read_u32(node, "video-sync",&v)) {
> +		switch (v) {
> +		case V4L2_MBUS_VIDEO_SEPARATE_SYNC:
> +			flags |= V4L2_MBUS_VIDEO_SEPARATE_SYNC;

I'm not convinced all those video sync types is something that really 
belongs
to the flags field. In my understanding this field is supposed to hold only
the _signal polarity_ information.

> +			break;
> +		case V4L2_MBUS_VIDEO_COMPOSITE_SYNC:
> +			flags |= V4L2_MBUS_VIDEO_COMPOSITE_SYNC;
> +			break;
> +		case V4L2_MBUS_VIDEO_SYNC_ON_COMPOSITE:
> +			flags |= V4L2_MBUS_VIDEO_SYNC_ON_COMPOSITE;
> +			break;
> +		case V4L2_MBUS_VIDEO_SYNC_ON_GREEN:
> +			flags |= V4L2_MBUS_VIDEO_SYNC_ON_GREEN;
> +			break;
> +		case V4L2_MBUS_VIDEO_SYNC_ON_LUMINANCE:
> +			flags |= V4L2_MBUS_VIDEO_SYNC_ON_LUMINANCE;
> +			break;
> +		}
> +	}
> +
>   	bus->flags = flags;
>
>   }
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 0000000..1a083dd
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,17 @@
> +/*
> + * This header provides constants for video interface.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_VIDEO_INTERFACES_H
> +#define _DT_BINDINGS_VIDEO_INTERFACES_H
> +
> +#define V4L2_MBUS_VIDEO_SEPARATE_SYNC		(1<<  2)

You should never be putting anything Linux specific in those dt-bindings
headers. It just happens now include/dt-bindings is a part of the Linux
kernel, but it could well be in some separate repository, or could be
a part of the DT bindings specification, which is only specific to the
hardware and doesn't depend on Linux OS at all. Thus V4L2_MBUS_ prefix
shouldn't be used here.

> +#define V4L2_MBUS_VIDEO_COMPOSITE_SYNC		(1<<  3)
> +#define V4L2_MBUS_VIDEO_SYNC_ON_COMPOSITE	(1<<  4)
> +#define V4L2_MBUS_VIDEO_SYNC_ON_GREEN		(1<<  5)
> +#define V4L2_MBUS_VIDEO_SYNC_ON_LUMINANCE	(1<<  6)
> +
> +#define V4L2_MBUS_VIDEO_INTERFACES_END		6
> +
> +#endif
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 83ae07e..a4676dd 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -11,6 +11,8 @@
>   #ifndef V4L2_MEDIABUS_H
>   #define V4L2_MEDIABUS_H
>
> +#include<dt-bindings/media/video-interfaces.h>
> +
>   #include<linux/v4l2-mediabus.h>
>
>   /* Parallel flags */
> @@ -28,18 +30,18 @@
>    * V4L2_MBUS_[HV]SYNC* flags should be also used for specifying
>    * configuration of hardware that uses [HV]REF signals
>    */
> -#define V4L2_MBUS_HSYNC_ACTIVE_HIGH		(1<<  2)
> -#define V4L2_MBUS_HSYNC_ACTIVE_LOW		(1<<  3)
> -#define V4L2_MBUS_VSYNC_ACTIVE_HIGH		(1<<  4)
> -#define V4L2_MBUS_VSYNC_ACTIVE_LOW		(1<<  5)
> -#define V4L2_MBUS_PCLK_SAMPLE_RISING		(1<<  6)
> -#define V4L2_MBUS_PCLK_SAMPLE_FALLING		(1<<  7)
> -#define V4L2_MBUS_DATA_ACTIVE_HIGH		(1<<  8)
> -#define V4L2_MBUS_DATA_ACTIVE_LOW		(1<<  9)
> +#define V4L2_MBUS_HSYNC_ACTIVE_HIGH		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 1))

No, please don't do that. We shouldn't combine the DT and Linux kernel
definitions like this.

> +#define V4L2_MBUS_HSYNC_ACTIVE_LOW		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 2))
> +#define V4L2_MBUS_VSYNC_ACTIVE_HIGH		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 3))
> +#define V4L2_MBUS_VSYNC_ACTIVE_LOW		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 4))
> +#define V4L2_MBUS_PCLK_SAMPLE_RISING		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 5))
> +#define V4L2_MBUS_PCLK_SAMPLE_FALLING		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 6))
> +#define V4L2_MBUS_DATA_ACTIVE_HIGH		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 7))
> +#define V4L2_MBUS_DATA_ACTIVE_LOW		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 8))
>
>   /* FIELD = 0/1 - Field1 (odd)/Field2 (even) */
> -#define V4L2_MBUS_FIELD_EVEN_HIGH		(1<<  10)
> +#define V4L2_MBUS_FIELD_EVEN_HIGH		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 9))
>   /* FIELD = 1/0 - Field1 (odd)/Field2 (even) */
> -#define V4L2_MBUS_FIELD_EVEN_LOW		(1<<  11)
> +#define V4L2_MBUS_FIELD_EVEN_LOW		(1<<  (V4L2_MBUS_VIDEO_INTERFACES_END + 10))

Please see my review of your 'media: i2c: tvp7002: add OF support" patch.
AFAICS it should be sufficient to add only V4L2_MBUS_SOG_ACTIVE_{LOW,HIGH}
flags and 'sync-on-green-active' DT property.

--
Thanks,
Sylwester
