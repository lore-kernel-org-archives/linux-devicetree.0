From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: add mt8183 pwrap support
Date: Tue, 25 Sep 2018 15:52:26 +0200
Message-ID: <bb3ac4fb-a67e-93b0-c409-ead9504de896@gmail.com>
References: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1537341961-20736-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537341961-20736-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: argus.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 19/09/2018 09:26, Hsin-Hsiung Wang wrote:
> MT6358 is a new power management IC and it is used for
> mt8183 SoCs. To define mt6358_regs for pmic register
> mapping and pmic_mt6358 for accessing register.
> Adding one more interrupt and wdt source.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 195 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 191 insertions(+), 4 deletions(-)
> 


Applied to v4.19-next/soc

Thanks!
