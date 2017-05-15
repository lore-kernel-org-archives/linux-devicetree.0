From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mt8173: Fix mdp device tree
Date: Mon, 15 May 2017 15:48:56 -0500
Message-ID: <20170515204856.p7zwsfwear5b6nyx@rob-hp-laptop>
References: <1494559361-42835-1-git-send-email-minghsiu.tsai@mediatek.com>
 <1494559361-42835-2-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1494559361-42835-2-git-send-email-minghsiu.tsai@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Houlong Wei <houlong.wei@mediatek.com>, srv_heupstream@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Wu-Cheng Li <wuchengli@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 12, 2017 at 11:22:39AM +0800, Minghsiu Tsai wrote:
> If the mdp_* nodes are under an mdp sub-node, their corresponding
> platform device does not automatically get its iommu assigned properly.
> 
> Fix this by moving the mdp component nodes up a level such that they are
> siblings of mdp and all other SoC subsystems.  This also simplifies the
> device tree.
> 
> Although it fixes iommu assignment issue, it also break compatibility
> with old device tree. So, the patch in driver is needed to iterate over
> sibling mdp device nodes, not child ones, to keep driver work properly.
> 
> Signed-off-by: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> 
> ---
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
