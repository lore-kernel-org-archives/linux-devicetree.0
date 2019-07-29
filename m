From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
Date: Mon, 29 Jul 2019 18:57:08 +0900
Message-ID: <CAAFQd5A0Qi==m4O9L2W3Qmdx4g8acs-kjBtHjLBNCBpoGd5ZSw@mail.gmail.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <eb3bb92d-5d44-0d45-2e90-abcdb96f595d@metux.net>
 <1564380061.15267.383.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564380061.15267.383.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <Frederic.Chen@mediatek.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= <po-yang.huang@mediatek.com>, "suleiman@chromium.org" <suleiman@chromium.org>, =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>, "shik@chromium.org" <shik@chromium.org>, "yuzhao@chromium.org" <yuzhao@chromium.org>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, "zwisler@chromium.org" <zwisler@chromium.org>, "hans.verkuil@cisco.com" <hans.verkuil@ci>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 3:01 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Enrico,
>
> On Tue, 2019-07-09 at 18:56 +0800, Enrico Weigelt, metux IT consult
> wrote:
> > On 09.07.19 10:41, Jerry-ch Chen wrote:
> >
> > Hi,
> >
> >
> > > diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd.h b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > new file mode 100644
> > > index 0000000..289999b
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > @@ -0,0 +1,157 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +//
> > > +// Copyright (c) 2018 MediaTek Inc.
> > > +
> > > +#ifndef __MTK_FD_HW_H__
> > > +#define __MTK_FD_HW_H__
> > > +
> > > +#include <linux/io.h>
> > > +#include <linux/types.h>
> > > +#include <linux/platform_device.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/videobuf2-v4l2.h>
> > > +
> > > +#define MTK_FD_OUTPUT_MIN_WIDTH                    26U
> > > +#define MTK_FD_OUTPUT_MIN_HEIGHT           26U
> > > +#define MTK_FD_OUTPUT_MAX_WIDTH                    640U
> > > +#define MTK_FD_OUTPUT_MAX_HEIGHT           480U
> > > +
> > > +/* Control the user defined image widths and heights
> > > + * to be scaled and performed face detection in FD HW.
> > > + * MTK FD support up to 14 user defined image sizes to perform face detection.
> > > + */
> > > +#define V4L2_CID_MTK_FD_SCALE_IMG_WIDTH            (V4L2_CID_USER_MTK_FD_BASE + 1)
> > > +#define V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT   (V4L2_CID_USER_MTK_FD_BASE + 2)
> >
> > I've got a *really* bad feeling about introducing chip specific
> > uapi stuff. (by the way: uapi stuff belongs into include/uapi/...)
> >
> Thanks for your comments,
>
> If we remain chip-specific control IDs, I will move the uapi stuff into
> inlcude/uapi/mtk_fd.h (filename TBD)
>
> > Maybe you could tell us what that's *really* about, so we can find some
> > standard / chip-independent api for these things. That's one of the
> > major point of the kernel: hardware abstraction.
> >
> I am not sure if it is possible for us to add some standard
> v4l2-controls for face detection, a further explanations of controls are
> listed below.
>
> In v4l2-controls, there exists V4L2_CID_DETECT_CLASS, but I haven't
> found the standards or api that can be used for face detection yet.
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/v4l2-controls.h#L1092
>
> For detecting certain face angle and head direction, we would need
> V4L2_CID_DETECT_ANGLE, V4L2_CID_DETECT_DIRECTION controls for user to
> specify the angle and direction to be detected.
> In MTK FD driver, we support the following angles and directions to be
> selected by user, and they are both multiple selected .
> FD_angle_table[] = {-90, -45, 0 , 45, 90}
> FD_direction_table[] = {0, 30, 60, 90, 120, 150, ..., 330}
>
> Assuming these v4l2-controls are array of V4L2_CTRL_TYPE_U16 with
> dimension 5 and 12.
> User can select the desired angle and directions to be detected into
> arrays and bring it to driver by these controls, however, the more they
> select, the longer execution time needed by HW.
>

Sounds like we need some kind of a menu bitmask control here, but I
don't see V4L2 having anything like that.

Hans, Sakari, any ideas?

> For detecting different sizes of faces and increase the detection speed,
> FD driver might need to scales down the input image into different
> smaller sizes

Do you mean the FD hardware would do the scaling or the driver code
itself? It would be undesirable to do such scaling in a kernel driver,
so if that's not something handled by the hardware, the downscaled
image might need to be provided from the userspace.

>, besides driver default values, user or proprietary
> algorithm library can manually set the desired image sizes, therefore,
> we would need the following controls:
> V4L2_CID_DETECT_SCALE_DOWN_IMG_WIDTH and
> V4L2_CID_DETECT_SCALE_DOWN_IMG_HEIGHT.
> In MTK FD driver, we implement these controls as array of
> V4L2_CTRL_TYPE_U16 with the dimension 15.

Why 15?

>
> For controlling detection speed, we would need the
> V4L2_CID_DETECT_SPEED, the faster speedup implies the lower accuracy of
> detection, In MTK FD driver, the max level of speedup is 7, and default
> value is 0.
>
> For MTK FD algorithm user library, they would need select extra
> detection features(models) used in HW, we need
> V4L2_CID_MTK_FD_EXTRA_MODEL, this will be set to 1 for using extra
> model. However, we are considering make this control more
> chip-independent and can be added into standard.
> for example, V4L2_CID_DETECTION_FD_MODEL or ...FD_ALGO,
> drivers can define the detection algorithm or detection model to be used
> for users to select. How do you think?

Sounds like something that could be a menu control, so it could vary
between drivers.

>
> In short, I summery the control IDs as following:
> V4L2_CID_DETECT_ANGLE: set the angle of face in degrees. 90 ~ -90
> degrees.
> V4L2_CID_DETECT_DIRECTION: set the rotation of the head in degrees.
> 0~330 degrees.
> V4L2_CID_DETECT_SCALE_DOWN_IMG_WIDTH: set the image widths for an input
> image to be scaled down for face detection
> V4L2_CID_DETECT_SCALE_DOWN_IMG_HEIGHT: set the image heights for an
> input image to be scaled down for face detection
> V4L2_CID_DETECT_SPEED: set the detection speed, usually reducing
> accuracy.
> V4L2_CID_DETECTION_FD_MODEL: select the detection model or algorithm to
> be used by face detection driver.
>
> > > +#define ENABLE_FD                          0x111
> > > +#define FD_HW_ENABLE                               0x4
> > > +#define FD_INT_EN                          0x15c
> > > +#define FD_INT                                     0x168
> > > +#define FD_RESULT                          0x178
> > > +#define FD_IRQ_MASK                                0x001
> > > +
> > > +#define RS_MAX_BUF_SIZE                            2288788
> > > +#define FD_MAX_SPEEDUP                             7
> > > +#define FD_MAX_POSE_VAL                            0xfffffffffffffff
> > > +#define FD_DEF_POSE_VAL                            0x3ff
> > > +#define MAX_FD_SEL_NUM                             1026
> >
> > If that file is supposed to be included by anything beyond the driver
> > itself, we need proper prefixing. (same for anything else in here)
> >
> I will fix it as following:
>
> #define FD_ENABLE    0x111
>
> #define FD_REG_OFFSET_HW_ENABLE  0x4
> #define FD_REG_OFFSET_INT_EN     0x15c
> #define FD_REG_OFFSET_INT_VAL    0x168
> #define FD_REG_OFFSET_RESULT     0x178
>
> #define FD_IRQ_MASK         1
> #define FD_MAX_RS_BUF_SIZE  2288788
> #define FD_MAX_SPEEDUP      7
> #define FD_MAX_RESULT_NUM   1026
>

I'd suggest the MTK_FD_ prefix.

> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index 3dcfc61..eae876e 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -192,6 +192,10 @@ enum v4l2_colorfx {
> > >   * We reserve 16 controls for this driver. */
> > >  #define V4L2_CID_USER_IMX_BASE                     (V4L2_CID_USER_BASE + 0x10b0)
> > >
> > > +/* The base for the mediatek FD driver controls */
> > > +/* We reserve 16 controls for this driver. */
> > > +#define V4L2_CID_USER_MTK_FD_BASE          (V4L2_CID_USER_BASE + 0x10d0)
> >
> > Why only the base, but not the actual IDs in uapi ?
> >
> I will put actual IDs in uapi/ for user to reference.
>
> >
> > --mtx
> >
>

Best regards,
Tomasz
