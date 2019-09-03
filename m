From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v1 1/2] iommu: pass cell_count = -1 to
 of_for_each_phandle with cells_name
Date: Tue, 3 Sep 2019 14:52:10 +0200
Message-ID: <20190903125210.GB11530@8bytes.org>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Sat, Aug 24, 2019 at 03:28:45PM +0200, Uwe Kleine-König wrote:
> Currently of_for_each_phandle ignores the cell_count parameter when a
> cells_name is given. I intend to change that and let the iterator fall
> back to a non-negative cell_count if the cells_name property is missing
> in the referenced node.
> 
> To not change how existing of_for_each_phandle's users iterate, fix them
> to pass cell_count = -1 when also cells_name is given which yields the
> expected behaviour with and without my change.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/iommu/arm-smmu.c     | 2 +-
>  drivers/iommu/mtk_iommu_v1.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Joerg Roedel <jroedel@suse.de>
