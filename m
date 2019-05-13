From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC, V2, 06/11] media: platform: Add Mediatek ISP P1 image & meta
 formats
Date: Mon, 13 May 2019 10:35:36 +0200
Message-ID: <5aad30f8-04b0-e3f1-e1d1-def349fd2974@xs4all.nl>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20190510015755.51495-7-jungo.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510015755.51495-7-jungo.lin@mediatek.com>
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
To: Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, seraph.huang@mediatek.com, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5/10/19 3:57 AM, Jungo Lin wrote:
> Add packed/unpacked/full-g bayer format with 8/10/12/14 bit
> for image output. Add Pass 1 (P1) specific meta formats for
> parameter processing and 3A/other statistics.

These pixel formats will need to be documented in Documentation/media/uapi/v4l/pixfmt-<something>.rst.

> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
>  include/uapi/linux/videodev2.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1db220da3bcc..b79046d2d812 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -711,6 +711,20 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
>  #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
>  
> +/* Vendor specific - Mediatek ISP compressed formats */
> +#define V4L2_PIX_FMT_MTISP_U8	v4l2_fourcc('M', 'T', 'U', '8') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U10  v4l2_fourcc('M', 'T', 'U', 'A') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U12  v4l2_fourcc('M', 'T', 'U', 'C') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_U14  v4l2_fourcc('M', 'T', 'U', 'E') /* Unpacked bayer format, 16-bit */
> +#define V4L2_PIX_FMT_MTISP_B8	v4l2_fourcc('M', 'T', 'B', '8') /* Packed   bayer format,  8-bit */
> +#define V4L2_PIX_FMT_MTISP_B10  v4l2_fourcc('M', 'T', 'B', 'A') /* Packed   bayer format, 10-bit */
> +#define V4L2_PIX_FMT_MTISP_B12  v4l2_fourcc('M', 'T', 'B', 'C') /* Packed   bayer format, 12-bit */
> +#define V4L2_PIX_FMT_MTISP_B14  v4l2_fourcc('M', 'T', 'B', 'E') /* Packed   bayer format, 14-bit */
> +#define V4L2_PIX_FMT_MTISP_F8	v4l2_fourcc('M', 'T', 'F', '8') /* Full-G   bayer format,  8-bit */
> +#define V4L2_PIX_FMT_MTISP_F10  v4l2_fourcc('M', 'T', 'F', 'A') /* Full-G   bayer format, 10-bit */
> +#define V4L2_PIX_FMT_MTISP_F12  v4l2_fourcc('M', 'T', 'F', 'C') /* Full-G   bayer format, 12-bit */
> +#define V4L2_PIX_FMT_MTISP_F14  v4l2_fourcc('M', 'T', 'F', 'E') /* Full-G   bayer format, 14-bit */

Are these all compressed formats? What sort of compression is used? Can software unpack it,
or this is meant to be fed to other mediatek hardware blocks?

> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
> @@ -732,6 +746,12 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +/* Vendor specific - Mediatek ISP parameters for firmware */
> +#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p') /* ISP tuning parameters */
> +#define V4L2_META_FMT_MTISP_3A	   v4l2_fourcc('M', 'T', 'f', 'a') /* AE/AWB histogram */
> +#define V4L2_META_FMT_MTISP_AF	   v4l2_fourcc('M', 'T', 'f', 'f') /* AF histogram */
> +#define V4L2_META_FMT_MTISP_LCS	   v4l2_fourcc('M', 'T', 'f', 'c') /* Local contrast enhanced statistics */
> +#define V4L2_META_FMT_MTISP_LMV	   v4l2_fourcc('M', 'T', 'f', 'm') /* Local motion vector histogram */

The documentation for these meta formats either needs to point to
freely available mediatek documentation (i.e. no NDA needed), or it
has to be documented in a header or in the pixelformat documentation.

Regards,

	Hans
