From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
Date: Mon, 2 Sep 2019 15:26:39 +0100
Message-ID: <20190902142639.GA13947@bogus>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
 <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 24, 2019 at 03:28:46PM +0200, Uwe Kleine-König wrote:
> Referencing device tree nodes from a property allows to pass arguments.
> This is for example used for referencing gpios. This looks as follows:
> 
> 	gpio_ctrl: gpio-controller {
> 		#gpio-cells = <2>
> 		...
> 	}
> 
> 	someothernode {
> 		gpios = <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
> 		...
> 	}
> 
> To know the number of arguments this must be either fixed, or the
> referenced node is checked for a $cells_name (here: "#gpio-cells")
> property and with this information the start of the second reference can
> be determined.
> 
> Currently regulators are referenced with no additional arguments. To
> allow some optional arguments without having to change all referenced
> nodes this change introduces a way to specify a default cell_count. So
> when a phandle is parsed we check for the $cells_name property and use
> it as before if present. If it is not present we fall back to
> cells_count if non-negative and only fail if cells_count is smaller than
> zero.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/of/base.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Looks fine to me. I can apply with an ack from the iommu folks on patch 
1.

Rob
