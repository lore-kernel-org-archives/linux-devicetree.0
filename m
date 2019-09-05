From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Subject: Re: [RFC PATCH V2 3/4] media: platform: Add Mediatek FD driver KConfig
Date: Thu, 5 Sep 2019 22:14:12 +0800
Message-ID: <1567692852.22453.55.camel@mtksdccf07>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190905123054.GL5035@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190905123054.GL5035@pendragon.ideasonboard.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= <Sean.Cheng@mediatek.com>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= <Rynn.Wu@mediatek.com>, Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= <christie.yu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= <po-yang.huang@mediatek.com>, "suleiman@chromium.org" <suleiman@chromium.org>, "shik@chromium.org" <shik@chromium.org>, "tfiga@chromium.org" <tfiga@chromium.org>, Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= <jungo.lin@mediatek.com>, Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>, hans.ver
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Thu, 2019-09-05 at 20:30 +0800, Laurent Pinchart wrote:
> Hi Jerry,
> 
> Thank you for the patch.
> 
> On Tue, Jul 09, 2019 at 04:41:11PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > 
> > This patch adds KConfig for Mediatek Face Detection driver (FD).
> > FD is embedded in Mediatek SoCs. It can provide hardware
> > accelerated face detection function.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> You can squash this patch with 4/4, there's no need to keep it separate.
> 

I appreciate your comments,

Ok, I will squash it.

> > ---
> >  drivers/media/platform/Kconfig            |  2 ++
> >  drivers/media/platform/mtk-isp/fd/Kconfig | 17 +++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> > 
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index a505e9f..ae99258e 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
> >  
> >  source "drivers/media/platform/omap/Kconfig"
> >  
> > +source "drivers/media/platform/mtk-isp/fd/Kconfig"
> > +
> >  config VIDEO_ASPEED
> >  	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> >  	depends on VIDEO_V4L2
> > diff --git a/drivers/media/platform/mtk-isp/fd/Kconfig b/drivers/media/platform/mtk-isp/fd/Kconfig
> > new file mode 100644
> > index 0000000..0c5eaf0
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/Kconfig
> > @@ -0,0 +1,17 @@
> > +config VIDEO_MEDIATEK_FD
> > +	bool "Mediatek face detection processing function"
> > +	select DMA_SHARED_BUFFER
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select VIDEOBUF2_CORE
> > +	select VIDEOBUF2_V4L2
> > +	select VIDEOBUF2_MEMOPS
> > +	select VIDEOBUF2_VMALLOC
> 
> Do you need both VIDEOBUF2_DMA_CONTIG and VIDEOBUF2_VMALLOC ? The driver
> doesn't seem to make use of VIDEOBUF2_VMALLOC.
> 

No, I should remove it. and also would like to update as following:

        depends on VIDEO_V4L2
        depends on ARCH_MEDIATEK || COMPILE_TEST
        select VIDEOBUF2_DMA_CONTIG
        select VIDEOBUF2_CORE
        select VIDEOBUF2_V4L2
        select VIDEOBUF2_MEMOPS
        select MEDIA_CONTROLLER
        select MTK_SCP

> > +	select MEDIA_CONTROLLER
> > +
> > +	default n
> > +	help
> > +		Support the Face Detectioin (FD) feature.
> 
> s/Detectioin/Detection/
> 
Typo fixed.

> Maybe "... feature found in the Mediatek <list of SoCs> SoCs." ?

I will refine as:
Support the Face Detection (FD) feature in the Mediatek mt8183 Soc.

Thanks and best regards,
Jerry
> 
> > +
> > +		FD driver is a V4L2 memory-to-memory device driver which
> > +		provides hardware accelerated face detection function,
> > +		it can detect different sizes of faces in a raw image.
> 
