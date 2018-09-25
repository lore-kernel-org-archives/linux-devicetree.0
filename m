From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/4] soc: mediatek: use group of bits for pwrap capability
Date: Tue, 25 Sep 2018 15:53:19 +0200
Message-ID: <afdd9f28-1c54-e936-e54e-0cc05526585c@gmail.com>
References: <1537341961-20736-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1537341961-20736-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537341961-20736-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: argus.lin@mediatek.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 19/09/2018 09:25, Hsin-Hsiung Wang wrote:
> Use group of bits for pwrap capability instead of
> elements of structure.
> This patch is preparing for adding mt8183 pwrap support.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

I split this patch in two, one for the ordering of the SoCs and PMIC numbers and
the second one for adding the CAPs.
Please have a look if I didn't screw up :)

Applied to v4.19-next/soc

Thanks!
