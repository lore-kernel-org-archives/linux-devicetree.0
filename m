From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v9 00/21] MT8183 IOMMU SUPPORT
Date: Wed, 14 Aug 2019 10:18:25 +0200
Message-ID: <20190814081825.GA22669@8bytes.org>
References: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, cui.zhang@mediatek.com, chao.hao@mediatek.com, ming-fan.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Sat, Aug 10, 2019 at 03:58:00PM +0800, Yong Wu wrote:
> Change notes:
> v9:
>    1) rebase on v5.3-rc1.
>    2) In v7s, Use oas to implement MTK 4GB mode. It nearly reconstruct the
>       patch, so I don't keep the R-b.

Okay, this looks close to being ready, just the io-pgtable patches still
need review.


Regards,

	Joerg
