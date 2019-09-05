From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH V2 3/4] media: platform: Add Mediatek FD driver KConfig
Date: Thu, 5 Sep 2019 15:30:54 +0300
Message-ID: <20190905123054.GL5035@pendragon.ideasonboard.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, po-yang.huang@mediatek.com, suleiman@chromium.org, shik@chromium.org, tfiga@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerry,

Thank you for the patch.

On Tue, Jul 09, 2019 at 04:41:11PM +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds KConfig for Mediatek Face Detection driver (FD).
> FD is embedded in Mediatek SoCs. It can provide hardware
> accelerated face detection function.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

You can squash this patch with 4/4, there's no need to keep it separate.

> ---
>  drivers/media/platform/Kconfig            |  2 ++
>  drivers/media/platform/mtk-isp/fd/Kconfig | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a505e9f..ae99258e 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
>  
>  source "drivers/media/platform/omap/Kconfig"
>  
> +source "drivers/media/platform/mtk-isp/fd/Kconfig"
> +
>  config VIDEO_ASPEED
>  	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
>  	depends on VIDEO_V4L2
> diff --git a/drivers/media/platform/mtk-isp/fd/Kconfig b/drivers/media/platform/mtk-isp/fd/Kconfig
> new file mode 100644
> index 0000000..0c5eaf0
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/Kconfig
> @@ -0,0 +1,17 @@
> +config VIDEO_MEDIATEK_FD
> +	bool "Mediatek face detection processing function"
> +	select DMA_SHARED_BUFFER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_VMALLOC

Do you need both VIDEOBUF2_DMA_CONTIG and VIDEOBUF2_VMALLOC ? The driver
doesn't seem to make use of VIDEOBUF2_VMALLOC.

> +	select MEDIA_CONTROLLER
> +
> +	default n
> +	help
> +		Support the Face Detectioin (FD) feature.

s/Detectioin/Detection/

Maybe "... feature found in the Mediatek <list of SoCs> SoCs." ?

> +
> +		FD driver is a V4L2 memory-to-memory device driver which
> +		provides hardware accelerated face detection function,
> +		it can detect different sizes of faces in a raw image.

-- 
Regards,

Laurent Pinchart
