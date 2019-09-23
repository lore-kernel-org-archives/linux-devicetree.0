From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH V3 0/5] media: platform: Add support for Digital
 Image Processing (DIP) on mt8183 SoC
Date: Mon, 23 Sep 2019 15:11:40 +0300
Message-ID: <20190923121140.GN5525@valkosipuli.retiisi.org.uk>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-1-frederic.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: frederic.chen@mediatek.com
Cc: laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, Allan.Yang@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, hans.verkuil@cisco.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, holmes.chiou@mediatek.com, shik@chromium.org, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com, srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org
List-Id: devicetree@vger.kernel.org

Hi Frederic,

On Tue, Sep 10, 2019 at 03:22:39AM +0800, frederic.chen@mediatek.com wrote:
> Hello,
> 
> This RFC patch series added Digital Image Processing (DIP) driver on Mediatek
> mt8183 SoC. It belongs to the Mediatek's ISP driver series based on V4L2 and
> media controller framework. I posted the main part of the DIP driver as RFC to
> discuss first and would like some review comments.

Could you post media-ctl -p and media-ctl --print-dot outputs for this
driver, please?

-- 
Sakari Ailus
