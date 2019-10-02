From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH V3 1/5] dt-bindings: mt8183: Added DIP dt-bindings
Date: Wed, 2 Oct 2019 12:22:54 +0300
Message-ID: <20191002092254.GQ896@valkosipuli.retiisi.org.uk>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-2-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-2-frederic.chen@mediatek.com>
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

On Tue, Sep 10, 2019 at 03:22:40AM +0800, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> This patch adds DT binding documentation for the Digital Image
> Processing (DIP) unit of camera ISP system on Mediatek's SoCs.
> 
> It depends on the SCP and MDP 3 patch as following:
> 
> 1. dt-bindings: Add a binding for Mediatek SCP
>    https://patchwork.kernel.org/patch/11027247/
> 2. dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
>    https://patchwork.kernel.org/patch/10945603/
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  .../bindings/media/mediatek,mt8183-dip.txt    | 40 +++++++++++++++++++

Could you add a MAINTAINERS entry for this, please? Same for the driver.

-- 
Sakari Ailus
