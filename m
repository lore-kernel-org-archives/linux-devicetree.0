From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/1] dmaengine: mediatek-cqdma: fix wrong register usage
 in mtk_cqdma_start
Date: Fri, 26 Apr 2019 17:28:40 +0530
Message-ID: <20190426115840.GA28103@vkoul-mobl>
References: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shun-chih.yu@mediatek.com
Cc: Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 25-04-19, 11:53, shun-chih.yu@mediatek.com wrote:
> From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> 
> This patch fixes wrong register usage in the mtk_cqdma_start. The
> destination register should be MTK_CQDMA_DST2 instead.

Applied and cced stable, thanks
-- 
~Vinod
