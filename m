From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
Date: Tue, 9 Jul 2019 12:56:08 +0200
Message-ID: <eb3bb92d-5d44-0d45-2e90-abcdb96f595d@metux.net>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, po-yang.huang@mediatek.com, suleiman@chromium.org, sj.huang@mediatek.com, jungo.lin@mediatek.com, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09.07.19 10:41, Jerry-ch Chen wrote:

Hi,


> diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd.h b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> new file mode 100644
> index 0000000..289999b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#ifndef __MTK_FD_HW_H__
> +#define __MTK_FD_HW_H__
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH			26U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT		26U
> +#define MTK_FD_OUTPUT_MAX_WIDTH			640U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT		480U
> +
> +/* Control the user defined image widths and heights
> + * to be scaled and performed face detection in FD HW.
> + * MTK FD support up to 14 user defined image sizes to perform face detection.
> + */
> +#define V4L2_CID_MTK_FD_SCALE_IMG_WIDTH		(V4L2_CID_USER_MTK_FD_BASE + 1)
> +#define V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT	(V4L2_CID_USER_MTK_FD_BASE + 2)

I've got a *really* bad feeling about introducing chip specific
uapi stuff. (by the way: uapi stuff belongs into include/uapi/...)

Maybe you could tell us what that's *really* about, so we can find some
standard / chip-independent api for these things. That's one of the
major point of the kernel: hardware abstraction.

> +#define ENABLE_FD				0x111
> +#define FD_HW_ENABLE				0x4
> +#define FD_INT_EN				0x15c
> +#define FD_INT					0x168
> +#define FD_RESULT				0x178
> +#define FD_IRQ_MASK				0x001
> +
> +#define RS_MAX_BUF_SIZE				2288788
> +#define FD_MAX_SPEEDUP				7
> +#define FD_MAX_POSE_VAL				0xfffffffffffffff
> +#define FD_DEF_POSE_VAL				0x3ff
> +#define MAX_FD_SEL_NUM				1026

If that file is supposed to be included by anything beyond the driver
itself, we need proper prefixing. (same for anything else in here)

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 3dcfc61..eae876e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -192,6 +192,10 @@ enum v4l2_colorfx {
>   * We reserve 16 controls for this driver. */
>  #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
>  
> +/* The base for the mediatek FD driver controls */
> +/* We reserve 16 controls for this driver. */
> +#define V4L2_CID_USER_MTK_FD_BASE		(V4L2_CID_USER_BASE + 0x10d0)

Why only the base, but not the actual IDs in uapi ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
